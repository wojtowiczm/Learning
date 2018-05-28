

//Your goal is to create a function to format a number given a template; if the number is not present, use the digits 1234567890 to fill in the spaces.
//
//A few rules:
//
//the template might consist of other numbers, special characters or the like: you need to replace only alphabetical characters (both lower- and uppercase);
//if the given or default string representing the number is shorter than the template, just repeat it to fill all the spaces.
//A few examples:
//
//numericFormatter("xxx xxxxx xx","5465253289") == "546 52532 89"
//numericFormatter("xxx xxxxx xx") == "123 45678 90"
//numericFormatter("+555 aaaa bbbb", "18031978") == "+555 1803 1978"
//numericFormatter("+555 aaaa bbbb") == "+555 1234 5678"
//numericFormatter("xxxx yyyy zzzz") == "1234 5678 9012"

import Foundation

func numericFormatter(_ template: String, _ numbers: String = "1234567890") -> String {
    
    var formated: [Character] = []
    var position = 0
    template.forEach {
        if isAllowed($0) {
            formated.append($0)
        } else {
            formated.append(getNumber(from: numbers, position: position))
            position += 1
        }
    }
    return String(formated)
}

func isAllowed(_ char: Character) -> Bool {
    if char == "+" || char == " " { return true }
    if let _ = Int("\(char)") { return true }
    return false
}

func getNumber(from numbers: String, position: Int) -> Character {
    var currentPos = position
    if numbers.count <= position {
        currentPos = position - numbers.count
    }
    return numbers[numbers.index(numbers.startIndex, offsetBy: currentPos)]
}

print(numericFormatter("+777 aaaa bbbb")) // == "+777 1234 5678
print(numericFormatter("+555 aaaa bbbb", "18031978")) // == "+555 1803 1978"
print(numericFormatter("xxxx yyyy zzzz")) // == "1234 5678 9012"


