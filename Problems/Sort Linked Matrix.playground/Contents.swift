import Foundation



precedencegroup LongArrowPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}
infix operator ~>: LongArrowPrecedence
infix operator ~~>: LongArrowPrecedence

class Node: CustomStringConvertible{
    var description: String {
        if next == nil { return "\(value)" }
        return "\(value) ~> \(next!.description)"
    }
    
    var next: Node?
    var value: Int
    var right: Node?
    
    init(_ value: Int) {
        self.value = value
    }
    static func ~>(lhs: Node, rhs: Node) -> Node {
        lhs.next = rhs
        return rhs
    }
    static func ~~>(lhs: Node, rhs: Node) -> Node {
        lhs.right = rhs
        return rhs
    }
}

/*
 
 Given a linked list where every node represents a linked list and contains two pointers of its type:
 (i) Pointer to next node in the main list (we call it ‘right’ pointer in below code)
 (ii) Pointer to a linked list where this node is head (we call it ‘down’ pointer in below code).
 All linked lists are sorted. See the following example
 
5 -> 10 -> 19 -> 28
|    |     |     |
V    V     V     V
7    20    22    35
|          |     |
V          V     V
8          50    40
*/

//time O(nlogn)
//space O(n)
func sorted(in head: Node) -> Node {
    return merge(head, head.right)
}

func merge(_ left: Node, _ right: Node?) -> Node {
    guard let right = right else { return left }
    
    var lCurrent: Node? = left
    var rCurrent: Node? = right
    var head: Node?
    var last: Node?
    
    rCurrent = merge(right, right.right)
    
    while let left = lCurrent, let right = rCurrent {
        let next: Node
        if left.value < right.value {
            next = left
            lCurrent = left.next
        }
        else {
            next = right
            rCurrent = right.next
        }
        if last != nil {
            last!.next = next
        }
        last = next
        
        if head == nil {
            head = next
        }

    }
    last?.next = lCurrent ?? rCurrent
    return head!
}

let head = Node(0)
let secondHead = Node(2)
head ~> Node(1) ~> Node(3) ~> Node(5) ~> Node(7) ~> Node(11)
head ~~> secondHead
secondHead ~> Node(4) ~> Node(6) ~> Node(8) ~> Node(10)

sorted(in: head)
