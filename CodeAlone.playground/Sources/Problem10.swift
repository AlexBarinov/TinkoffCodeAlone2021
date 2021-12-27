import Foundation

public class Problem10 {
    static func solve(heights h: [Int]) -> Int {
        var maxArea = 0
        for i in 0..<h.count {
            var l = i, r = i
            while(l > 0 && h[l - 1] >= h[i]) {
                l -= 1
            }
            while(r < h.count - 1 && h[r + 1] >= h[i]) {
                r += 1
            }
            maxArea = max(maxArea, (r - l + 1) * h[i])
        }
        return maxArea
    }
}

public extension Problem10 {
    static func run() {
        print("Problem 10:")

        guard
            let lines = Helper.load("Problem10", expected: 2),
            let values = Helper.parse(string: lines[1])
        else {
            print("\tError")
            return
        }
        
        let start = Date()
        let result = solve(heights: values)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
