import Foundation

//Each user enters the application and navigates between pages. For each user, we log whenever he or she opens main page or any other page. Whenever he or she open a page for the first time or after a break of at least 30 minutes, we count it as a new session. We will ask the user for his or her opinion only when for the last three days he or she used the application each day and in total he or she has had at least six unique sessions.
//
//Task:
//Write a function that will receive the log, i.e. a sequence of timestamps in chronological order. Each timestamp denotes single time the user has opened the website. The function should return True if we should ask the user for his or her opinion and False otherwise. Timestamps are strings in the format of 'YYY-MM-DD hh:mm:ss', using user's time zone. You can assume that the last entry is with today's date.

var firstLog = ["2017-03-10 08:13:11", "2017-03-10 19:01:27", "2017-03-11 07:35:55", "2017-03-11 16:15:11", "2017-03-12 08:01:41", "2017-03-12 17:19:08"] // should return true
var secondLog = ["2017-03-10 18:58:11", "2017-03-10 19:01:27", "2017-03-11 07:35:55", "2017-03-11 16:15:11", "2017-03-12 08:01:41", "2017-03-12 17:19:08"] // shuld return false


func shouldAskForOpinion(_ log: [String]) -> Bool {
    let newSessionInterval: TimeInterval = 60 * 30 // 30 minutes
    let minimumUniqueSessions = 6
    var uniqueSessions = 1
    var dates = log.compactMap { toDate($0) }
    
    for i in 0...dates.count - 2 {
        if newSessionInterval < intervalBetweenDates(dates[i], dates[i + 1]) {
            uniqueSessions += 1
        }
    }
    return minimumUniqueSessions <= uniqueSessions
}

func toDate(_ string: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter
    dateFormatter.dateFormat = "YYY-MM-DD HH:mm:ss"
    return dateFormatter.date(from: string)
}

func intervalBetweenDates(_ dateOne: Date,_ dateTwo: Date) -> TimeInterval {
    return dateTwo.timeIntervalSince(dateOne)
}
print(shouldAskForOpinion(firstLog))
print(shouldAskForOpinion(secondLog))
