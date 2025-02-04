import Cocoa

// Structs are custom, complex datatypes with their own variables and functions

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

// Initializing structs with values, accessing them and running functions of them
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String // Variables and constants of a structs are called properties and functions are called methods
    var vacationRemaining: Int = 14

    mutating func takeVacation(days: Int) { // To mutate variables of a struct instance within a method it must be marked as mutating
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 9) // .init, can be omitted when initializing and default parameters can be omitted if no need to be changed
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// Computed properties, getters and setters

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int { // Similar syntax to closures, calculates value everytime when a property changes
        vacationAllocated - vacationTaken
    }
}

var archer2 = Employee2(name: "Sterling Archer")
archer2.vacationTaken += 4
print(archer2.vacationRemaining)
archer2.vacationTaken += 4
print(archer2.vacationRemaining)

struct Employee3 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get { // Code that reads when one of the properties in get change
            vacationAllocated - vacationTaken
        }
        set { // Code that writes, executes ween vacationRemaining is written and can be seen with newValue
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer3 = Employee3(name: "Sterling Archer", vacationAllocated: 14)
archer3.vacationTaken += 4
archer3.vacationRemaining = 5
print(archer3.vacationAllocated)

// Property observers

struct Game {
    var score = 0 {
        didSet { // didSet runs after score changes, the previous value can be obtained with oldValue
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {// willSet runs before contacts changes, the new value can be obtained with newValue
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet { // didSet runs after contacts changes, the previous value can be obtained with oldValue
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// Creating custom initializers

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name // self. refers to the current instance, in other words it sets the current instance's name property to the parameter name property's value
        //self.number = number
        self.number = Int.random(in: 1...99)
    }
}
// let player = Player(name: "Megan R", number: 15) Swift's default initializer (memberwise initializer)
// Custom initializers can be created that allow for other parameter names and initialize property in other ways

let player = Player(name: "Megan R")
print(player.number)
