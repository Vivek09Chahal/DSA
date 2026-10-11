class Node {
    var value: Int
    var next: Node?

    init(val: Int, next: Node? = nil) {
        value = val
        self.next = nil
    }
}

class Stack {
    var topNode: Node?
    var count: Int = 0

    var isEmpty: Bool {
        topNode == nil
    }

    var peek: Int? {
        topNode?.value
    }

    func push(val: Int) {
        let newNode = Node(val: val, next: topNode)
        topNode = newNode
        count += 1
    }

    func pop() -> Int? {
        guard let topNode = topNode else {
            return nil
        }
        self.topNode = topNode.next
        count -= 1
        return topNode.value
    }

    func display() {
        var current = topNode
        while current != nil {
            print(current!.value)
            current = current?.next
        }
    }
}

var stack = Stack()

stack.push(val: 10)
stack.push(val: 20)
stack.push(val: 30)

stack.display()