import Cocoa

var greeting = "Hello, playground"

// Declaring and changing variables
var name = "Ted"
name = "Rebecca"
name = "Keeley"

// Declaring constants
let character = "Daphne"

var playerName = "Roy" // Usage of camel case naming convention and changing variable value
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

// Declaring strings with punctuation, emojis and escape characters
let actor = "Denzel Washington"

let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

// Multi-line strings
let movie = """
A day in
the life of an
Apple engineer
"""

// Counting, uppercasing and checking for prefixes/suffixes
let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))

print(filename.hasSuffix(".jpg"))

// Integer number assignments and operators
let score = 10

let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

print(score)

// Varying integer numbers with regular and compount assignment operators
var counter = 10
counter = counter + 5
counter += 5
print(counter)

counter *= 2
print(counter)

counter -= 10
print(counter)

counter /= 2
print(counter)

// isMultiple of method of Integers
let number = 120
print(number.isMultiple(of: 3))

// Floating number assignments and operators
let doubleNumber = 0.1 + 0.2
print(doubleNumber)

let a = 1 // Cast as Int
let b = 2.0 // Cast as Double

//let c = a + Int(b)
let c = Double(a) + b

// Type safety: can't change variable to another type
// var name = "Nicolas Cage"
// name = 57

// Compound assignment operators on doubles
var rating = 5.0
rating *= 2
