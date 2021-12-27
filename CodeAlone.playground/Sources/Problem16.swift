import Foundation

public class Problem16 {
    struct Point {
        var x: Int
        var y: Int
    }
    
    static var wall = [[Int]]()
    static var queue = [Point]()
    
    static func solve(startX: Int, startY: Int, endX: Int, endY: Int) -> Int {
        let maxX = 0 ..< wall.count, maxY = 0 ..< wall[0].count
        var step: Int = 1

        queue.append(Point(x: startX, y: startY))

        while queue.count > 0 {
            var nextQueue = [Point]()
            
            for i in 0..<queue.count {
                let p = queue[i]
                wall[p.x][p.y] = step
                
                if p.x == endX && p.y == endY {
                    return step - 1
                }
                
                if maxX ~= p.x - 1, maxY ~= p.y, wall[p.x - 1][p.y] == 0 {
                    nextQueue.append(Point(x: p.x - 1, y: p.y))
                }
                if maxX ~= p.x, maxY ~= p.y - 1, wall[p.x][p.y - 1] == 0 {
                    nextQueue.append(Point(x: p.x, y: p.y - 1))
                }
                if maxX ~= p.x, maxY ~= p.y + 1, wall[p.x][p.y + 1] == 0 {
                    nextQueue.append(Point(x: p.x, y: p.y + 1))
                }
                if maxX ~= p.x + 1, maxY ~= p.y, wall[p.x + 1][p.y] == 0 {
                    nextQueue.append(Point(x: p.x + 1, y: p.y))
                }
            }
            queue = nextQueue
            step += 1
        }
        return -1
    }
}

public extension Problem16 {
    static func run() {
        print("Problem 16:")

        guard
            let lines = Helper.load("Problem16")
        else {
            print("\tError")
            return
        }

        var startX = 0, startY = 0
        var endX = 0, endY = 0

        for x in 0 ..< lines.count {
            var row = [Int]()
            let atoms = lines[x].components(separatedBy: " ")
            for y in 0 ..< atoms.count {
                switch atoms[y] {
                case "A":
                    startX = x
                    startY = y
                    row.append(0)
                case "B":
                    endX = x
                    endY = y
                    row.append(0)
                case ".":
                    row.append(0)
                case "#":
                    row.append(-1)
                default:
                    break
                }
            }
            if row.count > 0 {
                wall.append(row)
            }
        }
        
        let start = Date()
        let result = solve(startX: startX, startY: startY, endX: endX, endY: endY)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
