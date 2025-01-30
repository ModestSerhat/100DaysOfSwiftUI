import Cocoa

// If statements and boolean condition checking
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 { // Operational checking with if >=, ==, <=, <, >
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName { // Comparison with alphabetical ordering
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

// Make an array of 3 numbers
var numbers = [1, 2, 3]

// Add a 4th
numbers.append(4)

// Check if array has more than 3 numbers
if numbers.count > 3 {
    // Remove the oldest number
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"

if country == "Australia" { // != for not equal comparisons
    print("G'day!")
}

var username = ""

if username.count == 0 { // username.isEmpty == true/username.isEmpty is faster to not count all characters
    username = "Anonymous"
}
print("Welcome, \(username)")

// Using multiple statements, else if and else
let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

let temp = 25

if temp < 30 && temp > 20 { // Combining statements with && (and) operator
    print("It's a nice day")
}

let userAge = 19
let hasParentalConsent = false

if userAge >= 18 || hasParentalConsent { // Combining statements wiht || (or) operator
    print("You can buy the game")
}

enum TransportOption { // Statements and operators with enums
    case airplane, helicopter, bicycle, car, scooter
}

let option = TransportOption.car

if option == .airplane || option == .helicopter {
    print("Let's fly")
} else if option == .bicycle {
    print("I hope there's a bike path…")
} else if option == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

// Switch statements to check multiple conditions
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.wind

switch forecast { // Checking enum with exhaustive (covers all conditions) switch statement
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
default:
    print("Our forecast generator is broken!")
}

let place = "Metropolis"

switch place { // Switch statements work with strings/other types too
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
case "Metropolis":
    print("You're Superman!")
default:
    print("Who are you?")
}

let day = 1
print("My true love gave to me…")

switch day { // Switch statement with fallthrough (execute next case)
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// Ternary operator for quick condition checking

let canVote = age >= 18 ? "Yes" : "No" // If true "Yes", if false "No"

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"] // Works with many booleans, checks if list is empty and prints crew count
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.light

let background = theme == .dark ? "black" : "white" // Choose BG color based on Theme enum
print(background)
