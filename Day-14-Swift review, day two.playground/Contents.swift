
// Functions

func favoriteAlbum() {
    print("my favorite album is ...")
}

func funcWithParams(name: String, age: Int) {
    print("\(name) \(age)")
}

// External and internal parameter names

func countLetters(in string: String){
    print(string.count)
}

countLetters(in: "Mehmet")


// specify an underscore, _, as the external parameter name, which tells Swift that it shouldn't have any external parameter name at all.

func printString(_ string: String){
    print(string)
}

printString("Ahmet")


func countLettersInString(_ str: String) {
    print(str.count)
}

countLettersInString("Hello")

// As you can see, that makes the line of code read like an English sentence: “count letters in string hello”.

// While there are many cases when using _ is the right choice, Swift programmers generally prefer to name all their parameters. And think about it: why do we need the word “String” in the function – what else would we want to count letters on?

// So, what you’ll commonly see is external parameter names like “in”, “for”, and “with”, and more meaningful internal names. So, the “Swifty” way of writing this function is like

countLetters(in: "A String")

// That means you call the function with the parameter name “in”, which would be meaningless inside the function. However, inside the function the same parameter is called “string”, which is more useful. So, the function can be called like this:

countLetters(in: "A String")


// Return values
// ->

func albumIsMehmet(name: String) -> Bool {
    return false
}

if(albumIsMehmet(name: "Walk in Rain")) {
    print("Album is Mehmet")
} else {
    print("Album is not Mehmet")
}

// If your function returns a value and has only one line of code inside it, you can omit the return keyword entirely – Swift knows a value must be sent back, and because there is only one line that must be the one that sends back a value.

func getMeaningOfLife() -> Int {
    42
}



// Optionals

//  If we wanted to tell Swift that this function might return a value or it might not, we need to use this instead:

func getHeaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

// String? it means "Optional string"

var status: String?
status = getHeaterStatus(weather: "rainy")

// Optinal Unwrapping

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

// That takes a string and prints a message depending on its contents. This function takes a String value, and not a String? value – you can't pass in an optional here, it wants a real string, which means we can't call it using the status variable we made.

// Swift has two solutions. Both are used, but one is definitely preferred over the other. The first solution is called optional unwrapping, and it's done inside a conditional statement using special syntax. It does two things at the same time: checks whether an optional has a value, and if so unwraps it into a non-optional type then runs a code block.

// The syntax looks like this:

if let unwrappedStatus = status {
    // unwrappedStatus contains a non-optional value!
} else {
    // in case you want an else block, here you go...
}


if let haterStatus = getHeaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}


// another example

var items = ["James", "John", "Sally"]

// If we wanted to write a function that looked in that array and told us the index of a particular name, we might write something like this:

func position(of string: String, in array: [String]) -> Int? {
    for i in 0..<array.count {
        if array[i] == string {
            return i
        }
    }
    
    return nil
}

let indexOfString = position(of: "a", in: ["b", "c"])

if let indexOfString = indexOfString {
    print("index founded")
} else {
    print("index not founded")
}


// Force unwrapping optionals.

// ! Force unwrapping operator
// Note the exclamation mark: it means "I'm certain this contains a value, so force unwrap it now."
// only use if you sure and prefer normal unwrapping.


// Implicitly unwrapped optionals

// An implicitly unwrapped optional might contain a value, or might not, but it does not need to be unwrapped before it is used. Swift won't check for you, so you need to be extra careful. Example: String! might contain a string, or it might contain nil – and it's down to you to use it appropriately. It’s like a regular optional, but Swift lets you access the value directly without the unwrapping safety. If you try to do it, it means you know there’s a value there – but if you’re wrong your app will crash.

// this code not worked
//var uhoh: String!
//uhoh = "a string"
//print(uhoh)



// Optional chaining

var name: String? = "Mehmet"

// abc?.def?.aMethod()   : optional chaining


// Enumeration

// Enumerations – usually just called “enum” and pronounced “ee-num” - are a way for you to define your own kind of value in Swift. In some programming languages they are simple little things, but Swift adds a huge amount of power to them if you want to go beyond the basics.

enum WeatherType {
    case sun, cloud, rain, wind, snow
}

func getHeaterStatusFromEnum(weater: WeatherType) -> String? {
    if weater == .sun {
        return nil
    } else {
        return "Hate"
    }
}

