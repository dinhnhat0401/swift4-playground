//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground 😀"

//str.forEach {
//    print($0)
//}

//for char in str {
//    print(char);
//}

print(str.isEmpty)
//print(str.dropFirst())
print(String(str.reversed()))
str.count
print(str.last!.unicodeScalars.first!.isASCII)
let str1 = str.filter { c in
    let isASCII = c.unicodeScalars.reduce(true, { x, y in
        y.isASCII
    })
    return isASCII
}
print(str1)

let numbers = [1, 2, 3, 4]
let numberSum = numbers.reduce(0, { x, y in
    x + y
})
print(numberSum)

let text = """
First row,
Second row,
Third row
"""

extension String {
    func useMapPattern(_ i: Int) -> String {
        return map { String($0)}[i]
    }
    
    func useIndexPattern(_ i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
