import Foundation

public class Problem09 {
    private static var batteries = [Int]()

    static func solve(batteries b: [Int]) -> Int {
        batteries = b
        var currentChain = 0, maxChain = 0
        for i in 0..<batteries.count {
            if batteries[i] == -1 {
                continue
            }
            var currentIndex = i
            while batteries[currentIndex] != -1 {
                let nextIndex = batteries[currentIndex] - 1
                batteries[currentIndex] = -1
                currentIndex = nextIndex
                currentChain += 1
            }
            if maxChain < currentChain {
                maxChain = currentChain
            }
            currentChain = 0
        }
        return maxChain
    }
}

public extension Problem09 {
    static func run() {
        print("Problem 09:")

        guard
            let lines = Helper.load("Problem09", expected: 2),
            let values = Helper.parse(string: lines[1])
        else {
            print("\tError")
            return
        }
        
        let start = Date()
        let result = solve(batteries: values)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
