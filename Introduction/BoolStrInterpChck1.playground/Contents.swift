import Cocoa

// Booleans and not operator
let goodDogs = true
let gameOver = false

let isMultiple = 120.isMultiple(of: 3)
print(isMultiple)

var isAuthenticated: Bool = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated.toggle() // .toggle() also acts as not
print(isAuthenticated)

// Joining strings with and without string interpolation

let firstPart = "Hello "
let secondPart = "World!"
let greeting = firstPart + secondPart
print(greeting)

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let name = "Serhat"
let age = 23
let message = "Hello, my name is \(name) and I am \(age) years old."
print(message)

print("5 * 5 is \(5 * 5)") // Operations are also possible
// String interpolation is faster than joining strings or converted strings by String()

// Checkpoint 1
let celciusTemp: Double = 0
let fahrenheitTemp = celciusTemp * 1.8 + 32
print("\(celciusTemp)°C is equal to \(fahrenheitTemp)°F.")

