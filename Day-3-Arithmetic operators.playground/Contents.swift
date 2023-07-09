
// + - * /
// special operator for calculating remainders after division: %
// %


// Operator overlading

let a = 10
let b = 20 + 30

let name = "mehmet "
let surname = "demir"

let fullName = name + surname

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]

let beatles = firstHalf + secondHalf


// Compund assignment operators

var score = 95
score -= 5

var quote = "This is a "
quote += "swift program"


// Comparison Operators

let c = 6
let d = 4

c == d
c != d

c < d
c >= d

// works for strings as natural alphabetical order:
"Azylor" <= "Bwift"


// Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces - lucky!")
} else if firstCard  + secondCard == 21 {
    print("Blackjack!")
}
else {
    print ("Regular cards")
}

// Combining Conditions
// and , or
// && ||

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}

// Ternary Operator
let text = age1 == age2 ? "the ages is same" : "the ages is not same"

// Switch statements

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

// swift will only run the code inside each case. If you want execution to continue on to the next case, use the fallthrough keyword like this:

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

// Range Operators
// ..< and ...
// You can make ranges using ..< and ... depending on whether the last number should be excluded or included.

let score2 = 85

switch score2 {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

let range = 1...5

print(range.lowerBound)
print(range.upperBound)

