import Foundation

public class Problem17 {
    static func solve(string s: String) -> Int {
        var curvy = 0, result = 0
        for c in Array(s) {
            switch c {
            case "{":
                curvy += 1
            case "}":
                curvy -= 1
                if curvy == 0 {
                    result += 1
                }
            default:
                break
            }
        }
        return result
    }
}

public extension Problem17 {
    static func run() {
        print("Problem 17:")

        guard
            let lines = Helper.load("Problem17", expected: 1)
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
