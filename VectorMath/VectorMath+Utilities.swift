
import Foundation

extension Vector2 {
    
    public static func distanceSqBetween(_ from: Vector2, and to: Vector2) -> Float {
        return pow( Float(from.x - to.x), 2 ) + pow( Float(from.y - to.y), 2)
    }

    public static func distanceBetween(_ from: Vector2, and to: Vector2) -> Float {
        return sqrt(distanceSqBetween(from, and: to))
    }

    public func withinRadius(position: Vector2, radius: Float) -> Bool {
        let radiusSq = radius*radius
        return Vector2.distanceSqBetween(self, and: position) <= radiusSq
    }
    
    public static func angleBetween(_ first: Vector2, and second: Vector2) -> Float {
        return atan2(second.y - first.y, second.x - first.x)
    }
    
    public func add(_ other: Vector2) -> Vector2 {
        return Vector2(x: self.x + other.x, y: self.y + other.y)
    }
    
    public func multiplied(by value: Float) -> Vector2 {
       return Vector2(x: self.x * value, y: self.y * value)
    }
    
    public func vector() -> Vector2 {
        return Vector2(x: x, y: y)
    }
    
    public func round(to: Int) -> Vector2 {
        let x = to * Int((self.x / Float(to)).rounded())
        let y = to * Int((self.y / Float(to)).rounded())
        return Vector2(x: Float(x), y: Float(y))
    }
    
    public func interpolated(with other: Self, by amount: Double) -> Self {
        return Self(x: x + (other.x - x) * Float(amount), y: y + (other.y - y) * Float(amount))
    }
    
    public func isEqual(to other: Vector2, within delta: Float) -> Bool {
        return abs(self.x - other.x) < delta && abs(self.y - other.y) < delta
    }
    
    public func isEqual(to other: Vector2) -> Bool {
        return isEqual(to: other, within: 0.1)
    }
    
    public func inverted() -> Vector2 {
        return Vector2(x: -x, y: -y)
    }
    
    public static var one: Vector2 { Vector2(x: 1, y: 1) }
    
    public func magnitude() -> Float {
        return sqrt( x * x + y * y )
    }
    
    public static func angle(between first: Vector2, and second: Vector2) -> Float {
        let dot = first.x * second.x + first.y + second.y
        let mag = first.magnitude() * second.magnitude()
        let cos = dot / mag
        return acos(cos)
    }
    
    public func point() -> Vector2 {
        return Vector2(x: x, y: y)
    }
    
    public static func direction(from: Vector2, to: Vector2) -> Vector2 {
        return Vector2(x: to.x - from.x, y: to.y - from.y).normalized()
    }
}


extension Vector2: CustomStringConvertible {
    
    public var description: String {
        return "<\(x),\(y)>"
    }
}
