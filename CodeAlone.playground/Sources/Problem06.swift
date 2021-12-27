import Foundation

public class Problem06 {
    static func solve(path: String) -> String {
        var result = ""
        var leftRight = 0
        var upDown = 0

        for char in path {
            switch char {
            case "L":
                leftRight -= 1
            case "R":
                leftRight += 1
            case "U":
                upDown += 1
            case "D":
                upDown -= 1
            default:
                break
            }
        }
        
        if upDown < 0 {
            result += String(repeating: "D", count: abs(upDown))
        }
        if leftRight < 0 {
            result += String(repeating: "L", count: abs(leftRight))
        }
        if leftRight > 0 {
            result += String(repeating: "R", count: abs(leftRight))
        }
        if upDown > 0 {
            result += String(repeating: "U", count: abs(upDown))
        }
        
        return result
    }
}

public extension Problem06 {
    static func run() {
        print("Problem 06:")

        guard
            let lines = Helper.load("Problem06", expected: 1)
        else {
            print("\tError")
            return
        }
        
        let start = Date()
        let result = solve(path: lines[0])
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
