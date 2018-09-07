//: Playground - noun: a place where people can play

import UIKit

public class Node <Element> {
    var value: Element
    var next: Node<Element>?
    var previous: Node<Element>?
    
    init(value: Element) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}

public class LinkedList <Element> {
    fileprivate var head: Node<Element>?
    private var tail: Node<Element>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<Element>? {
        return head
    }
    
    public var last: Node<Element>? {
        return tail
    }
    
    public func append(value: Element) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
            newNode.previous = tailNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    public func remove(node: Node<Element>) -> Element {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func nodeAt(index: Int) -> Node<Element>? {
        if index >= 0 {
            var node = head
            var i  = index
            while node != nil {
                if i == 0 {return node}
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", "}
        }
        return text + "]"
    }
}

let dogBreeds = LinkedList<String>()
dogBreeds.append(value: "Labrador")
dogBreeds.append(value: "Bulldog")
dogBreeds.append(value: "Beagle")
dogBreeds.append(value: "Husky")
print(dogBreeds)

if let indexNode = dogBreeds.nodeAt(index: 3) {
    print(indexNode)
}
print(dogBreeds.remove(node: dogBreeds.nodeAt(index: 3)!))
print(dogBreeds)
dogBreeds.removeAll()
print(dogBreeds)

let numbers = LinkedList<Int>()
numbers.append(value: 4)
numbers.append(value: 6)
numbers.append(value: 1)
numbers.append(value: -5)
print(numbers)


public struct Queue <Element> {
    fileprivate var list = LinkedList<Element>()
    public var isEmpty: Bool {return list.isEmpty}
    
    public mutating func enqueue(_ element: Element) {
        list.append(value: element)
    }
    
    public mutating func dequeue() ->Element? {
        guard !isEmpty, let element = list.first else { return nil }
        list.remove(node: element)
        return element.value
    }
    public func peek() -> Element? { return list.first?.value }
}

extension Queue : CustomStringConvertible {
    public var description: String {
        return list.description
    }
}

var queue = Queue<Int>()
queue.enqueue(4)
queue.enqueue(6)
queue.enqueue(5)
print(queue)
queue.dequeue()
print(queue)

var queueS = Queue<String>()
queueS.enqueue("first")
queueS.enqueue("second")
queueS.enqueue("third")
print(queueS)
queueS.dequeue()
print(queueS)


