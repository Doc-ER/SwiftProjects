//Methods
//Instance Methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }

    func increment(by amount: Int) {
        count += amount 
    }

    func reset(){
        count = 0
    }
}

let counter = Counter()

counter.increment()

counter.increment(by: 5)

counter.reset()

//The self Property
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("Yes! this point is the right of the line where x==1.0")
}


/*
Structures and enumerations are value types. By default, the properties of a value type cannot
be modified from within its instance methods.
However, if you need to modify the properties of your structure or enumeration within a particular
method, you can opt in to mutating behavior for that method. The method can then muatate (that is,
change) its propterties from within the method, and any changes that it makes are written back to
the original structure when the method ends. The method can also assign a completely new instance
to its implicit self property, and this new instance will replace the existing one when the 
method ends.
*/
//Modifying Value Types from Within Instance Methods
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double ) {
        self.x += deltaX
        self.y += deltaY

    }
}
var anotherPoint = Point2(x: 1.0, y: 1.0)
anotherPoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")
//Note that you cannot call a mutating method on a constant of structure type, because its
//properties cannot be changed, even if they are variable properties
let fixedPoint = Point2(x: 3.0, y: 4.0)
//fixedPoint.moveBy(x: 3.0, y: 5.0) this will report an error

//Assigning to self Within a Mutating Method
//The Point2 example above could have been written in the following way instead:
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        self = Point(x: x + deltaX, y: y + deltaY )
    }
}


/*
This example defines an enumeration for a three-state switch. The switch cycles between 
three different power states (off, low and high) every time its next() method is called.
*/
enum TriStateSwitch {
    case off, low, high
    mutating func next(){
        switch self {
            case .off:
                self = .low
            case .low:
                self = .high
            case.high:
                self = .off 
        }
    }
}
var ovenLight = TriStateSwitch.low 
ovenLight.next()
ovenLight.next()
ovenLight.next()

//Type Methods
/*
Instance method, as described above, are methods that are called on an instance of a particular
type. You can also define methods that are called on the type itself. These kinds of methods 
are called type methods. You indicate type methods by writing the static keyword before the 
method's func keyword. Classes may also use the class keyword to allow subclasses to override
the superclass's implementation of that method.
*/
class SomeClass {
    class func someTypeMethod(){
        //type method implementation goes here
    }
}
SomeClass.someTypeMethod()



/*The example below defines a structure called LevelTracker, which tracks a player’s progress 
through the different levels or stages of a game. It is a single-player game, but can store 
information for multiple players on a single device.
All of the game’s levels (apart from level one) are locked when the game is first played. 
Every time a player finishes a level, that level is unlocked for all players on the device. 
The LevelTracker structure uses type properties and methods to keep track of which levels of 
the game have been unlocked. It also tracks the current level for an individual player.*/

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int ) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level 
        }
    }

    static func isUnlocked(_ level: Int ) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    
    mutating func advance(to level: Int ) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level 
            return true 
        } else {
            return false 
        }
    }

}
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name 
    }
}

var player = Player(name: "Argyrio")
palyer.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

