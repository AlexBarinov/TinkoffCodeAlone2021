import Foundation

public class Problem08 {
    private static let d = [
        "2": ["A", "B", "C"],
        "3": ["D", "E", "F"],
        "4": ["G", "H", "I"],
        "5": ["J", "K", "L"],
        "6": ["M", "N", "O"],
        "7": ["P", "Q", "R", "S"],
        "8": ["T", "U", "V"],
        "9": ["W", "X", "Y", "Z"]
    ]

    private static func solveSubstring(digit: String, count: Int) -> String {
        guard let d = d[digit] else {
            return ""
        }
        if count <= d.count {
            return d[count - 1]
        } else {
            return solveSubstring(digit: digit, count: count - d.count) + d[d.count - 1]
        }
    }

    static func solve(string: String) -> String {
        let chars = Array(string)
        var start = 0, result = ""
        for end in 1...chars.count {
            if end == chars.count || chars[start] != chars[end] {
                result += solveSubstring(digit: String(chars[start]), count: end - start)
                start = end
            }
        }
        return result
    }
}

public extension Problem08 {
    static func run() {
        print("Problem 08:")

        guard
            let lines = Helper.load("Problem08", expected: 1)
        else {
            print("\tError")
            return
        }
        
        let start = Date()
        let result = solve(string: lines[0])
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
