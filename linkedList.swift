class Node {
    var value: Int
    var next: Node?

    init(val: Int) {
        self.value = val
        self.next = nil
    }
}

class linkedList {

    var head: Node?

    // insert at first
    func insertAtFirst(val: Int) {
        if head == nil {
            head = Node(val: val)
        } else {
            let newNode = Node(val: val)
            newNode.next = head
            head = newNode
        }
    }

    // insert at last
    func insertAtLast(val: Int) {
        if head == nil {
            head = Node(val: val)
        } else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = Node(val: val)
        }
    }
    
    // insert at any point
    func insertAtPoint(val: Int, at: Int) {
            // 1. If inserting at index 0, update head directly
            if at == 0 {
                insertAtFirst(val: val)
                return
            }
    
            // 2. Traverse to index at - 1
            var current = head
            var count = 0
    
            while current != nil && count < at - 1 {
                current = current?.next
                count += 1
            }
    
            // 3. Validate bounds
            guard let previousNode = current else {
                print("Index \(at) out of bounds")
                return
            }
    
            // 4. Attach new node into the chain
            let newNode = Node(val: val)
            newNode.next = previousNode.next
            previousNode.next = newNode
        }

    // printing list
    func printList() {
        var current = head
        while current != nil {
            print(current!.value)
            current = current?.next
        }
    }

    // find middle of list
    func middleOfList(list: Node?) -> Node? {
        var slowPoint: Node? = list
        var fastPoint: Node? = list

        guard let _ = list else { return nil }
        while fastPoint != nil && fastPoint?.next != nil {
            slowPoint = slowPoint?.next 
            fastPoint = fastPoint?.next?.next
        }
        return slowPoint
    }

    // make cycle
    func makeCycleAtMide() {
        guard let head = head else { return }

        guard let middleNode = middleOfList(list: head) else {return}

        var current: Node? = head
        while current?.next != nil {
            current = current?.next
        }

        current?.next = middleNode
    }

    func isListCycle() -> Bool {
        var slow: Node? = head
        var fast: Node? = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

            if slow === fast {
                return true
            }
        }
        return false
    }

    func cycleStartAt() -> Node? {
        var slow: Node? = head
        var fast: Node? = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next

            if slow === fast {
                break
            }
        }

        if fast == nil || fast?.next == nil {
            return nil // No cycle
        }

        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }

        return slow // Start of the cycle
    }
    
}

var list = linkedList()
list.insertAtFirst(val: 10)
list.insertAtFirst(val: 20)
list.insertAtFirst(val: 30)
list.insertAtFirst(val: 40)
list.insertAtFirst(val: 50)
list.insertAtFirst(val: 60)
list.insertAtFirst(val: 70)
list.insertAtFirst(val: 80)
list.insertAtFirst(val: 90)
list.insertAtFirst(val: 100)

print(" \(list.isListCycle())")

list.printList()

if let middleNode = list.middleOfList(list: list.head) {
    print("Middle node value is: \(middleNode.value)")
}

list.makeCycleAtMide()

print("\(list.isListCycle())")