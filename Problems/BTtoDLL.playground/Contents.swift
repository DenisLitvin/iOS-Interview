import UIKit

/*
 Given a Binary Tree (BT), convert it to a Doubly Linked List(DLL) In-Place. The left and right pointers in nodes are to be used as previous and next pointers respectively in converted DLL. The order of nodes in DLL must be same as Inorder of the given Binary Tree. The first node of Inorder traversal (left most node in BT) must be head node of the DLL.
 */
class Node: CustomStringConvertible {
    var description: String {
        return String(value)
    }
    
    let value: Int
    var left: Node?
    var right: Node?
    init(_ value: Int) { self.value = value }
}

let n1 = Node(1)
let n2 = Node(2)
let n3 = Node(3)
let n10 = Node(10)
let n20 = Node(20)

n1.right = n20
n1.left = n10
n20.left = n2
n20.right = n3

print(n1)

func flaten(_ node: Node) {
    let l = flattenHelper(node.left!, node)
    let r = flattenHelper(node.right!, node)
    node.left = l.right
    node.right = r.left
    l.right.right = node
    r.left.left = node
}

func flattenHelper(_ node: Node, _ root: Node) -> (left: Node, right: Node) {
    var leftReturn: Node?
    var rightReturn: Node?
    
    if let left = node.left {
        let l = flattenHelper(left, node)
        leftReturn = l.left
        node.left = l.right
        l.right.right = node
    }

    if let right = node.right {
        let r = flattenHelper(right, node)
        rightReturn = r.right
        node.right = r.left
        r.left.left = node
    }
    return (left: leftReturn ?? node, right: rightReturn ?? node)
}

flaten(n1)
n1.left
n2.right
n20.right
