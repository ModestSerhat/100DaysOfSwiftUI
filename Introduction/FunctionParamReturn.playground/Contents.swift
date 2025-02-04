import Cocoa

// Functions and parameters with types
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome() // Call function to execute code inside

// isMultiple(of: 2) and Int.random(in: 1...20) are example functions

// Function with two Integer parameters
func printTimesTables(number: Int, end: Int) {
    for i in 1...end { // Use both parameters in function
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 6, end: 20) // Call printTimesTables with two parameters

// Returning values from functions

func rollDice() -> Int { // Function that returns an integer value
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool { // Function for checking if two strings have identical letters by sorting the strings and checking if they're the same, returns a boolean value
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}

func pythagoras(a: Double, b: Double) -> Double { // Pythagoras function that takes two doubles (a and b sides) and returns the hypotenuse (c) double
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 5, b: 12)
print(c)

// Returning multiple values from a function
// Tuples are used instead of arrays and dictionaries in case of giving return values names and to not provide default values respectively
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift") // return keyword can be omitted for a single line function
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
// When tuples don't have value names .0 or .1 can be used

func getUser2() -> (String, String) {
    ("Paul", "Hudson")
}

let user2 = getUser2()
print("Name: \(user2.0) \(user2.1)")

let (firstName, lastName) = getUser2() // This syntax could be used to get tuple elements instead of tuple or can be omitted with _
print("Name: \(firstName) \(lastName)")

func rollDice(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)
print(rolls)

/*
 func hireEmployee(name: String) { }
 func hireEmployee(title: String) { }
 func hireEmployee(location: String) { }
 functions with same name and different parameter names can be created
 */

// Omitting externel parameter labels can be done with _, the parameter is still string inside the function
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)
print(result2)

// Custom external parameter labels can be given as well

func printTimesTables(for number: Int) {
    for i in 1...12 { // Use both parameters in function
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 12)
