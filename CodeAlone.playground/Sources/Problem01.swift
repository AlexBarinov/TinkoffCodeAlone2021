import Foundation

public class Problem01 {
    static func solve(a: Int, b: Int) -> Int {
        return min(a, b) + a + b
    }
}

public extension Problem01 {
    static func run() {
        print("Problem 01:")

        guard
            let lines = Helper.load("Problem01", expected: 1),
            let values = Helper.parse(string: lines[0], expected: 2)
        else {
            print("\tError")
            return
        }
        
        let start = Date()
        let result = solve(a: values[0], b: values[1])
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
