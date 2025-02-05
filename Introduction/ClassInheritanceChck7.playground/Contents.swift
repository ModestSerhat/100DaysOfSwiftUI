import Cocoa

// Creating classes, another custom data type similar to structs
// The difference between classes and structs, are inheritance allowing to override their parents functionality, no default memberwise initializer, copying one's instance changes the other's data, when a final copy of class is destroyed a deinitializer function will be run and even if the class is constant the variable properties of it can be changed

class Game {
    var score: Int {
        didSet { // Classes can also have property observers like structs
            print("Score is now \(score)")
        }
    }
    
    init(score: Int) { // Classes must have a custom initializer for inheritance
        self.score = score
    }
}

var newGame = Game(score: 10)
newGame.score += 10

class Employee { // Classes can be marked as final class Employee to make them not support inheritance
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee { // Classes can inherit from another class and have the properties and methods of the parent class and have their own properties/methods
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() { // Override keyword can be used to override the functionality of the parent class, the function of the parent class can be called with super.printSummary()
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work() // Inheritance can give specialization to child classes with their own work methods
joseph.work()
robert.printSummary() // Overridden printSummary for Developer class
joseph.printSummary() // Inherited printSummary for Manager class by Employee

// Class initializers must be created with every class and must call their parent's initializer if it's a child class

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric) // super.init must be after child class properties
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// All copies of a class share the same data
class User {
    var username = "Anonymous"
    
    func copy() -> User { // Deep copy of class can be ensured with copy() method
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1 // Shallow copy of class
user2.username = "Taylor"
print(user1.username, user2.username)
user1.username = "Swift"
print(user1.username, user2.username)
var user3 = user1.copy()
user3.username = "Taylor"
print(user1.username, user3.username)

// Deinitializers are run when the last reference of a class instance is destroyed, this can be useful for variables that are in a smaller scope (for loop, if clause, etc.)

class User2 {
    let id: Int

    init(id: Int) { // Run when class is initialized
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit { // Run when class is deinitialized (all references to the instance are destroyed)
        print("User \(id): I'm dead!")
    }
}

var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// Working with variables inside classes

// Swift's classes work like references, they point to an instance if the reference is a variable it could be changed to reference another class
class User3 {
    var name = "Paul"
}

var userVar = User3()
userVar.name = "Taylor"
userVar = User3()
print(userVar.name) // Despite changing the first class instance's name to "Taylor" it will still print "Paul" since the instance has been changed (variable instance)

let userConst = User3()
userConst.name = "Taylor"
print(userConst.name) // Despite userConst being a constant instance, the property of name can be changed if it's a variable (variable property)

// Structs hold their data directly and don't have to be concerned about variable instances and properties, if you try to change a data inside a constant struct instance the data won't change since it affects the struct instance as a whole. This also makes classes don't require the need for mutating keyword for their methods because constant class instances work differently than constant struct instances.

// Checkpoint 7

class Animal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Woof woof!")
    }
    
    init() {
        super.init(legs: 4)
    }
}

class Cat: Animal {
    var isTame: Bool
    
    func speak() {
        print("Meow!")
    }
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    override func speak() {
        print("Ruff ruff!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Yip yip!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Mraow!")
    }
    
    init() {
        super.init(isTame: true)
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
    
    init() {
        super.init(isTame: false)
    }
}

let corgi = Corgi()
let poodle = Poodle()
let persian = Persian()
let lion = Lion()

corgi.speak() 
poodle.speak() 
persian.speak() 
lion.speak() 
