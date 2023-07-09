
// Closures With Parameters

func travel(action: (String) -> Void) {
    action("London")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}

print("Closures With Return Values")

// Closures With Return Values

func travelWithReturn(action: (String) -> String) {
    let description = action("London")
    print(description)
}

travelWithReturn { (place: String) -> String in
    return "I'm goint to \(place) in my car"
}

print("Shorthand Parameter Names")
// Shorthand Parameter Names
// ...
// As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too:

travelWithReturn { place in
    "I'm going to \(place) in my car"
}

print("Access parameters with dollar sign in closures")
// Swift has a shorthand syntax that lets you go even shorter. Rather than writing place in we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.

travelWithReturn {
        "I'm going to \($0) in my car"
}



// Advanced Closures

// Closures with multiple parameters

func travel(action: (String, Int) -> String) {
    let description = action("London", 60)
    print(description)
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}


// Returning Closures

func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let reslt = travel()
reslt("London")


// Capturing values

func travelCaptureValues() -> (String) -> Void {
    var counter = 1
    
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let fn = travelCaptureValues()
fn("London")
fn("London")
fn("London")
