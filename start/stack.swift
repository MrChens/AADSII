import UIKit

struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count:Int {
        return array.count
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() ->Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n----------------\n"
        let stackElements = array.map{"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

var bookStack = Stack<String>()
bookStack.push("cBook")
bookStack.push("eBook")
bookStack.push("bBook")
bookStack.push("aBook")
print(bookStack)
bookStack.peek()
bookStack.pop()
bookStack.pop()

var intStack = Stack<Int>()
intStack.push(3)
intStack.push(5)
intStack.push(20)
bookStack.peek()
print(intStack)

