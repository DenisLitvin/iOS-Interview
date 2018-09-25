import Foundation

precedencegroup LongArrowPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}
infix operator ~>: LongArrowPrecedence

class Node: CustomStringConvertible{
    var description: String {
        if next == nil { return "\(value)" }
        return "\(value) ~> \(next!.description)"
    }
    
    var next: Node?
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
    static func ~>(lhs: Node, rhs: Node) -> Node {
        lhs.next = rhs
        return rhs
    }
}

/*
 Asked in: Accolite    Adobe    Amazon    Citicorp    Epic Systems    MAQ Software    Monotype Solutions    Snapdeal

Given a linked list, the task is to find the n'th node from the end.  It is needed to complete a method that takes two argument, head of linked list and an integer n. There are multiple test cases. For each test case, this method will be called individually.

*/

//fastest approach
//time O(n)
//space O(1)
func nNode(in head: Node, n: Int) -> Int {
    
    var current = head
    var count = 0
    var nNode = head
    
    while let next = current.next {
        count += 1
        if count >= n {
            nNode = nNode.next!
        }
        current = next
    }
    
    return nNode.value
}

let head = Node(1)
head ~> Node(2) ~> Node(3) ~> Node(4) ~> Node(5)

nNode(in: head, n: 2)
