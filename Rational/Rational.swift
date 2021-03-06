import Foundation
import os.log

public struct Rational: Comparable, Equatable{
    
    public var numerator: Int
    public var denominator: Int
    public var reciprocal: Rational {
        get {
            return Rational(numerator: self.denominator, denominator: self.numerator)
        }
    }
    
    public init(numerator: Int, denominator: Int) {
        let (numerator, denominator) = simplify(numerator: numerator, denominator: denominator)
        self.numerator = numerator
        self.denominator = denominator
    }
    
    public init(_ value: Double) {
        let error = 1.0E-6
        var h1 = 1.0
        var h2 = 0.0
        var k1 = 0.0
        var k2 = 1.0
        var b = value
        repeat {
            let a = floor(b)
            var aux = h1
            h1 = a*h1+h2
            h2 = aux
            aux = k1
            k1 = a*k1+k2
            k2 = aux
            b = 1/(b-a)
        } while abs(value-h1/k1) > value * error
        let (numerator, denominator) = simplify(numerator: Int(h1), denominator: Int(k1))
        self.numerator = numerator
        self.denominator = denominator
        self.numerator = numerator
        self.denominator = denominator
    }
    
    public init(_ value: Int) {
        self.numerator = value
        self.denominator = 1
    }
    
    public init?(fromString fractionString: String) {
        if fractionString.rangeOfCharacter(from: CharacterSet.letters) != nil {
            return nil
        }
        
        if fractionString.contains("-") {
            return nil
        }
        
        let stringComponents = fractionString.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
        if stringComponents.count == 2 {
            // expecting a whole number and fraction
            if stringComponents[0].contains("/") || stringComponents[0].contains(".") || stringComponents[1].contains(".") || !stringComponents[1].contains("/"){
                // if either part has an unexpected symbol, we should fail and return nil
                return nil
            }
            let wholeNumber = Int(stringComponents[0])
            let fraction = stringComponents[1].components(separatedBy: "/")
            if let denominator = Int(fraction[1]), let numerator = Int(fraction[0]) {
                self.init(numerator: numerator+(wholeNumber!*denominator), denominator: denominator)
                return
            }
            
        } else if stringComponents.count == 1 {
            // expecting either a whole number or fraction
            if let decimalValue = Double(stringComponents[0]) {
                self.init(decimalValue)
            } else {
                let fraction = stringComponents[0].components(separatedBy: "/")
                if fraction.count == 2 && !fraction[0].contains(".") && !fraction[1].contains("."){
                    if let numerator = Int(fraction[0]), let denominator = Int(fraction[1]) {
                        self.init(numerator: numerator, denominator: denominator)
                        return
                    }
                }
            }
        }
        return nil
    }
    
    public func asDouble() -> Double {
        return Double(self.numerator) / Double(self.denominator)
    }
    
    public func asMixedString() -> String{
        if numerator == 0 || denominator == 0 {
            return "0"
        }
        if numerator < denominator {
            return "\(numerator)/\(denominator)"
        } else {
            let whole = numerator / denominator
            let remainder = numerator % denominator
            
            var descriptionString = ""
            if whole > 0 {
                descriptionString.append("\(whole.description) ")
            }
            if remainder > 0 {
                descriptionString.append("\(remainder)/\(denominator)")
            }
            return descriptionString
    }
    }
}

private func gcd (_ a: Int, _ b: Int) -> Int{
    let r = a % b
    if r != 0 {
        return gcd(b, r)
    } else {
        return b
    }
}

private func simplify(numerator: Int, denominator: Int) -> (numerator: Int, denominator: Int){
    let d = gcd(numerator, denominator)
    return (numerator: numerator / d, denominator: denominator / d)
}

extension Rational: CustomStringConvertible {
    
    public var description: String {
        if numerator == 0 || denominator == 0 {
            return "0"
        }
        return "\(self.numerator)/\(self.denominator)"
    }
}

//extension Rational: SignedNumber {}
//public prefix func -(rational: Rational) -> Rational {
//    return Rational(numerator: -1 * rational.numerator, denominator: rational.denominator)
//}

public func + (lhs: Rational, rhs: Rational) -> Rational{
    let numerator = lhs.numerator*rhs.denominator + lhs.denominator*rhs.numerator
    let denominator = lhs.denominator*rhs.denominator
    let result = Rational(numerator: numerator, denominator: denominator)
    return result
}

public func - (lhs: Rational, rhs: Rational) -> Rational {
    let numerator = lhs.numerator*rhs.denominator - lhs.denominator*rhs.numerator
    let denominator = lhs.denominator*rhs.denominator
    let result = Rational(numerator: numerator, denominator: denominator)
    return result
}

public func * (lhs: Rational, rhs: Rational) -> Rational {
    let product = Rational(numerator: lhs.numerator * rhs.numerator, denominator: lhs.denominator * rhs.denominator)
    return product
}

public func / (lhs: Rational, rhs: Rational) -> Rational {
    return lhs * rhs.reciprocal
}

public func += (lhs: inout Rational, rhs: Rational) {
    lhs = lhs + rhs
}

public func -= (lhs: inout Rational, rhs: Rational) {
    
}

public func == (lhs: Rational, rhs: Rational) -> Bool {
    return (lhs.numerator == rhs.numerator) && (lhs.denominator == rhs.denominator)
}

public func < (lhs: Rational, rhs: Rational) -> Bool {
    return (lhs.asDouble()) < (rhs.asDouble())
}

public func <= (lhs: Rational, rhs: Rational) -> Bool {
    if lhs == rhs {
        return true
    }
    return (lhs.asDouble()) < (rhs.asDouble())
}

public func > (lhs: Rational, rhs: Rational) -> Bool {
    return (lhs.asDouble()) > (rhs.asDouble())
}

public func >= (lhs: Rational, rhs: Rational) -> Bool {
    if lhs == rhs {
        return true
    }
    return (lhs.asDouble()) > (rhs.asDouble())
}
