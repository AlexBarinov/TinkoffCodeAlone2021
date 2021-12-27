import Foundation

public class Problem05 {
    static func solve(digits: [[Int]], position: Int) -> String {
        var position = position - 1
        var result = [Int]()
        for i in 0..<digits.count {
            let c = digits[i].count
            let r = position % c
            result.insert(digits[i][r], at: 0)
            position = position / c
        }
        return result.compactMap { String($0) }.joined(separator: "")
    }
}

public extension Problem05 {
    static func run() {
        print("Problem 05:")

        guard
            let lines = Helper.load("Problem05"),
            let values = Helper.parse(string: lines[0], expected: 2)
        else {
            print("\tError")
            return
        }
        
        var digits = [[Int]]()
        
        for i in 1..<lines.count {
            if let value = Helper.parse(string: lines[i]), value.count > 0 {
                digits.insert(value, at: 0)
            }
        }
        
        let start = Date()
        let result = solve(digits: digits, position: values[1])
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
