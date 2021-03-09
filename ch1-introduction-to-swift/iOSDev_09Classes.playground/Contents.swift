//STRUCTS
struct RGBColor {
    
    ///Stored properties
    var red: Int
    var green: Int
    var blue: Int
    
    ///Class methods
    func printColor () {
        print ("""
             Red: (red)
             Green: (green)
             Blue: (blue)
             """)
    }
}

///Instantiating the RGBColor struct
var rgbYellow = RGBColor (red: 255, green: 255, blue: 0)

///Accessing and Changing a rgbYellow property
rgbYellow.red = 254

//CLASSES
//Construction
class Person{
    ///Stored properties
    var name: String
    var isMarried: Bool
    var age: Int = 0
    
    ///Class constructor method
    init(name: String, isMarried: Bool) {
        self.name = name
        self.isMarried = isMarried
    }
    
    ///Class method
    func speak(sentence: String) {
        if age < 3 {
            print("gugu dada")
        } else {
            print(sentence)
        }
    }
    
    func introduce() -> String {
        return "Hello, my name is \(name)"
    }
    
    ///Computed properties
    var maritalStatus: String {
        get {
            if isMarried {
                return "married"
            } else {
                return "not married"
            }
        }
        set {
            if newValue == "married" {
                isMarried = true
            } else {
                isMarried = false
            }
        }
    }
    
    ///Class properties (static)
    static let animalClass: String = "mammal"
    
    ///Class method
    class func getInfo() -> String {
        return "Person: \(Person.animalClass) that has name, marital status and age"
    }
}

///Instantiating the person class
let jonas = Person(name: "Jonas Muniz de Souza", isMarried: false)
///Changing a property
jonas.age = 32

///Changing the maritalStatus
jonas.maritalStatus = "married"
print(jonas.isMarried, jonas.maritalStatus)

///Using class properties/methods
print(Person.animalClass)
print(Person.getInfo())

//INHERITANCE
class Student: Person{
    var rm: String
    
    init(name: String, isMarried: Bool, rm: String) {
        self.rm = rm
        super.init(name: name, isMarried: isMarried)
    }
    
    //override
    override func introduce() -> String {
        return "\(super.introduce()) and my RM in this school is \(rm)"
    }
}

let student = Student(name: "Mary Jane", isMarried: false, rm: "99999")
print(student.introduce())


//EXTENSION
//Using extensions to know the initial of the name and the number of vowels
import Foundation
let name = "Jonas Muniz de Souza"
extension String {
    var initials: String {
        let words = self.components(separatedBy: " ")
        let firstLetters = words.map({String($0.first!)})
        return firstLetters.joined()
    }
    
    func getVowelsCount() -> Int {
        var total: Int = 0
        let characterArray = Array(self)
        for letter in characterArray {
            let lowerLetter = String(letter).lowercased()
            switch lowerLetter {
            case "a", "e", "i", "o", "u":
                total += 1
            default:
                break
            }
        }
        return total
    }
}

print("The name \(name) has \(name.getVowelsCount()) vowels")
print("The initials of \(name) are \(name.initials)")


//PROTOCOL (Interface in other languages)
class File {
    let name: String
    let ext: String
    let size: Double
    init(name: String, ext: String, size: Double) {
        self.name = name
        self.ext = ext
        self.size = size
    }
}

protocol Sizeable {
    var width: Int {get set}
    var height: Int {get set}
}

protocol Animatable {
    var duration: Double {get set}
    func play()
    func stop()
}

class Doc: File {
    init(name: String, size: Double) {
        super.init(name: name, ext: "doc", size: size)
    }
}

class Png: File, Sizeable {
    var width: Int
    var height: Int
    
    init(name: String, size: Double, width: Int, height: Int) {
        self.height = height
        self.width = width
        super.init(name: name, ext: "png", size: size)
    }
}

class Mov: File, Sizeable, Animatable {
    var width: Int
    var height: Int
    var duration: Double
    
    func play(){
        print("Video is playing")
    }
    
    func stop(){
        print("Video is stopped")
    }
    
    init(name: String, size: Double, width: Int, height: Int, duration: Double) {
        self.height = height
        self.width = width
        self.duration = duration
        super.init(name: name, ext: "mov", size: size)
    }
}

class Mp3: File, Animatable {
    var duration: Double
    
    func play(){
        print("Music is playing")
    }
    
    func stop(){
        print("Music is stopped")
    }
    
    init(name: String, size: Double, duration: Double) {
        self.duration = duration
        super.init(name: name, ext: "mp3", size: size)
    }
}


//TYPE CASTING
///Creating the files
var docFile = Doc(name: "Document", size: 23.5)
var pngFile = Png(name: "Photo", size: 1.5, width: 2000, height: 1200)
var movFile = Mov(name: "Video", size: 250.0, width: 1280, height: 720, duration: 600)
var mp3File = Mp3(name: "Music", size: 3.2, duration: 240)

///Creating file array
let files: [File] = [docFile, pngFile, movFile, mp3File]

///Scanning the array and checking if the file is Animatable
///If so, let's run the file. For this we treat as Animatable and call the play()
for file in files {
    ///Below we check if the file object is of type Animatable using the reserved word is
    if file is Animatable {
        print("Playing the file \(file.name).\(file.ext)")
        
        ///file.play()
        ///It is no use executing in the above way because file is of type File and this type does not have the play() method.
        ///For that we need to treat it as an Animatable. The name of this technique is TypeCasting or just Cast.
        ///In this example case, we checked earlier that File is a Playable, so we use "!". In other cases, it may be necessary to use the "?" (Optional).
        (file as! Animatable).play()
    }
}
