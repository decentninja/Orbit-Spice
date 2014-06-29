// Playground - noun: a place where people can play

import Cocoa

1 << 0
1 << 1

3.0 * CGFloat(1)


sqrt(Double(3+3))

operator infix | { associativity left }
func |<T, U>(lhs : T, rhs : T -> U) -> U {
    return rhs(lhs)
}

func |<T, Z, U>(lhs : (T, Z), rhs : (T, Z) -> U) -> U {
    let (t, z) = lhs
    return rhs(t, z)
}

func say(str : String) -> String {
    return str
}

func makeSentence(str: String) -> String {
    return str.capitalizedString + "."
}

"helloa" | println

(1, 2) | CGVectorMake


struct HIghFive {
    var a = 3
}


var a = HIghFive()
a.a = 5
a


-5 % 2

2 * Float(pi) % (2 * Float(pi))

