//
//  main.swift
//  DSA Stack
//
//  Created by Admin on 17/1/24.
//

import Foundation

struct Stack<T> {
    
    private var items: [T] = []
        
    public init(_ items: [T]){
        self.items = items
    }
    
    
    public mutating func push(_ item: T) {
        items.append(item)
    }
    
    @discardableResult
    public mutating func pop()->T? {
        items.popLast()
    }
    
    public func peek()->T? {
        items.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}

extension Stack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral items: T...) {
        self.items = items
    }
    
}


extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        "--- stack start ---\n" + items.reversed().map { "\($0)" }.joined(separator: "\n") + "\n--- stack end ---"
    }
}


var stack = Stack([])
stack.push(5)
stack.push(7)
stack.push(9)

print(stack)

if let last = stack.pop() {
   print(last)
}

print(stack)


var litStack: Stack = [1.2, 3.5, 5.6, 7.1]
print(litStack)



//  # 1

func reverse(_ array: inout [String]){
    
    let count = array.count
    
    if count > 0 {
        for i in 0..<count {
            array.insert(array.last!, at: i)
            array.removeLast()
        }
    }
}


var arr = ["A", "B", "C", "D", "E", "F"]
reverse(&arr)
print(arr)



//  # 2
//  Create a function that uses a stack to print the contents of an array in reversed order.

func reverseWithStack<T>(_ array: [T]){
        
    var stack = Stack<T>()
    
    array.forEach {
        stack.push($0)
    }
        
    while let item = stack.pop() {
        print(item)
    }
}


reverseWithStack(["A", "B", "C", "D", "E", "F"])



//  # 3
//  Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced.

func balancedParentheses(_ text: String)->Bool {
    var stack = Stack<Character>()
    
    for ch in text {
        if ch == "(" {
            stack.push(ch)
        }
        else if ch == ")" {
            if stack.isEmpty {
                return false
            }
            else {
                stack.pop()
            }
        }
    }
    
    return stack.isEmpty
}


print("balanced-1: ", balancedParentheses("hello"))
print("balanced-2: ", balancedParentheses("he(llo"))
print("balanced-3: ", balancedParentheses("he(ll)o"))
print("balanced-4: ", balancedParentheses("hell)o"))
