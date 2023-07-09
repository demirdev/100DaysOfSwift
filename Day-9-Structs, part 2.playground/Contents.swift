
// Initializers

struct User {
    var username: String
}

/// All structs come with one by default, called their memberwise initializer - this asks you to provide a value for each property when
/// you create the struct.
var user = User(username: "linus")


/// We can provide our own initilizer to replace default one.
struct NewUser {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new NewUser!")
    }
}

var newUser = NewUser()


/// So, as soon as you add a custom initializer for your struct, the default memberwise initializer goes away. If you want it to stay, move your custom initializer to an extension, like this:
struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee...")
    }
}

let roslin = Employee(name: "Roslin")

let anon = Employee()



// Referring to the current instance

struct PersonPure {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}


// Lazy Properties
// As a performance optimization, Swift lets you create some properties only when they are needed.
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")

/// But what if we didn't always need the family tree for a particular person? If we add the lazy keyword to  the familyTree property, then Swift will only create the FamilyTree struct when it's first accesed:
struct NewPerson {
    lazy var familyTree = FamilyTree()
}

print("Lazy test")

var person = NewPerson()
person.familyTree


// Static Properties and Methods

struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}


// Access Control
// private or public
struct UserModel {
    private var id: String
    
    func identity() -> String {
        return "My social security number is \(id)"
    }
}


struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "No one"
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")



