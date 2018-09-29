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
This problem was asked by Microsoft.

Let's represent an integer in a linked list format by having each node represent a digit in the number. The nodes make up the number in reversed order.

For example, the following linked list:

1 -> 2 -> 3 -> 4 -> 5
is the number 54321.

Given two linked lists in this format, return their sum in the same linked list format.

For example, given

9 -> 9
5 -> 2
return 124 (99 + 25) as:

4 -> 2 -> 1
*/

//time O(n)
//space O(n)
func sum(left: Node?, right: Node?, additionalValue: Int) -> Node? {
    guard left != nil
        || right != nil
        || additionalValue != 0
        else { return nil }
    
    let lValue = left?.value ?? 0
    let rValue = right?.value ?? 0
    let result = lValue + rValue + additionalValue
    let resultNode = Node(result % 10)
    resultNode.next = sum(left: left?.next, right: right?.next, additionalValue: result / 10)
    
    return resultNode
}

let left = Node(9)
left ~> Node(2) ~> Node(3) //329

let right = Node(1)
right ~> Node(2) ~> Node(10) //1021
sum(left: left, right: right, additionalValue: 0) //1350
