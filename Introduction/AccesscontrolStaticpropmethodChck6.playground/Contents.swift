import Cocoa

// Limiting external access with access control

struct BankAccount {
    private var funds = 0 // With the private keyword only the methods in struct can change it

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// Access control allows the control of accessing a struct's properties and methods
// private for “don’t let anything outside the struct use this.”
// fileprivate for “don’t let anything outside the current file use this.”
// public for “let anyone, anywhere use this.”
// private(set) allows anyone outside of the struct to read this value but only allows anything inside the struct to write it


// Static properties and methods

// Allows for adding a property or a method to the struct itself rather than one instance for accessing example data or storing fixed data that needs to be accessed in various places

struct School {
    @MainActor static var studentCount = 0

    @MainActor static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1 // No need for mutating since it's shared on all instances/type of struct
    }
} // @MainActor added to fix Swift 6 concurrency issues

School.add(student: "Taylor Swift")
print(School.studentCount)

// Static methods can't access non-static methods/properties
// To access static code from non-static always use type's name such as School.studentCount or Self to refer to current type

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
} // First example where static data can be accessed with any instance/by type

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
} // Second example where an example instance is created for sample data (useful for SwiftUI Previews)

// Checkpoint 6

struct Car {
    let model: String
    let seatCount: Int
    private(set) var currentGear: Int = 1 {
        didSet {
            print("Gear of \(model) shifted to \(currentGear)")
        }
    }
    
    mutating func gearUp() {
        if currentGear < 10 {
            currentGear += 1
        } else {
            print("You are already in top gear!")
        }
    }
    
    mutating func gearDown() {
        if currentGear > 1 {
            currentGear -= 1
        } else {
            print("You are already in lowest gear!")
        }
    }
}

var myCar = Car(model: "Toyota Corolla", seatCount: 4)
for _ in 1...10 {
    myCar.gearUp()
}
for _ in 1...10 {
    myCar.gearDown()
}
