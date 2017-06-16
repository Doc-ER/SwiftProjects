class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "travling at \(currentSpeed) miles per hour"
    }

    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//Subclassing
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

//Overriding
class Train: Vehicle {
    override func makeNoise(){
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()

//Overriding Properties
class Car: Vehicle {
    var gear = 1
    overide var description: String {
        return super.description + "in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
ca.gear = 3
print("Car: \(car.description)")

//Preventing Overrides
/*You can prevent a method, property, or subscript from being overridden by marking it as 
final. Do this by writing the final modifier before the method, property, or subscript’s 
introducer keyword (such as final var, final func, final class func, and final subscript).*/
