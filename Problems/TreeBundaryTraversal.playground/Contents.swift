import UIKit

/*
 Given a binary tree, print boundary nodes of the binary tree Anti-Clockwise starting from the root. For example, boundary traversal of the following tree is “20 8 4 10 14 25 22”
 
 We break the problem in 3 parts:
 1. Print the left boundary in top-down manner.
 2. Print all leaf nodes from left to right, which can again be sub-divided into two sub-parts:
 …..2.1 Print all leaf nodes of left sub-tree from left to right.
 …..2.2 Print all leaf nodes of right subtree from left to right.
 3. Print the right boundary in bottom-up manner.

 We need to take care of one thing that nodes are not printed again. e.g. The left most node is also the leaf node of the tree.

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

let n20 = Node(20)
let n8 = Node(8)
let n4 = Node(4)
let n22 = Node(22)
let n12 = Node(12)
let n10 = Node(10)
let n25 = Node(25)
let n14 = Node(14)

n20.left = n8
n20.right = n22
n8.left = n4
n8.right = n12
n12.left = n10
n12.right = n14
n22.right = n25

func printLeafs(of node: Node?) {
    guard let node = node else { return }
    if node.left == nil && node.right == nil {
        print(node)
    }
    printLeafs(of: node.left)
    printLeafs(of: node.right)
}

func printLeftNodes(of node: Node?) {
    guard let node = node else { return }
    if node.left == nil && node.right == nil {
        return
    }
    print(node)
    printLeftNodes(of: node.left)
}

func printRightNodes(of node: Node?) {
    guard let node = node else { return }
    if node.left == nil && node.right == nil {
        return
    }
    printLeftNodes(of: node.right)
    print(node)
}

printLeftNodes(of: n20)
printLeafs(of: n20)
printRightNodes(of: n20)
