let a = "a"
let b = "b"
let c = "c"

// Arrays

let letters: [String] = [a, b, c]

letters[0]

/// Sets
// sets are unordered
let lettersInSet = Set([a,b,c])
// sets are uniq values
let uniq = Set([a,a,a,b,c])

/// Tupples
var name = (first: "Taylor", last: "Swift")

name.0
name.first


// Arrays vs Sets vs Tupples, when which use ?

// Dictionaries

let heights: [String: Int] = [
    "mehmet": 65,
    "ahmet": 67
]

/// the "mehmet" called identifier or key.
heights["mehmet"]

// Dictionary default values
heights["mustafa", default: -1]

// Create Empty Dictionary
var teams = [String: String]()

teams["Paul"] = "Black"

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
var results2 = Array<Int>()


// Enums

enum Result {
    case success
    case failure
}

let reslt = Result.failure

let newResult: Result = .success


// Enum associated values

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

// Enum Raw Values
// swift assigns raw value from 0 => (mercury)
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

// create enum dynamically
let earth = Planet(rawValue: 2)

// you can assign raw values starts from 1 to increase 2,3,4
enum anEnum: Int {
    case a = 1
    case b
    case c
}
