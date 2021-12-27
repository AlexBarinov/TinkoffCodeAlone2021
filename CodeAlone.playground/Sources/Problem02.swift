import Foundation

public class Problem02 {
    private static func gcd(_ x: Int, _ y: Int) -> Int {
        var a = 0, b = max(x, y), r = min(x, y)
        while r != 0 {
            a = b
            b = r
            r = a % b
        }
        return b
    }

    private static func lcm(_ x: Int, _ y: Int) -> Int {
        return x / gcd(x, y) * y
    }

    static func solve(length: Int, returnPoint: Int) -> Int {
        return lcm(returnPoint, length - returnPoint) * 2
    }
}

public extension Problem02 {
    static func run() {
        print("Problem 02:")

        guard
            let lines = Helper.load("Problem02", expected: 1),
            let values = Helper.parse(string: lines[0], expected: 2)
        else {
            print("\tError")
            return
        }
        
        let start = Date()
        let result = solve(length: values[0], returnPoint: values[1])
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
