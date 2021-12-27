import Foundation

import Foundation

public class Problem11 {
    struct ScreamNode {
        var parent = [Int]()
        var children = [Int]()
    }
    
    static func solve(screamers s: [[Int]]) -> Int {
        var nodes = [ScreamNode]()
        var queue = [Int]()

        for _ in 0...s.count {
            nodes.append(ScreamNode())
        }
        
        for i in 1...s.count {
            var parent = s[i - 1]
            parent.removeFirst()
            
            if parent.count == 0 {
                queue.append(i)
                continue
            }
            
            nodes[i].parent = parent
            parent.forEach { p in
                nodes[p].children.append(i)
            }
        }
        
        var result = 0
        var sequence = 1
        
        while queue.count > 0 {
            let q = queue.removeFirst()
            
            nodes[q].children.forEach { c in
                if let ri = nodes[c].parent.firstIndex(of: q) {
                    nodes[c].parent.remove(at: ri)
                    if nodes[c].parent.count == 0 {
                        if let ii = queue.firstIndex(where: { $0 > c }) {
                            queue.insert(c, at: ii)
                        } else {
                            queue.append(c)
                        }
                    }
                }
            }
            
            result += sequence * q
            sequence += 1
        }
        
        return result
    }
}

public extension Problem11 {
    static func run() {
        print("Problem 11:")

        guard
            let lines = Helper.load("Problem11")
        else {
            print("\tError")
            return
        }
        
        var screamers = [[Int]]()
        for i in 1..<lines.count {
            if let value = Helper.parse(string: lines[i]), value.count > 0 {
                screamers.append(value)
            }
        }
        
        let start = Date()
        let result = solve(screamers: screamers)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
