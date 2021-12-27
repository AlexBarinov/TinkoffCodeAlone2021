import Foundation

public class Problem04 {
    private static func compare(array a: [Int], index i1: Int) -> Bool {
        let count = a.count
        for i in 0..<count {
            if a[i] != a[(i1 + i) % count] {
                return false
            }
        }
        return true
    }

    static func solve(blades: [Int]) -> Int {
        var result = 0
        let count = blades.count
        for i in 1..<count {
            result += 1
            if blades[i] == blades[0] {
                if compare(array: blades, index: i) {
                    return result
                }
            }
        }
        return result
    }
}

public extension Problem04 {
    static func run() {
        print("Problem 04:")

        guard
            let lines = Helper.load("Problem04", expected: 2),
            let blades = Helper.parse(string: lines[1])
        else {
            print("\tError")
            return
        }
        
        let start = Date()
        let result = solve(blades: blades)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
