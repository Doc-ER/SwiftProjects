/*Closures are self-contained blocks of functionality that can be passed around and used in 
your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in 
other programming languages.*/
let names = ["Chirs", "Alex", "Ewa", "Barry", "Daniella"]
print(names)

func backwards(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2 
}
var reversedName = names.sorted(by: backwards)
print(reversedName)

reversedName = names.sorted(by:{(s1:String, s2: String ) -> Bool in return s1 > s2 })
print(reversedName)

reversedName = names.sorted(by: {s1, s2 in return s1 > s2 })
print(reversedName)

reversedName = names.sorted(by: {s1, s2 in s1 > s2 })
print(reversedName)

reversedName = names.sorted(by: {$0 > $1 })
print(reversedName)

reversedName = names.sorted(by: > )
print(reversedName)

//Trailing Closures
print("Trailing Closures: ")
reversedName = names.sorted() { $0 > $1 }
print(reversedName)

/*If a closure expression is provided as the function or method’s only argument and you 
provide that expression as a trailing closure, you do not need to write a pair of 
parentheses () after the function or method’s name when you call the function:*/
reversedName = names.sorted { $0 > $1 }
print(reversedName)

/*Trailing closures are most useful when the closure is sufficiently long that it is not 
possible to write it inline on a single line. As an example, Swift’s Array type has a 
map(_:) method which takes a closure expression as its single argument. The closure is 
called once for each item in the array, and returns an alternative mapped value 
(possibly of some other type) for that item.*/
let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map {(number) -> String in 
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output 
}
/*The map(_:) method calls the closure expression once for each item in the array. 
You do not need to specify the type of the closure’s input parameter, number, because the 
type can be inferred from the values in the array to be mapped.

In this example, the variable number is initialized with the value of the closure’s number
 parameter, so that the value can be modified within the closure body. (The parameters to 
 functions and closures are always constants.) The closure expression also specifies a 
 return type of String, to indicate the type that will be stored in the mapped output 
 array.

The closure expression builds a string called output each time it is called. It calculates
 the last digit of number by using the remainder operator (number % 10), and uses this 
 digit to look up an appropriate string in the digitNames dictionary. The closure can be 
 used to create a string representation of any integer greater than zero.

NOTE

The call to the digitNames dictionary’s subscript is followed by an exclamation mark (!), 
because dictionary subscripts return an optional value to indicate that the dictionary 
lookup can fail if the key does not exist. In the example above, it is guaranteed that
number % 10 will always be a valid subscript key for the digitNames dictionary, and so an 
exclamation mark is used to force-unwrap the String value stored in the subscript’s 
optional return value.*/

//Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount 
        return runningTotal
    }
    return incrementer 
}
//the return type of makeIncrementer is () -> Int. This means the function returns a function,
//rather than a simple value. The function it returns has no parameters, and returns an Int
//value each time it is called.
/*When considered in isolation, the nested incrementer() function might seem unusual:

func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
}
The incrementer() function doesn’t have any parameters, and yet it refers to runningTotal
nd amount from within its function body. It does this by capturing a reference to 
runningTotal and amount from the surrounding function and using them within its own 
function body. Capturing by reference ensures that runningTotal and amount do not disappear
when the call to makeIncrementer ends, and also ensures that runningTotal is available 
the next time the incrementer function is called.*/
//Let's call this function:
let incrementByTen = makeIncrementer(forIncrement: 10 )
//makeIncrementer returns a function type, so incrementByTen in fact is a function here.
print(incrementByTen())// returns a value of 10
print(incrementByTen())// now returns a value of 20

//Closoures are reference types
/*In the example above,incrementByTen are constants, but the closures these constants refer 
to are still able to increment the runningTotal variables that they have captured. 
This is because functions and closures are reference types.

Whenever you assign a function or a closure to a constant or a variable, you are actually 
setting that constant or variable to be a reference to the function or closure. 
In the example above, it is the choice of closure that incrementByTen refers to that is 
constant, and not the contents of the closure itself.

This also means that if you assign a closure to two different constants or variables,
both of those constants or variables will refer to the same closure:*/
let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())

//Escaping Closures
/*
A closure is said to escape a function when the closure is passed as an argument to the 
function, but is called after the function returns. When you declare a function that takes
a closure as one of its parameters, you can write @escaping before the parameter's type to
indicate that the closure is allowed to escape.
*/
/*One way that a closure can escape is by being stored in a variable that is defined outside
the function. As an example, many functions that start an asynchronous operation take a 
closure argument as a completion handler. The function returns after it starts the 
operation, but the closure isn’t called until the operation is completed—the closure 
needs to escape, to be called later. For example:*/

var completionHandlers: [() -> Void ] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

/*The someFunctionWithEscapingClosure(_:) function takes a closure as its argument and adds 
it to an array that’s declared outside the function. If you didn’t mark the parameter of 
this function with @escaping, you would get a compile-time error.

Marking a closure with @escaping means you have to refer to self explicitly within the 
closure. For example, in the code below, the closure passed to 
someFunctionWithEscapingClosure(_:) is an escaping closure, which means it needs to refer 
to self explicitly. In contrast, the closure passed to 
someFunctionWithNoescapingClosure(_:) is a nonescaping closure, which means it can refer 
to self implicitly.*/
func someFuncionWithNoescpaingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFuncionWithNoescpaingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)//prints "200"

completionHandlers.first?()
print(instance.x)//prints "100"

