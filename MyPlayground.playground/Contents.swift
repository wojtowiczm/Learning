//: Playground - noun: a place where people can play

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



//Problem:
//We would like to check what users are actively using one of our web applications and, if so, ask for their opinion.
//
//Each user enters the application and navigates between pages. For each user, we log whenever he or she opens main page or any other page. Whenever he or she open a page for the first time or after a break of at least 30 minutes, we count it as a new session. We will ask the user for his or her opinion only when for the last three days he or she used the application each day and in total he or she has had at least six unique sessions.
//
//Task:
//Write a function that will receive the log, i.e. a sequence of timestamps in chronological order. Each timestamp denotes single time the user has opened the website. The function should return True if we should ask the user for his or her opinion and False otherwise. Timestamps are strings in the format of 'YYY-MM-DD hh:mm:ss', using user's time zone. You can assume that the last entry is with today's date.

var firstLog = ["2017-03-10 08:13:11", "2017-03-10 19:01:27", "2017-03-11 07:35:55", "2017-03-11 16:15:11", "2017-03-12 08:01:41", "2017-03-12 17:19:08"] // should return true
var secondLog = ["2017-03-10 18:58:11", "2017-03-10 19:01:27", "2017-03-11 07:35:55", "2017-03-11 16:15:11", "2017-03-12 08:01:41", "2017-03-12 17:19:08"] // shuld return false
func toDate(_ string: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter
    dateFormatter.dateFormat = "YYY-MM-DD HH:mm:ss"
    return dateFormatter.date(from: string)
}

func shouldAskForOpinion(_ log: [String]) -> Bool {
    let newSessionInterval: TimeInterval = 60 * 30 // 30 minutes
    var uniqueSessions = 1
    var dates = log.compactMap { toDate($0) }
    
    for i in 0...dates.count - 2 {
        if newSessionInterval < getIntervalBetweenDates(dates[i],
                                                        dates[i + 1]) {
            uniqueSessions += 1
        }
    }
    return uniqueSessions >= 6
    
}

func getIntervalBetween(_ dateOne: Date,_ dateTwo: Date) -> TimeInterval {
    return dateTwo.timeIntervalSince(dateOne)
}
//print(shouldAskForOpinion(firstLog))
//print(shouldAskForOpinion(secondLog))
print(shouldAskForOpinion(firstLog))
