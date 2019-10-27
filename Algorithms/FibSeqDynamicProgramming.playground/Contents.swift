//: Task: Write a function that receiving n and return fibbonacci value for that number. Use dynamic programmign aproach.


import Foundation


var memoized: [Int?]?

func fibSeqDynamic(n: Int) -> Int{
    guard n != 0 else { return 0 }
    memoized = Array(repeating: nil, count: n+1)
    return fib(n: n)
}

func fib(n: Int) -> Int {
    let result: Int
    if memoized![n] != nil {
        return memoized![n]!
    }
    if n == 1 || n == 2 {
        result = 1
    } else {
        result = fib(n: n-1) + fib(n: n-2)
        memoized![n] = result
    }
    return result
}


// O(n+1)
fibSeqDynamic(n: 6) // returns 8
fibSeqDynamic(n: 10) // return 55
fibSeqDynamic(n: 20) // returns 6764
