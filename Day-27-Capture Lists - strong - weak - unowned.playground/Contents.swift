import Foundation

class Singer {
    func playSong() {
        print("Shake it off!")
    }
}

// Strong Capturing
// this is strong capturing, the taylor is live with closure.
func sing() -> () -> Void {
    let taylor = Singer()
    
    let singing = {
        taylor.playSong()
        return
    }
    
    return singing
}

let singFunction = sing()
singFunction()


// Weak Capturing
// taylor will be nil when returned from func.

func singWeak() -> () -> Void {
    let taylor = Singer()
    
    let singing = { [weak taylor] in
        taylor?.playSong()
        return
    }
    
    return singing
}

let weakSingFunc = singWeak()
weakSingFunc()

// unowned capturing
//That will crash in a similar way to our force-unwrapped example from earlier: unowned taylor says I know for sure that taylor will always exist for the lifetime of the closure I’m sending back so I don’t need to hold on to the memory, but in practice taylor will be destroyed almost immediately so the code will crash.
//
//You should use unowned very carefully indeed.

func unownedSing() -> () -> Void {
    let taylor = Singer()
    
    let singing = { [unowned taylor] in
        taylor.playSong()
        return
    }
    
    return singing
}


// Common problems

//
// Capture lists alongside parameters
//
// writeToLog { [weak self] user, messsage in
//
// }

//
// String reference cycles

