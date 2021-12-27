import Foundation

public class Problem03 {
    static func solve(length: Int, ropes: [Int]) -> Int {
        let ropes = ropes.sorted { $0 > $1 }

        var currentLength = 0
        var currentRopes = 0

        for rope in ropes {
            currentLength += rope
            currentRopes += 1
            
            if currentLength >= length {
                return currentRopes - 1
            }
        }
        return -1
    }
}

public extension Problem03 {
    static func run() {
        print("Problem 03:")

        guard
            let lines = Helper.load("Problem03", expected: 1),
            let values = Helper.parse(string: lines[0], expected: 2),
            let ropes = Helper.parse(string: lines[1])
        else {
            print("\tError")
            return
        }
        
        let start = Date()
        let result = solve(length: values[1], ropes: ropes)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
