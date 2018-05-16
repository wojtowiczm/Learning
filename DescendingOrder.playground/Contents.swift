//Your task is to make a function that can take any non-negative integer as a argument and return it with its digits in descending order. Essentially, rearrange the digits to create the highest possible number.
//
//Examples:
//
//Input: 21445 Output: 54421
//
//Input: 145263 Output: 654321
//
//Input: 1254859723 Output: 9875543221


func descendingOrder(_ num: Int) -> Int {
    let sorted = "\(num)"
        .compactMap { Int("\($0)") }
        .sorted { $0 > $1 }
        .map {"\($0)"}
        .joined()
    
    return Int(sorted)!
}

descendingOrder(123456789)
