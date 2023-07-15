import UIKit
import SwiftUI

// Properties

// Property observers

struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    
    func updateUI(msg: String) {
        print(msg)
    }
    
}

var taylor = Person(clothes: "T-shirts")
taylor.clothes = "hat"


// Computed property

struct PersonComputed {
    var age: Int
    
    var ageInDogYears: Int {
        get {
            age * 7
        }
        
        set {
            print(newValue)
        }
    }
    
}

var personComputed = PersonComputed(age: 10)
personComputed.ageInDogYears
personComputed.ageInDogYears = 4
personComputed.ageInDogYears


// Static properties and methods

// Static properties

struct ProgrammerFan {
    static var favoriteSong = "Hello world!"
}

let programmerFan = ProgrammerFan()
ProgrammerFan.favoriteSong

// So, a Taylor Swift fan has a name and age that belongs to them, but they all have the same favorite song.

// Because static methods belong to the struct itself rather than to instances of that struct, you can't use it to access any non-static properties from the struct.



// Access Control

// four modifiers
// public
// internal
// fileprivate
// private

class Language {
    private var name: String?
}

let lang = Language()
// lang.name : error: name is inaccesible due to 'private' protection level



// Polymorphism and typecasting

// Polymorphism

class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots."
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        "The live album \(name) sold lots"
    }
}

var mehmet = StudioAlbum(name: "Mehmet D.", studio: "The Block")
var ahmet = StudioAlbum(name: "Fearless", studio: "AI Studio")
var itunesLive = LiveAlbum(name: "itunes ", location: "new location")

var allAlbums: [Album] = [mehmet, ahmet, itunesLive]

for album in allAlbums {
    print(album.getPerformance())
}


// Typecasting

for album in allAlbums {
    print(album.getPerformance())
    
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

print("New way")
// typecasting all items to as Array of LiveAlbum, if cannot, use empty array.
for album in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.location)
}


//

let number = 5
// let text = number as! String // error:
let text = String(number)



// Closures

let vw = UIView()
UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

let message = "Button pressed"

Button("Press Me", action: {
    print(message)
})

Button("Press Me") {
    print(message)
}





