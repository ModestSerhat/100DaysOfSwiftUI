import Cocoa

// Using for loops with arrays and ranges
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for name in platforms { // name can be named anything
    print("Swift works great on \(name).")
}

for i in 1...12 { // Nested loop with closed ranges 1 to 12 (inclusive)
    print("The \(i) times table:")
    for j in 1...12 {
        print("\(i) x \(j) = \(i * j)")
    }
    print() // Using print() by itself prints a new line
}

for i in 1...5 { // Loop with closed range 1 to 5 (inclusive)
    print("Counting from 1 through 5: \(i)")
}

print()

for i in 1..<5 { // Loop with open range 1 to 5 (exclusive)
    print("Counting 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 { // No need for loop variable like i/j for these
    lyric += " hate"
}

print(lyric)

// While loops, continually execute loop if condition is true

var countdown = 10

while countdown > 0 { // Execute if countdown is bigger than 0
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000) // Get random integer number within given range
let amount = Double.random(in: 0...1) // Get random float number within given range

// Create an integer to store our roll
var roll = 0

// Carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)!")
}

// if we're here it means the loop ended – we got a 20!
print("Critical hit!")

// Skipping loop items with break and continue

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue // Check if file suffix is jpg, else then go to next loop iteration
    }

    print("Found picture: \(filename)")
}

let number1 = 3
let number2 = 4
var multiples = [Int]()

for i in 1...100_000 { //
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) { // Find multiples of 4 and 14
        multiples.append(i)
        if multiples.count == 10 { // Break out of whole loop if condition is met
            break
        }
    }
}

print(multiples)

// Checkpoint 3

for i in 1...100 {
    if i.isMultiple(of: 15) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
