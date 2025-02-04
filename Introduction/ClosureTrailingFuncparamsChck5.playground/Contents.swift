import Cocoa

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser // Copying function to a variable, creating closures skips the copying part and creates the function on a variable/constant
greetCopy() // greetCopy is a type of () -> Void, a function that takes no parameters and returns a void/nothing

let sayHello = {
    print("Hi there!")
}

sayHello()

let sayHelloWithName = { (name: String) -> String in // Closure that accepts parameters and returns a value
    "Hi \(name)!"
} // sayHelloWithName is a type of (String) -> String, a function that takes a string parameter and returns a string

print(sayHelloWithName("Taylor")) // The name of the parameter given is not a part of function's type so it must be omitted when closures are created or functions are copied

// sorted() can take custom sorting function for control which must have two parameters of the array's element type and returns a boolean (true for lower order, false for higher order)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
var sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

sortedTeam = team.sorted(by: captainFirstSorted) // sorted can take functions created by func or by closure
print(sortedTeam)

/*
 let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
 if name1 == "Suzanne" {
 return true
 } else if name2 == "Suzanne" {
 return false
 }
 
 return name1 < name2
 })
 
 Could also be used
 */

let captainFirstTeamShort = team.sorted(by: { name1, name2 in // Omitting parameter types and return type
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})


let captainFirstTeamShorter = team.sorted { name1, name2 in // Omitting by: parameter label since the last parameter is a closure (trailing closure syntax)
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
    
}

let captainFirstTeamShortest = team.sorted { // Omitting parameter names to $0, $1 and so on in order of parameters name1 is $0 and name2 is $1
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
    
}

let reverseTeam = team.sorted { // Sorting the team array by reverse
    return $0 > $1
} // let reverseTeam = team.sorted { $0 > $1 } could also be used to omit return since it's 1 line

let tOnly = team.filter { $0.hasPrefix("T")} // .filter is used to filter through an array that can take a closure and trailing closure syntax could be used on it
print(tOnly)

let uppercaseTeam = team.map({ $0.uppercased() }) // .map transforms ever item in an array using closure code and trailing closure syntax could be used on it too, the output array type .map returns doesn't have to be the same as the input array type
print(uppercaseTeam)

// Accepting functions as parameters
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}
// makeArray takes a function that has no parameters and returns an Integer, it is run inside makeArray regardless of how generator generates integers.

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...30)
}

let newRolls = makeArray(size: 20, using: generateNumber)
print(newRolls)
// The second parameter for make array can be given with trailing closure syntax or as a function copy

// Functions can take multiple function arguments and with different parameter/return types
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("first work")
} second: {
    print("second work")
} third: {
    print("third work")
}
// Trailing closure syntax can be used for multiple function parameters but have to be labeled with external parameter names

// Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let output = luckyNumbers.filter{ number in
    !number.isMultiple(of: 2)
}.sorted().map{ num in
    "\(num) is a lucky number"
}

for item in output {
    print(item)
}
