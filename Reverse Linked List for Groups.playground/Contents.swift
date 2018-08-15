//: Playground - noun: a place where people can play

import UIKit

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


//Reverse a Linked List in groups of given size | Set 1
//Given a linked list, write a function to reverse every k nodes (where k is an input to the function).
//
//Example:
//Inputs:  1->2->3->4->5->6->7->8->NULL and k = 3
//Output:  3->2->1->6->5->4->8->7->NULL.
//
//Inputs:   1->2->3->4->5->6->7->8->NULL and k = 5
//Output:  5->4->3->2->1->8->7->6->NULL.

func reverse(node: Node?, k: Int) -> Node? {
    guard let node = node else { return nil }
    var next = node.next
    var previous = node
    node.next = nil

    for _ in 1 ..< k {
        if let nextUnwraped = next {
            next = nextUnwraped.next
            nextUnwraped.next = previous
            previous = nextUnwraped
        }
        else {
            return previous
        }
    }
    node.next = reverse(node: next, k: k)
    return previous
}

let start = Node(0)
start ~> Node(1) ~> Node(2) ~> Node(3) ~> Node(4) ~> Node(5)

reverse(node: start, k: 5)



