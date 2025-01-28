import Cocoa

// Type inference for String and Int
let surname = "Lasso"
var score = 0

// Explicit type annotation
let name: String = "Ted"
var number: Int = 0
var floatNumber: Double = 1
var active: Bool = true

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

// Creating empty arrays with type annotation

var teams: [String] = [String]() // Not needed here but helpful
var cities: [String] = []
var clues = [String]()

// Constants that don't have values can be created beforehand, requires type annotation
let username: String

username = "@twostraws"

print(username)

// Checkpoint 2

var partyPokemon: [String] = []

partyPokemon.append("Pikachu")
partyPokemon.append("Bulbasaur")
partyPokemon.append("Charmander")
partyPokemon.append("Squirtle")
partyPokemon.append("Eevee")
partyPokemon.append("Bulbasaur")

print("Number of Pokemon in party: \(partyPokemon.count)")
print("Number of unique Pokemon species in party: \(Set(partyPokemon).count)")

partyPokemon.remove(at: 1)

print("Number of Pokemon in party: \(partyPokemon.count)")
print("Number of unique Pokemon species in party: \(Set(partyPokemon).count)")
