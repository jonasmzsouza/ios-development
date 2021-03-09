//FUNCTIONS
//Syntax for creating functions
/*
 funcFunctionName (parameter: Type) -> ReturnType {
 //Codes
 return ReturnType
 }
 */
///Example of a simple function that does not receive parameters and returns nothing
func printHello () {
    print("Hello !!!")
}
printHello()
///Function that accepts a parameter
func say(message: String) {
    print(message)
}
say(message: "Let's create functions in Swift")
///Function that accepts more than one parameter and that returns something
func sumNumbers(a: Int, b: Int) -> Int {
    return a + b
}
var result = sumNumbers(a: 10, b: 15)
print(result)

//Modifying the name of the external parameter
///The function below is used to give a message of welcome someone
func say(welcome message: String, to person: String) {
    print("\(message) \(person)!")
}
say(welcome: "Welcome", to: "student")
///Removing the external name of the first parameter
func say(_ message: String, to person: String) {
    print("\(message) \(person)!")
}
say("Hello", to: "Fabiana")
///Removing all external parameters
func sumNumbers(_ number1: Int, _ number2: Int) -> Int {
    return number1 + number2
}
print(sumNumbers(3, 7))

//Using functions as an argument
func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}
func divide(_ a: Int, _ b: Int) -> Int {
    return a / b
}
func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}
///The function below uses other function as parameter
func applyOperation(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}
let resultArg = applyOperation(10, 25, operation: multiply)
print(resultArg)

//Returning functions
///Creating a nickname for (Int, Int) -> Int
typealias Op = (Int, Int) -> Int
///Method that return other method
func getOperation(_ operation: String) -> Op {
    switch operation{
    case "sum":
        return sum
    case "subtract":
        return subtract
    case "multiply":
        return multiply
    default:
        return divide
    }
}
///Below the operation variable will receive the function
///Will return by the getOperation
var operation = getOperation("subtract")
print(operation(42, 27))

//CLOSURES
//Syntax of a function
/*
 funcFunctionName (parameter: Type) -> ReturnType {
 // Codes
 return ReturnType
 }
 */
// Syntax of a closure
/*
 {(parameter: Type) -> ReturnType in
 // Codes
 return ReturnType
 }
 */

//Implements a closure that realize performs the operation
applyOperation(18, 7, operation: {(x: Int, y: Int) -> Int in
    return x % y
})

//Simplified form
applyOperation(18, 7, operation: {x, y -> Int in
    return x % y
})

applyOperation(18, 7, operation: {x, y in
    return x % y
})

applyOperation(18, 7, operation: {
    return $0 % $1
})

applyOperation(18, 7, operation: {$0 % $1})


//MAP, FILTER and REDUCE
let names = ["John", "Paul", "Henry", "Anny", "Beatriz", "Carl", "Caroline"]
///Aplying map to names
let uppercasedNames = names.map({$0.uppercased()})
print(uppercasedNames)

//Aplying filter to names
let filteredNames = names.filter({$0.count < 6})
print(filteredNames)

// Using Reduce
var transactions = [500.0, -45.0, -70.0, -25.80, -321.72, 190.0, -35.15, -100]
// reduce syntax
// func reduce <Result> (_ initialResult: Result, _ nextPartialResult: (Result, Double) throws -> Result) rethrows -> Result
let balance = transactions.reduce (0.0, {$0 + $1})
print("Your balance is $ \(balance)")
