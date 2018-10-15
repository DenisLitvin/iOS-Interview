import Foundation

struct Anchor {
    let index: Int
    let health: Int
}

struct Strand {
    let value: [Character]
    let lowerBound: Int
    let higherBound: Int
}

class Node {
    var value: Character!
    var branches = [Character: Node]()
    var anchors = [Anchor]()

    init(value: Character? = nil) {
        self.value = value
    }
    
    func insertGene(string: String, index: Int, health: Int) {
        if string.isEmpty { return }
        var lastNode = self
        for char in string {
            lastNode = lastNode.makeBranch(with: char)
        }
        lastNode.anchors.append(Anchor(index: index, health: health))
    }
    
    private func makeBranch(with char: Character) -> Node {
        let node = branches[char] ?? Node(value: char)
        branches[char] = node
        return node
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        return "anchors - \(self.anchors) \nbranches - \(self.branches)"
    }
}

/*
 Calculate overall health in strand of genes.
 You presented with a table of genes, each gene has index and health value.
 Strand has requirements for possible genes indices it comprises of.
 Strand may contain repetitive genes with the same genom.
 
 Example:
 idx     0  1  2
 gen     a aa ab
 hp      2  3  4
 */


//O(n) - time
//O(n) - space
func calculate(in strand: Strand, root: Node) -> Int {
    var result = 0
    for startIdx in 0 ..< strand.value.count {
        result += calculateHelper(in: Strand(value: Array(strand.value.dropFirst(startIdx)),
                                             lowerBound: strand.lowerBound,
                                             higherBound: strand.higherBound),
                                  node: root)
    }
    return result
}

func calculateHelper(in strand: Strand, node: Node) -> Int {
    guard let char = strand.value.first else { return 0 }
    var health = 0
    if let branch = node.branches[char] {
        branch.anchors.forEach { health += strand.lowerBound ... strand.higherBound ~= $0.index ? $0.health : 0 }
        health += calculateHelper(in: Strand(value: Array(strand.value.dropFirst()),
                                             lowerBound: strand.lowerBound,
                                             higherBound: strand.higherBound),
                                  node: branch)
    }
    return health
}

func findResult(for strands: [Strand], root: Node, health: [Int], genes: [String]) -> (min: Int, max: Int) {
    var min: Int = Int.max
    var max: Int = Int.min
    
    for strand in strands {
        let result = calculate(in: strand, root: root)
        if result < min { min = result }
        if result > max { max = result }
    }
    return (min, max)
}

// SETUP
let rootNode = Node()
let genes = ["a", "b", "c", "aa", "d", "b"]
let health = [1, 2, 3, 4, 5, 6]
let strands = [
    Strand(value: Array("caaab"), lowerBound: 1, higherBound: 5),
    Strand(value: Array("xyz"), lowerBound: 0, higherBound: 4),
    Strand(value: Array("bcdybc"), lowerBound: 2, higherBound: 4)
]
for i in 0 ..< genes.count {
    rootNode.insertGene(string: genes[i], index: i, health: health[i])
}

findResult(for: strands, root: rootNode, health: health, genes: genes)
