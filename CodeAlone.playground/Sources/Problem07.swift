import Foundation

public class Problem07 {
    static func solve(rawInputData lines: [String]) -> Int {
        let n = Int(lines[0]) ?? 0
        var result = 0
        for i in 1...n {
            if lines[i].trimmingCharacters(in: .whitespacesAndNewlines) == "0" {
                result += i
            }
        }
        return result
    }
}

public extension Problem07 {
    static func run() {
        print("Problem 07:")

        guard
            let lines = Helper.load("Problem07")
        else {
            print("\tError")
            return
        }
        
        let start = Date()
        let result = solve(rawInputData: lines)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
