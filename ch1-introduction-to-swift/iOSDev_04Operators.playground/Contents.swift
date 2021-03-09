//OPERATORS
///attribution
var height: Double = 2.15

///arithmetic
var aoA = 15
var aoB = 9
var aoSum = aoA + aoB
var aoSubtract = aoA - aoB
var aoMultiplication  = aoA * aoB
var aoDivision = aoA / aoB
var aoMod = aoB % aoB
var aoMinusA = -aoA ////changing the sign

///composite
var cA = 4
var cB = 6
var cNewValue = 2
cNewValue += cA
cNewValue -= cB
cNewValue *= cA
cNewValue /= cA
cNewValue %= cB

///logical
var yes = true, no = false
print(yes && no)
print(yes || no)
print(!yes)

///comparison
var a = 15, b = 6, c = 7, d = 9
print(a > b)
print(a < b)
print(b >= d)
print(a <= c)
print(b == d)
print(b != d)

///ternary
var grade = 7.1
var result = grade > 7.0 ? "Approved" : "Disapproved"
print(result)

///null coalescence
var age: Int?
let myAge = age ?? 0
age = 32
let newAge = age ?? 0

///closed range and half closed range
let numbers = 1...10
for number in numbers{
    print(number)
}
let newNumbers = 1..<10
for number in newNumbers{
    print(number)
}
