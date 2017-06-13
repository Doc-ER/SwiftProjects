//++++++++++++++++++//
//Stored Properties
//++++++++++++++++++++//
struct FixedLengthRange {
    var firstValue: Int 
    let length: Int 
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

//Stored Properties of Constant Structure Instances
/*If you create an instance of a structure and assign that instance to a constant, you 
cannot modify the instance’s properties, even if they were declared as variable properties:*/

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
//rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property
/*Because rangeOfFourItems is declared as a constant (with the let keyword), it is not 
possible to change its firstValue property, even though firstValue is a variable property.

This behavior is due to structures being value types. When an instance of a value type 
is marked as a constant, so are all of its properties.

The same is not true for classes, which are reference types. If you assign an instance of
a reference type to a constant, you can still change that instance’s variable properties.*/

//Lazy Stored Properties
/*
A lazy stored property is a property whose initial value is not calculated until the first
time it is used. 
*/
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a non-trivial amount of time to initialize.
    */
    var filename = "data.txt"
    // The DataImporter class would provide importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // The DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

//+++++++++++++++++++++++++++++++++//
//Computed Properties
//+++++++++++++++++++++++++++++++++//
//getter and setter

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY )
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2 )
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), 
                  size: Size(width: 10.0, height: 10.0 ))
square.center = Point(x: 15.0, y: 15.0 )

//Property Observers
//willSet is called just before the value is stored
//didSet is called immediately after the new value is stored.
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps.")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 1000
/*The StepCounter class declares a totalSteps property of type Int. This is a stored 
property with willSet and didSet observers.

The willSet and didSet observers for totalSteps are called whenever the property is 
assigned a new value. This is true even if the new value is the same as the current value.

This example’s willSet observer uses a custom parameter name of newTotalSteps for the
upcoming new value. In this example, it simply prints out the value that is about to be set.

The didSet observer is called after the value of totalSteps is updated. It compares the 
new value of totalSteps against the old value. If the total number of steps has increased, 
a message is printed to indicate how many new steps have been taken. The didSet observer 
does not provide a custom parameter name for the old value, and the default name of 
oldValue is used instead.*/

//Type Properties
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."

print(SomeStructure.storedTypeProperty)

print(SomeEnumeration.computedTypeProperty)

print(SomeClass.computedTypeProperty)