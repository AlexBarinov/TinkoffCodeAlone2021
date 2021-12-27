import Foundation

public class Problem15 {
    struct Point {
        var x: Int
        var y: Int
    }
    
    static func distance(points: [Int]) -> Int {
        let p = points.sorted(), pc = p.count, r = 1 - pc % 2
        return p[pc / 2 - r]
    }
    
    static func solve(points: [Point]) -> Int {
        let minX = distance(points: points.compactMap { $0.x })
        let minY = distance(points: points.compactMap { $0.y })        
        return minX + minY
    }
}

public extension Problem15 {
    static func run() {
        print("Problem 15:")

        guard
            let lines = Helper.load("Problem15", expected: 1)
        else {
            print("\tError")
            return
        }
        
        var points = [Point]()
        
        for line in lines {
            if let coordinates = Helper.parse(string: line, expected: 2) {
                let point = Point(x: coordinates[0], y: coordinates[1])
                points.append(point)
            }
        }
        
        let start = Date()
        let result = solve(points: points)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
