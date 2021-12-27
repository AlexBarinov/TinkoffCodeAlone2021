import Foundation

public class Problem13 {
    private static let set = CharacterSet(charactersIn: "0123456789").inverted
    
    private static func strip(record: String) -> Int? {
        var digitsOnly = record.components(separatedBy: set).joined()
        if digitsOnly.count > 10 {
            let index = digitsOnly.index(digitsOnly.endIndex, offsetBy: -10)
            digitsOnly = String(digitsOnly[index...])
        }
        return Int(digitsOnly)
    }
    
    static func solve(records: [String], n: Int) -> String {
        var dicionary = [Int: String]()
        
        for record in records {
            if let stripped = strip(record: record) {
                dicionary[stripped] = record
            }
        }
        let key = dicionary.keys.sorted()[n - 1]
        return dicionary[key] ?? ""
    }
}

public extension Problem13 {
    static func run() {
        print("Problem 13:")

        guard
            let lines = Helper.load("Problem13", expected: 1),
            let values = Helper.parse(string: lines[0], expected: 2)
        else {
            print("\tError")
            return
        }
        
        let total = values[0]
        let n = values[1]
        
        let records = Array(lines[1...total])
        
        let start = Date()
        let result = solve(records: records, n: n)
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
