
// Closures

// Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.

// Functions used in this way are called closures, and although they work like functions they are written a little differently.

// create a function without a name, assings that function to driving.
let driving = {
    print("I'm driving in my car")
}

driving()


// Accepting parameters in a closure

let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}

// One of the differences between functions and closures is that you don’t use parameter labels when running closures. So, to call driving() now we’d write this:
driving2("test")


// Returning values from a closure

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place)"
}

let message = drivingWithReturn("London")
print(message)


// Closures As Parameters

let paramDiriving = {
    print("I'm driving my car")
}

func travel(action: () -> Void) {
    print("I'm gettings ready to go.")
    action()
    print("I arrived!")
}

travel(action: paramDiriving)


// Trailing closure syntax
// If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.
travel() {
   print("I'm driving my carrr")
}

travel {
    print("without paranteses")
}




