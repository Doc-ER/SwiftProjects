//Definition Syntax
class SomeClass {
    //class definition goes here
}


struct SomeStructure {
    //structure definition goes here
}


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()


//Accessing Properties
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

// you can also use dot syntax to assign a new value to a variable property
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

//Memberwise Initializers for structure Types
let vga = Resolution(width: 640, height: 480)
//Unlike structures, class instances do not receive a default memberwise initializer.
//Structures and Enumerations are value types


//Classes Are Reference Types
let hd = Resolution(width: 1920, height: 1080 )
let tenEighty = VideoMode()
tenEighty.resolution = hd 
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate propterty of tenEighty is now \(tenEighty.frameRate).")
/*Because classes are reference types, tenEighty and alsoTenEighty actually both refer to 
the same VideoMode instance. Effectively, they are just two different names for the same 
single instance.*/

//Identity Operators === and !==
if tenEighty === alsoTenEighty {
    print("refer to the same instance")
}

