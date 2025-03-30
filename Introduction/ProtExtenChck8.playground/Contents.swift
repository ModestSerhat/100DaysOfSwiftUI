import Cocoa

// Protocols are similar to contracts in Swift, they define what functionality a data type supports and Swift ensures these rules are followed. Protocols allows defining a set of methods/properties but don't implement them similar to a blue print.

protocol Vehicle {
    var name: String { get } // Conformers must have a variable/constant String that is readable/computed property with a getter
    var currentPassengers: Int { get set } // Conformers must have a variable Int that is readable/writable or with a getter and setter
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// Classes, structs and enums conforming to a protocol and one type can conform to multiple protocols if needed

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

// Protocols can be used as parameters as long as the given argument is a type that conforms to the protocol (Vehicle)
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTravelEstimates(using: [car, bike], distance: 150)

// Functions can return different types that can conform to a protocol but they can't be interchangable, by returning the same protocol type we've hidden two equatable integer types that can be compared, opaque return types allows information to be hidden in code but not from the compiler. Opaque types are covered to show its importance in SwiftUI

func getRandomNumber() -> some Equatable { // Adding some to keyword allows compiler to know which Equatable type but doesn't say which
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

// Creating and using extensions

var quote = "   The truth is rarely pure and never simple   "

extension String { // Extensions can add more methods and computed properties (must be computed to not increase data size) to an existing type, this is a method that returns another variable from a string
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines) // .trimmingCharacters trims characters with the given option, from Foundation
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
    
    mutating func trim() { // A method that mutates the variable itself, the naming conventions are intentional to differentiate trim and trimmed to show that one modifies the variable and other returns another variable
        self = self.trimmed()
    }
}

print(quote.trimmed())
quote.trim()
print(quote)

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book { // Extensions are also useful for keeping the memberwise initializers for structs and adding other custom initializers
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

// Creating and using protocol extensions

extension Collection {
    var isNotEmpty: Bool { // Adding isNotEmpty computed property to all Collection conforming types like Array, Set, Dictionary etc.
        isEmpty == false
    }
}

// Adding implementations and computed properties can lead to protocol-oriented programming, default implementation for conforming types can be added as well with extensions

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() { // Default implementation for sayHello()
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var estateAgent: String { get set }
    func salesSummary()
}

struct House: Building {
    let rooms: Int
    var cost: Int
    var estateAgent: String
    func salesSummary() {
        print("This is a house with \(rooms) rooms and a cost of $\(cost). It is sold by \(estateAgent).")
    }
}

struct Office: Building {
    let rooms: Int
    var cost: Int
    var estateAgent: String
    func salesSummary() {
        print("This is an office with \(rooms) rooms and a cost of $\(cost). It is sold by \(estateAgent).")
    }
}


let house = House(rooms: 4, cost: 100000, estateAgent: "Serhat")
house.salesSummary()

let office = Office(rooms: 4, cost: 75000, estateAgent: "Serhat")
office.salesSummary()