getHeaterStatusFromEnum(weater: .cloud)


func rewriteGetHeaterStatusFromEnum(weater: WeatherType) -> String? {
    switch weater {
    case .sun:
        return nil
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}


// Enums with additional values

enum WeatherTypeWithValue {
    case sun
    case wind(speed: Int)
}

func getHeaterStatusWithEnumValue(weather: WeatherTypeWithValue) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    default:
        return "hate"
    }
}

getHeaterStatusWithEnumValue(weather: .wind(speed: 4))

// You can see .wind appears in there twice, but the first time is true only if the wind is slower than 10 kilometers per hour. If the wind is 10 or above, that won't match. The key is that you use let to get hold of the value inside the enum (i.e. to declare a constant name you can reference) then use a where condition to check.

// Swift evaluates switch/case from top to bottom, and stops as soon as it finds a match. This means that if case .cloud, .wind: appears before case .wind(let speed) where speed < 10: then it will be executed instead – and the output changes.

// So, think carefully about how you order cases!


// Tip: Swift’s optionals are actually implemented using enums with associated values. There are two cases: none, and some, with some having whatever value is inside the optional.


func knockKnock(_ caller: String?) {
 
    switch caller {
    case .none:
        print("slience")
    case .some(let person):
        print(person)
    }
}

knockKnock(nil)
knockKnock("Mehmet")



// Structs


struct Person {
    var clothers: String
    var shoes: String
    
    // Functions in structs, it's called a method
    
    func describe() {
        print("I like wearing \(clothers) with \(shoes)")
    }
}

let taylor = Person(clothers: "T-shirts", shoes: "sneakers")

taylor.clothers

var taylorCopy = taylor

taylorCopy.shoes = "flip flops"

taylor.shoes
taylorCopy.shoes

taylor.describe()



// Classes

// Swift has another way of building complex data types called classes. They look similar to structs, but have a number of important differences, including:

//You don't get an automatic memberwise initializer for your classes; you need to write your own.

// You can define a class as being based off another class, adding any new things you want.

// When you create an instance of a class it’s called an object. If you copy that object, both copies point at the same data by default – change one, and the copy changes too.


// Initializing an object

class PersonClass {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

// Class inheritance

class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La la la la")
    }
}

var meh = Singer(name: "taylor", age: 24)
meh.name
meh.age

meh.sing()

// That colon is what does the magic: it means "CountrySinger extends Singer." Now, that new CountrySinger class (called a subclass) doesn't add anything to Singer (called the parent class, or superclass) yet. We want it to have its own sing() method, but in Swift you need to learn a new keyword: override. This means "I know this method was implemented by my parent class, but I want to change it for this subclass."

// Having the override keyword is helpful, because it makes your intent clear. It also allows Swift to check your code: if you don't use override Swift won't let you change a method you got from your superclass, or if you use override and there wasn't anything to override, Swift will point out your error.

// So, we need to use override func, like this:

class CountrySinger : Singer {

    override func sing() {
        print("Trucks, guitars, and liquor")
    }
}

var countrySinger = CountrySinger(name: "Tay", age: 33)
countrySinger.sing()



class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("Grrrr rargh rargh rarrrrgh!")
    }
}


// Working with Objective-C code

// @obj , @objcMembers

// Values vs References

// When you copy a struct, the whole thing is duplicated, including all its values. This means that changing one copy of a struct doesn't change the other copies – they are all individual. With classes, each copy of an object points at the same original object, so if you change one they all change. Swift calls structs "value types" because they just point at a value, and classes "reference types" because objects are just shared references to the real value.

// This is an important difference, and it means the choice between structs and classes is an important one:

// If you want to have one shared state that gets passed around and modified in place, you're looking for classes. You can pass them into functions or store them in arrays, modify them in there, and have that change reflected in the rest of your program.
// If you want to avoid shared state where one copy can't affect all the others, you're looking for structs. You can pass them into functions or store them in arrays, modify them in there, and they won't change wherever else they are referenced.
// If I were to summarize this key difference between structs and classes, I'd say this: classes offer more flexibility, whereas structs offer more safety. In practice, which you choose depends on the Apple framework you’re working with: UIKit, AppKit, SpriteKit and the other older frameworks rely heavily on structs for data and classes for user interface elements, whereas SwiftUI flips things around and uses structs for user interface elements and classes for data.

