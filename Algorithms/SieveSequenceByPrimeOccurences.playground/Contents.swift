 
 //Task:
 //Write a function that receives two sequences: A and B of integers and returns one sequence C. Sequence C should contain all elements from sequence A (maintaining the order) except those, that are present in sequence B p times, where p is a prime number.
 
 //Example:
 //A=[2,3,9,2,5,1,3,7,10]
 //B=[2,1,3,4,3,10,6,6,1,7,10,10,10]
 //C=[2,9,2,5,7,10]
 
 import UIKit
 
 var a = [2,3,9,2,5,1,3,7,10]
 var b = [2,1,3,4,3,10,6,6,1,7,10,10,10]
 
 //
 
 func getSeguence(_ a: [Int],_ b: [Int]) -> [Int] {
    return a.filter { !isPrime(countIn(array: b, number: $0)) }
 }
 
 func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
 }
 
 func countIn(array: [Int], number: Int) -> Int {
    return array.filter { $0 == number}.count
 }
 
 var c = getSeguence(a, b)
 print(c)
