import Foundation

class Helper {
    static func load(_ file: String, expected: Int = 0) -> [String]? {
        guard
            let url = Bundle.main.url(forResource: "Input/\(file)", withExtension: "txt"),
            let data = try? Data(contentsOf: url),
            let string = String(data: data, encoding: .utf8)
        else {
            return nil
        }
        let lines = string.components(separatedBy: "\n")
        return lines.count >= expected ? lines : nil
    }
    
    static func parse(string: String, expected: Int = 0) -> [Int]? {
        let values = string.components(separatedBy: " ").compactMap { Int($0) }
        return values.count >= expected ? values : nil
    }
}
