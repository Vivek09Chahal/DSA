import Playgrounds

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(val: Int) {
        value = val
        self.left = nil
        self.right = nil
    }
}

class binaryTree {
    
    var root: Node?
    
    var isEmpty: Bool {
        root == nil
    }
    
    // Your insert method
    func insert(val: Int) {
        let newNode = Node(val: val)
        
        guard let root = root else {
            self.root = newNode
            return
        }
        
        var current: Node? = root
        
        while let node = current {
            if val < node.value {
                if node.left == nil {
                    node.left = newNode
                    return
                }
                current = node.left
            } else {
                if node.right == nil {
                    node.right = newNode
                    return
                }
                current = node.right
            }
        }
    }
    
    func inOrderTraverse(_ node: Node?) {
        guard let node = node else { return }
        
        inOrderTraverse(node.left)
        print(node.value)
        inOrderTraverse(node.right)
    }
    
    // Build custom tree
    func createComplexTree() {
        
        root = Node(val: 50)
        
        root?.left = Node(val: 25)
        root?.right = Node(val: 75)
        
        root?.left?.left = Node(val: 10)
        root?.left?.right = Node(val: 35)
        
        root?.right?.right = Node(val: 90)
        
        root?.left?.left?.left = Node(val: 5)
        
        root?.left?.right?.left = Node(val: 30)
        root?.left?.right?.right = Node(val: 40)
        
        root?.right?.right?.left = Node(val: 80)
        
        root?.left?.left?.left?.right = Node(val: 8)
        
        root?.left?.right?.right?.left = Node(val: 38)
        
        root?.right?.right?.left?.right = Node(val: 85)
        
        root?.left?.left?.left?.right?.left = Node(val: 6)
    }
    
    var currentPath: [Int] = []
    var deepestPath: [Int] = []
    
    // MARK:- Find deepest path to leaf Node
    func dfs(_ node: Node?) {
        
        guard let node = node else { return }
        
        currentPath.append(node.value)
        
        if currentPath.count > deepestPath.count {
            deepestPath = currentPath
        }
        
        dfs(node.left)
        dfs(node.right)
        
        currentPath.removeLast()
    }

    // MARK: - lowest common ancestor
    func lowestCommonAncestor(node: Node?, val1: Int, val2: Int) -> Node? {
        guard let node = node else { return nil } 

        if val1 < node.value && val2 < node.value {
            return lowestCommonAncestor(node: node.left, val1: val1, val2: val2)
        }

        if val1 > node.value && val2 > node.value {
            return lowestCommonAncestor(node: node.right, val1: val1, val2: val2)
        }
        return node
    }

    // MARK: - right side node view
    func rightSideNodeView() -> [Int] {

        var result: [Int] = []
        guard let root = root else { return result}

        var queue: [Node] = [root]

        while !queue.isEmpty {
            let levelSize = queue.count

            for i in 0..<levelSize {
                let currentNode = queue.removeFirst()

                if i == levelSize - 1 {
                    result.append(currentNode.value)
                }

                if let left = currentNode.left {
                    queue.append(left)
                }
                if let right = currentNode.right {
                    queue.append(right)
                }
            }
        }
        
        return result
    }

    // MARK: - left side node view
    func leftSideNodeView() -> [Int] {
        
        var result: [Int] = []
        guard let root = root else { return result }
        
        var queue: [Node] = [root]
        
        while !queue.isEmpty {
            let levelSize = queue.count
            
            for i in 0..<levelSize {
                let currentNode = queue.removeFirst()
                
                if i == 0 {
                    result.append(currentNode.value)
                }
                
                if let left = currentNode.left {
                    queue.append(left)
                }
                if let right = currentNode.right {
                    queue.append(right)
                }
            }
        }
        
        return result
    }

    // MARK: - is Valid BST
    func isValidBST() -> Bool {
            return validate(node: root, min: nil, max: nil)
        }
        
    private func validate(node: Node?, min: Int?, max: Int?) -> Bool {
        guard let node = node else { return true }
        
        if let minValue = min, node.value <= minValue {
            return false
        }
        
        if let maxValue = max, node.value >= maxValue {
            return false
        }
        
        return validate(node: node.left, min: min, max: node.value) &&
               validate(node: node.right, min: node.value, max: max)
    }
}

//#Playground {
    let tree = binaryTree()
    tree.createComplexTree()

    // Pass the root node along with the two target values
    if let lca = tree.lowestCommonAncestor(node: tree.root, val1: 5, val2: 40) {
        print("Lowest Common Ancestor: \(lca.value)") // Outputs: 25
    }

    let rightView = tree.rightSideNodeView()
    print("Right Side View: \(rightView)")
    
    let leftView = tree.leftSideNodeView()
    print("Right Side View: \(leftView)")
//}
