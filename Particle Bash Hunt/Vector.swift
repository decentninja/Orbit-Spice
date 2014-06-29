import Foundation


operator infix + {associativity none precedence 140}
func + (left: CGVector, right: CGVector) -> CGVector {
    return CGVector(left.dx + right.dx, left.dy + right.dy)
}

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

operator infix * {associativity none precedence 140}
func * (left: Float, right: CGVector) -> CGVector {
    let x = CGFloat(left) * right.dx
    let y = CGFloat(left) * right.dy
    return CGVector(x, y)
}

operator infix - {associativity none precedence 140}
func - (left: CGPoint, right: CGPoint) -> CGVector {
    return CGVector(left.x - right.x, left.y - right.y)
}


extension CGPoint {
    func distance(other: CGPoint) -> Float {
        return Float(sqrt(pow(x - other.x, 2) + pow(y - other.y, 2)))
    }
}

operator infix / {associativity none precedence 140}
func / (left: CGVector, right: Float) -> CGVector {
    var dx = CGFloat(Float(left.dx) / right)
    var dy = CGFloat(Float(left.dy) / right)
    return CGVector(dx, dy)
}

extension CGVector {
    
    var magnitude: Float {
        get {
            let d2 = Double(pow(dx, 2)) + Double(pow(dy, 2))
            return Float(sqrt(d2))
        }
        set {
            self = newValue * normalized()
        }
    }
    
    mutating func normalize() {
        self = self / magnitude
    }
    
    func normalized() -> CGVector {
        return self / magnitude
    }
    
    var angle: Float {
        get {
            return -Float(atan2(dx, dy))
        }
    
        set {
            var me = CGVector(sin(CDouble(-newValue)), cos(CDouble(-newValue)))
            me.magnitude = magnitude
            self = me
        }
    }
}