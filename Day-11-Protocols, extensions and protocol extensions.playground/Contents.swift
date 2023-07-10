
// Today you’re going to learn some truly Swifty functionality: protocols and protocol-oriented programming (POP).

// POP does away with large, complex inheritance hierarchies, and replaces them with much smaller, simpler protocols that can be combined together. This really is the fulfillment of something Tony Hoare said many years ago: “inside every large program, there is a small program trying to get out.”


// Protocols

// Protocols are a way of describing what properties and methods something must have. You then tell Swift which types use that protocol – a process known as adopting or conforming to a protocol.

protocol Identifiable {
    var id: String { get set }
}

// We can’t create instances of that protocol - it’s a description of what we want, rather than something we can create and use directly. But we can create a struct that conforms to it:

struct User: Identifiable {
    var id: String
}

func displayId(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

displayId(thing: User(id: "4123"))



// Protocol Inheritance

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

// Now we can make new types conform to that single protocol rather than each of the three individual ones.



// Extensions

// Extensions allow you to add methods to existing types, to make them do things they weren’t originally designed to do.

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let n = 8
n.squared()

// Swift doesn’t let you add stored properties in extensions, so you must use computed properties instead. For example, we could add a new isEven computed property to integers that returns true if it holds an even number:

extension Int {
    var isEven: Bool {
        self % 2 == 0
    }
}

n.isEven



// Protocol Extensions

// Protocols let you describe what methods something should have, but don’t provide the code inside. Extensions let you provide the code inside your methods, but only affect one data type – you can’t add the method to lots of types at the same time.

// Protocol extensions solve both those problems: they are like regular extensions, except rather than extending a specific type like Int you extend a whole protocol so that all conforming types get your changes.

let pythons = ["Eric", "Graham"]
let beatles = Set(["John","Ringo"])

// Swift's arrays and sets both conform to a protocol called Collection.

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()



// Protocol Oriented Programming

// Protocol extensions can provide default implementations for our own protocol methods. This makes it easy for types to conform to a protocol, and allows a technique called “protocol-oriented programming” – crafting your code around protocols and protocol extensions.

// First, here’s a protocol called Identifiable that requires any conforming type to have an id property and an identify() method:

protocol NewIdentifiable {
    var id: String { get set }
    func identify()
}

extension NewIdentifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

// Now when we create a type that conforms to Identifiable it gets identify() automatically:

struct NewUser: NewIdentifiable {
    var id: String
}

let user = NewUser(id: "348")

user.identify()



