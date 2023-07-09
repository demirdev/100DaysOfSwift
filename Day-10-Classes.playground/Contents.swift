
// Creating your own classes

// Classes are similar to structs in that they allow you to create new types with properties and methods, but they have five important differences and I’m going to walk you through each of those differences one at a time.

// 1. The first difference between classes and structs is that classes never come with a memberwise initializer. This means if you have properties in your class, you must always create your own initializer.

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")


// Class inheritance

// 2. The second difference between classes and structs is that you can create a class based on an existing class – it inherits all the properties and methods of the original class, and can add its own on top.

// This is called class inheritance or subclassing, the class you inherit from is called the “parent” or “super” class, and the new class is called the “child” class.


class Poddle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

// For safety reasons, Swift always makes you call super.init() from child classes – just in case the parent class does some important work when it’s created.


// Overriding Methods

class NewDog {
    func makeNoise() {
        print("Woof!")
    }
}

class NewPoodle: NewDog {
    override func makeNoise() {
        print("Yip!")
    }
}

let newPoppy = NewPoodle()
newPoppy.makeNoise()


// Final Classes

// Although class inheritance is very useful – and in fact large parts of Apple’s platforms require you to use it – sometimes you want to disallow other developers from building their own class based on yours.

// Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written.

// To make a class final just put the final keyword before it, like this:

final class FinalDog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}


// Copying Objects

// The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.

class Singer {
    var name = "Mehmet"
}

var singer = Singer()
singer.name

// both singer and newSinger point to th esame object in memory
// Because classes works this way
var newSinger = singer
newSinger.name = "Ali"

singer.name


struct StructSinger {
    var name = "Ahmet"
}

var structSinger = StructSinger()
var newStructSinger = structSinger
newStructSinger.name = "Kemal"

newStructSinger.name
structSinger.name



// Deinitializers

// The fourth difference between classes and structs is that classes can have deinitializers – code that gets run when an instance of a class is destroyed.

class Person {
    var name = "John"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}



// Mutability
// The final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.

// However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.

// This difference means you can change any variable property on a class even when the class is created as a constant – this is perfectly valid code:

class SSinger {
    var name = "Ramazan"
}

let ramazan = SSinger()
ramazan.name = "Ramazannn"

// If you want to stop that from happening you need to make the property constant:

class SSSinger {
    let name = "cannot change this value"
}

