//TYPES (Structs)
//INT - variations in bits: Int8, Int16, Int32, Int64
///Here, the inference is for Int
var value1 = 500
///Identical to the line above
var value2: Int = 500
///Only positive values

//UINT - variation in bits: UInt8, UInt16, UInt32, UInt64
var myAge: UInt8 = 39
///Way to show the maximum value accepted by the type
///Valid for all types of Int (Int8, Int16, Int32, UInt8, etc.)
print(Int.max)
///Way to show the minimum value accepted by the type
print(Int.min)

//DOUBLE (64 bits), FLOAT (32 bits)
///Double automatically inferred
var balance = 1500.75
///Explicit double
var sallary: Double = 1200.50
///To use Float, we need to spell out the type
var temperature: Float = 35.9

//STRING AND CHARACTER
var module: String = "Introduction to Swift"
var schoolName = "FIAP"
///Note that letter, in the line below, is a String
///Due to type inference
var letter = "J"
///To use Character, we need to explicitly define
var gender: Character = "M"

//INTERPOLATION
let studentGrade = 8.5
let studentName = "Jullia"
let result = "approved"
let message = "The student \(studentName) took \(studentGrade) and is \(result)"
print(message)
let psalm125 = """
Those who trust oin the LORD are like Mount Zion
which connot be shaken but endures forever.

Psalm 125
"""
print(psalm125)

//BOOL
var isApproved = true
var firstTime: Bool = false

//TUPLES
let address: (String, Int, String) = ("Av. Lins de Vasconcelos", 1222, "01538-001")
print ("The street name is \(address.0)")
print ("The number is \(address.1)")
print ("The zip code is \(address.2)")

let address2: (street: String, number: Int, zipCode: String) = ("Av. Lins de Vasconcelos", 1222, "01538-001")
print ("The street name is \(address2.street)")
print ("The number is \(address2.number)")
print ("The zip code is \(address2.zipCode)")

let (streetName, streetNumber, _) = address
print ("The street number is \(streetNumber)")

//OPTIONALS
///wrapped
var driverLicense: String?
driverLicense = "4455879"
print(driverLicense)

///unwrap (not safe)
///the variable must have a value, otherwise: fatal error
var driverLicense2: String?
//driverLicense2 = "4455879"
print(driverLicense2!)

///unwrap - optional binding
var driverLicense3: String?
///driverLicense3 = "4455879"
if let license = driverLicense3 {
    print ("Driver's license is (license)")
} else {
    print ("This person does not have a driver's license")
}

///unwrap - implicity unwrapped optional (not safe)
var alias: String!
// the line below prints My nickname is nil
print ("My nickname is \(alias)")
alias = "Jimi"
print ("My nickname is \(alias.uppercased())")

///unwrap - nil-coalescing operator
var age: Int?
let age2 = age ?? 0
print(age2) //0
age = 27
let age3 = age ?? 0
print(age3) //27

///Optional Chaining
var weekDay: String?
print(weekDay?.uppercased())
weekDay = "Monday"
print(weekDay?.uppercased())
