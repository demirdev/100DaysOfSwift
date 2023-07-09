
// For loops


/// it will loop over arrays and ranges

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let letters = ["a", "b", "c"]

for letter in letters {
    print(letter)
}

/// If you don't use the constant that for loops give you, you should use an underscore instead so that Swift doesn't create needless values:

for _ in 1...5 {
    print("Play")
}

// While Loop

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

// Repeat Loop

repeat {
    print(number)
    number -= 1
} while number > 0

            
// Skipping Loops
var countDown = 10

while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break;
    }
    countDown -= 1
}
            
print("Blast off!")

// Infinite Loops

var counter = 0

while true {
    print(" ")
    counter += 1
    
    
    if(counter == 273){
        break
    }
}

