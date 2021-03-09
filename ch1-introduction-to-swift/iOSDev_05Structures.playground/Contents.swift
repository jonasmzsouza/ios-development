//CONDITIONAL STRUCTURES
///If - Else - Else If
let number = 12
if number % 2 == 0 {
    print("He's even")
} else {
    print("He's odd")
}

var temperature = 19
var climate = ""
if temperature <= 0 {
    climate = "Too cold"
} else if temperature < 14 {
    climate = "Cold"
} else if temperature < 21 {
    climate = "Pleasant climate"
} else if temperature < 30 {
    climate = "A little hot"
} else {
    climate = "So hot"
}

///Switch
var numberS = 7
switch numberS % 2 {
case 0:
    print("\(numberS) is even")
default:
    print("\(numberS) is odd")
}
///Example with several scenarios in the same case
let letter = "z"
switch letter {
case "a", "e", "i", "o", "u":
    print("vowel")
default:
    print("consonant")
}
///Example with range of letters
switch letter {
case "a"..."f":
    print("You are in class 1")
case "g"..."l":
    print("You are in class 2")
case "m"..."r":
    print("You are in class 3")
default:
    print("You are in class 4")
}
///Range of numbers
let speed = 33.0
switch speed {
case 0.0..<20.0:
    print("First gear")
case 20.0..<40.0:
    print("Second gear")
case 40.0..<50.0:
    print("Third gear")
case 50.0..<90.0:
    print("fourth gear")
default:
    print("Fifth gear")
}

//REPETITION STRUCTURES
///While / Repeat While
import Foundation
///Using while
var life = 10
while life > 0 {
    print("The player has \(life) lives")
    life = life - 1
}
///Using repeat while
var tries = 0
var diceNumber = 0
repeat {
    tries += 1
    diceNumber = Int(arc4random_uniform (6) + 1)
} while diceNumber != 6
print("you scored 6 after \(tries) attempts")

///For in
///Cycling through an Array
let students = [
    "Billy Gray",
    "Mary Pink",
    "John Brown",
    "Bob Blue",
    "Carol Dark"
]
for student in students {
    print("The student \(student) came to class today!")
}
///Going through a sequence (range)
for day in 1...30 {
    print("I'm on day \(day)")
}
///Note below that a String is also a collection
let name = "Billy Gray Adams"
for letter in name {
    print(letter)
}
///Let's see how to go through a dictionary,  printing your key and value. In this dictionary the key is String and the value is Int
let people = [
    "Paul": 25,
    "Mary": 18,
    "Bob": 33,
    "John": 39,
    "Carol": 36
]
///The person variable, below, is a tuple that receives the key and the value (value) of each element of the dictionary
for person in people {
    print(person.key, person.value)
}
///If we want, we can even decompose the tuple in variables
for (name, age) in people {
    print(name, age)
}
///We can break the execution of a loop using the break command
let grades = [10.0, 9.0, 8.5, 7.0, 9.5, 5.0, 22.0, 6.5, 10.0]
for grade in grades {
    print(grade)
    if grade < 0.0 || grade > 10.0 {
        print("Invalid note")
        break
    }
}
