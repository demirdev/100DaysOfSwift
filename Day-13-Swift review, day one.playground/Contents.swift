
// Variables and constants
// create variable
var name = "Mehmet"
// change it
name = "Ahmet"

// create constant
let constantName = "Ramazan"
// you can't change it
// constantName = "New"



// Types of Data
// String
var animal = "Dog"
var newAnimal: String
newAnimal = "Cat"

// Int
var age: Int
age = 39

// type safety.
// you can't make these
// name = 25
// age = "name"


// Float and Double ==> Always use Double

// Let's look at two more data types, called Float and Double. This is Swift's way of storing numbers with a fractional component, such as 3.1, 3.141, 3.1415926, and -16777216.5. There are two data types for this because you get to choose how much accuracy you want, but most of the time it doesn't matter so the official Apple recommendation is always to use Double because it has the highest accuracy.
var latitude: Double
latitude = 36.16667

var longitude: Float
// OK
longitude = -86.783333
// 1234568
longitude = -1234567.7899

// For more accurate use Double
var longitudeMoreAccurate: Double
longitudeMoreAccurate = -1234567.7899

// Double has limit
// -123456789123789.8
longitudeMoreAccurate = -123456789123789.78333


// Boolean

var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat = false


// Type inference

var aName = "Mehmet"
aName = "B"

var typeInferName = "Ahmet"

let ageNew = 20

let longitudeNew = -86.783333



// Operators
// + - * /
// += -=
// %

// Comparison Operators
// > >= < <=
// ! != ==


// String Interpolation
let a = "a"
let b = "b"

let c = "this is c : \(a) \(b)"
let z = a + " " + b + " " + c


// Arrays
var letters = ["a", "b", "c"]
type(of: letters)

//var lettersMistake = ["a", 3]
//type(of: lettersMistake)

var heterogeneousArray: [Any] = ["b", 4]
type(of: heterogeneousArray)


// Create Arrays
var songs: [String] = []

var songsNew = [String]()

// Array Operators

var aArray = ["a", "b"]
var bArray = ["c", "d"]

aArray + bArray

aArray += bArray


// Dictionaries

var person = [
    "first": "Mehmet",
    "last": "Demir"]
person["first"]


// Conditional Statements

var action: String
var person2 = "hater"

if person2 == "hater" {
    action = "hate"
} else if person2 == "cc" {
    print("cc")
} else {
    action = "cruise"
}

// Evaluating multiple conditions

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}

// ! (not) operator.

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}


// Loops

for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

for _ in 1...5 {
    print("not important value")
}

for num in 1..<5 {
    print(num)
}


// Looping over array

for letter in letters {
    print(letter)
}

for i in 0..<letters.count {
    print("letters[\(i)] = \(letters[i])")
}

// Inner Loops
// You can put loops inside loops if you want. Be careful.

// for personNumber in 0..<people.count    this is perfect.


// While Loops

var counter = 0

while true {
    print("counter = \(counter)")
    counter += 1
    
    if counter == 10 {
        break
    }
}

for letter in letters {
    if letter == "a" {
        continue
    }
    
    print(letter)
}


// Swift case

let liveAlbums = 1

switch liveAlbums {
case 0:
    print("You're just starting out")
    
case 1:
    print("You just released iTunes Live From SoHo")
    
default:
    print("Have you done something new?")
}


// Swift can apply some evaluation to your case statements in order to match against variables.

switch liveAlbums {
case 0...1:
    print("You're just starting out")
    
case 2...3:
    print("You're a rising star")
    
default:
    print("Have you?")
    
}

// One thing you should know is that switch/case blocks in Swift don't fall through like they do in some other languages you might have seen. If you're used to writing break in your case blocks, you should know this isn't needed in Swift.

// Instead, you use the fallthrough keyword to make one case fall into the next – it's effectively the opposite. Of course, if you have no idea what any of this means, that's even better: don't worry about it!
