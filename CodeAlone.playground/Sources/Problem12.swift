import Foundation

public class Problem12 {
    // http://compoasso.free.fr/primelistweb/page/prime/liste_online_en.php
    private static let primes = [9999889, 9999901, 9999907, 9999929, 9999931, 9999937, 9999943, 9999971, 9999973, 9999991, 10000019, 10000079, 10000103, 10000121]
    
    static func solve() -> Int {
        var result = 0

        for i in 0..<primes.count {
            var j = i
            while j < primes.count && primes[j] - primes[i] <= 100 {
                let m = primes[j] * primes[i]
                if m < 100_000_000_000_000 {
                    result = max(result, m)
                    j += 1
                } else {
                    break
                }
            }
        }
        
        return result
    }
}

public extension Problem12 {
    static func run() {
        print("Problem 12:")
        
        let start = Date()
        let result = solve()
        let end = Date()
        
        print("\tAnswer: \(result)")
        print(String(format: "\tTook %.5f seconds", end.timeIntervalSince(start)))
        print("")
    }
}
