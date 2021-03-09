///inout - a modifier that indicates that those parameters will be passed by reference
func swapInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
var int1 = 35
var int2 = 50
swapInts(&int1, &int2)
print(int1, int2)

///Gereric method
func swapValues<T>(_ a: inout T, _ b: inout T){
    let tempA = a
    a = b
    b = tempA
}
var name1 = "Mary"
var name2 = "Joseph"
swapValues(&name1, &name2)
print(name1, name2)
var value1: Double = 68.5
var value2: Double = 46.3
swapValues(&value1, &value2)
print(value1, value2)
