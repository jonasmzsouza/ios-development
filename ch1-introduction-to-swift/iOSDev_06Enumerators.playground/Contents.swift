///Defining an enum
enum Compass {
    case north
    case east
    case west
    case south
}
///Creating a variable of type Compass
var direction = Compass.north
///Since Swift works with type inference, we can use only .value, if the type is explicitly defined
var direction2: Compass = .south
print("My direction is \(direction)")
///My direction is north
///Enums are often used with a switch for value analysis
switch direction {
case .north:
    print("We are going north")
case .south:
    print("We are going south")
case .east:
    print("We are going east")
case .west:
    print("We are going west")
}

//Default values
///Enum that defines the positions of the seats on an airplane. See that it is possible to assign a default value to each of them
enum SeatPosition: String {
    case aisle = "aisle"
    case middle = "middle"
    case window = "window"
}
var passengerSeat = SeatPosition.window
///To print the default value, we use the rawValue property
print(passengerSeat.rawValue)
///Int enum with default values
enum Month: Int {
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
}
var currentMonth: Month = .june
print("We are in the month \(currentMonth.rawValue) of the year")


//Associated values
///Creating an enum that represents measures and that has associated values
enum Measure {
    case weight (Double)
    case age (Int)
    case size (width: Double, height: Double) // One tuple
}
///Creating a Measure variable with the value age and set its associated value
let ageMeasure: Measure = .age (33)
///Now, one with the value acts and associating a Double
let weightMeasure: Measure = .weight (82)
///Below, we are associating a tuple with the enum of type size
let sizeMeasure: Measure = .size (width: 0.6, height: 1.71)
///To retrieve the values, we need to work
///using switch, as follows
switch sizeMeasure {
case .weight (let weight):
    print ("Your weight is \(weight)")
case .age (let age):
    print ("Your age is \(age)")
case .size (let size):
    print ("Measures are \(size.width)m wide and \(size.height)m high")
///expected-warning {{Enum case 'size' has 2 associated values; matching them as a tuple is deprecated}}
}
