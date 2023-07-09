
// Functions

func printHelp() {
    let message = """
this is
message
"""
    
    print(message)
}

printHelp()


// Accepting Parameters & Return value

func square(number: Int) -> Int {
    return number * number
}

let result = square(number: 8)
print(result)


// Parameter Labels

func sayHello(to name: String){
    print("Hello \(name)")
}

sayHello(to: "Mehmet")


// Omitting Paramater Labels

func greet(_ person: String){
    print("Hello, \(person)")
}

greet("Mehmet")

// Default Parameters

func greetWithDefault(_ person: String, nicely: Bool = true) {
    if nicely {
        print("Hello, \(person)")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greetWithDefault("Taylor", nicely: false)


// Variadic Functions

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 2,3,4,5)


// Writing Throwing Functions

// Create error types
// First we need to define an enum that describes the errors we can throw. These must always be based on Swift’s existing Error type.

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}


// inout parameters

// All parameters passed into a Swift function are constants, so you can’t change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.

func doubleInPlace(number: inout Int){
    number *= 2
}

var l = 10
doubleInPlace(number: &l)
print(l)




