import Cocoa

// Creating and accessing arrays with different data types
var beatles = ["George", "Paul", "John", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0], numbers[1], temperatures[1], temperatures[2])

// Appending new elements to variable array

beatles.append("Adrian")
beatles.append("Allen")

/*
let firstBeatle = beatles[0]
let firstNumber = numbers[0]
let notAllowed = firstBeatle + firstNumber
 
Type safety also applies to arrays
*/

// Creating and appending to empty Int array
var scores = Array<Int>()

scores.append(100)
scores.append(80)
scores.append(85)

// .count, .remove(at: index), removeAll(), .sorted() and .reversed() on arrays
print(scores[1])
print(scores.count)

var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")

albums = ["Fearless"]
print(albums.count)

albums.append("Folklore")
print(albums.count)

albums.remove(at: 1)
print(albums.count)

albums.removeAll()
print(albums.count)

albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

print(albums)
print(albums.contains("Red")) // Check if array contains a value, must be same type inside array
print(albums.sorted()) // Sort array by alphabetical order or integer/double value
print(albums.reversed()) // Reverse array order as ReversedCollection

// Creating dictionaries and reading them with default values
let employee = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])
print(employee["location", default: "Unknown"])

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo",
    2024: "Paris"
]

print(olympics[2024, default: "Unknown"])

// Creating empty dictionaries and adding values
var heights = [String: Int]()

heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"

// Creating and inserting values into sets, sets are different from arrays in terms of being unordered
var people = Set<String>()
people.insert("Denzel Washington")
people.insert("Tom Cruise")
people.insert("Nicolas Case")

print(people)

// Enumerations with specific values only
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

// enum Weekday {
// case monday, tuesday, wednesday, thursday, friday
// } also possible

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday
day = .wednesday // Shorthand syntax since day is Weekday type
