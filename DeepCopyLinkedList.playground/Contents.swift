import Foundation

precedencegroup LongArrowPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}
infix operator ~>: LongArrowPrecedence

class Node: CustomStringConvertible {
    var description: String {
        if next == nil { return "\(value)" }
        return "\(value) ~> \(next!.description)"
    }
    
    var next: Node?
    var random: Node?
    var value: Int
    
    init(_ value: Int) {
        self.value = value
    }
    
    func copy() -> Node {
        let node = Node(self.value)
        return node
    }
    
    static func ~>(lhs: Node, rhs: Node) -> Node {
        lhs.next = rhs
        return rhs
    }
    
}
extension Node: Hashable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.finalize()
    }
    
}
/*
This question was asked by Snapchat.

Given the head to a singly linked list, where each node also has a “random” pointer that points to anywhere in the linked list, deep clone the list.
*/

func copy(head: Node) -> Node {
    let copyHead = head.copy()
    var mapper = Dictionary<Node, Node>()
    copyHelper(head: head, copyHead: copyHead, mapper: &mapper)
    randomHelper(head: head, copyHead: copyHead, mapper: &mapper)
    return copyHead
}
func copyHelper(head: Node, copyHead: Node, mapper: inout Dictionary<Node, Node>) {
    if let next = head.next {
        let nextCopy = next.copy()
        copyHead.next = nextCopy
        mapper[next] = nextCopy
        copyHelper(head: next, copyHead: nextCopy, mapper: &mapper)
    }
}

func randomHelper(head: Node?, copyHead: Node?, mapper: inout Dictionary<Node, Node>) {
    if let head = head, let copyHead = copyHead {
        if let random = head.random {
            if let created = mapper[random] {
                copyHead.random = created
            }
            else {
                let newRandom = random.copy()
                copyHead.random = newRandom
                mapper[random] = newRandom
            }
        }
        randomHelper(head: head.next, copyHead: copyHead.next, mapper: &mapper)
        
    }
}

let head = Node(1)
let random3 = Node(3)
let random4 = Node(4)
head ~> Node(2) ~> random3 ~> random4 ~> Node(5)
head.random = random3
random3.random = random4
let copyHead = copy(head: head)
head == copyHead //check false
head.random == copyHead.random //check false
copyHead.random == copyHead.next!.next! // check random3 true
