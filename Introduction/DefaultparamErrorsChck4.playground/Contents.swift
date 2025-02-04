import Cocoa

// Adding default values to functions

func printTimesTables(for number: Int, end: Int = 12) { // end is set to 12 automatically, the end value can be changed when wanted
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20) // end given as 20
printTimesTables(for: 8) // end not given and as 12

/* For arrays .removeAll() method is used to free up memory space used by array elements,
 .removeAll(keepingCapacity: true) could also be used for cases that removes all previous items
 while keeping array capacity, knowing removeAll has the keepingCapacity parameter we can
 suggest that the function call without any arguments assigns keepingCapacity as false */

// Handling errors in functions

enum PasswordError: Error { // Enums can be created with Error swift type and error cases can be given
    case short, obvious
}

func checkPassword(_ password: String) throws -> String { // Error throwing function marked with throws, can throw Error with throw
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "1234566344"

// do, try, catch blocks
// do can have error throwing function inside, error throwing function called with try, catch is used to catch error types, catch {} is used to catch all remaining errors
do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

// Checkpoint 4

enum SqrtError: Error {
    case outOfBounds, noRoot
}

func sqrtInt(_ number: Int) throws -> Int  {
    if number < 1 || number > 10000 {
        throw SqrtError.outOfBounds
    }
    for i in 1...100 {
        let currentIntegerSquare = i * i
        if currentIntegerSquare == number {
            return i
        }
    }
    throw SqrtError.noRoot
}

let number = 9

do {
    let result = try sqrtInt(number)
    print(result)
} catch SqrtError.outOfBounds {
    print("Number \(number) is out of bounds for sqrtInt (1 to 100)")
} catch SqrtError.noRoot {
    print("No integer root was found for number \(number)")
}
