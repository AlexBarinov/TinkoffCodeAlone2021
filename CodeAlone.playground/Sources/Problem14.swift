import Foundation

public class Problem14 {
    static func solve(code: [[Character]]) -> String {
        var result = ""
        for c in code {
            let i = c.count / 2 - (1 - c.count % 2)
            result += String(c[i])
        }
        return result
    }
}

public extension Problem14 {
    static func run() {
        print("Problem 01:")

        guard
            var lines = Helper.load("Problem14", expected: 1),
            let values = Helper.parse(string: lines[0], expected: 2)
        else {
            print("\tError")
            return
        }
        
        let n = values[0]
        
        lines = lines.filter { $0.count > 0 }
        lines.removeFirst()
        
        var code = [[Character]]()
        
        for _ in 1...n {
            let symbol: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
            code.append(symbol)
        }
        
        for line in lines {
            let data = line.components(separatedBy: " ")
            if let index = Int(data[0]) {
                if let ri = code[index - 1].firstIndex(of: Character(data[1])) {
                    code[index - 1].remove(at: ri)
                }
            }
        }
        
        //print(code)
        
        let start = Date()
        let result = solve(code: code)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
