
// Creating Structs

struct Sport {
    // Stored Properties
    var name: String
    var isOlympicSport: Bool
    
    // Computed Property
    // a property that runs code to figure out its value.
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

var tennis = Sport(name: "Tennis", isOlympicSport: false)
print(tennis.name)

tennis.name = "Lawn Tennis"

print(tennis.olympicStatus)

// Computed Properties
// implemented in Sport struct.


// Property Observers
// Property Observers let you run code befor eor after any property changes.

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
    
    
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80

// What we want to happen is for Swift to print a message every time amount changes, and we can use a didSet property observer for that. This will run some code every time amount changes:
// implemented in Progress struct, on amount stored property

// You can also use willSet to take action before a property changes, but that is rarely used.



// Methods
// Functions inside structs are called methods, but they still use the same func keyword.

struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()


// What's the difference between a function and a method?
// Honestly, the only real difference is that methods belong to a type, such as structs, enums, and classes, whereas functions do not.

// There is one more advantage to methods, but it’s quite subtle: methods avoid namespace pollution. Whenever we create a function, the name of that function starts to have meaning in our code – we can write wakeUp() and have it do something. So, if you write 100 functions you end up with 100 reserved names, and if you write 1000 functions you have 1000 reserved names.

// That can get messy quickly, but by putting functionality into methods we restrict where those names are available – wakeUp() isn’t a reserved name any more unless we specifically write someUser.wakeUp(). This reduces the so-called pollution, because if most of our code is in methods then we won’t get name clashes by accident.



// Mutating methods
// When you want to change a property inside a method, you need to mark it using the mutating keyword, like this:

struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

// Because it changes the property, Swift will only allow that method to be called on Person instances that are variables:
var personWithLet = Person(name: "Jack")
personWithLet.makeAnonymous()

//let newPerson = Person(name: "new")
//newPerson.name = "Help"



// Properties and methods of Strings
// Strings are also structs, which means they too have their own methods and properties
let string = "Do or do not, there is no try."

print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())



// Properties and Methods of Arrays
// Arrays are also structs, which means they too have their own methods and properties

var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")

toys.firstIndex(of: "Buzz")

print(toys.sorted())

toys.remove(at: 0)

toys


