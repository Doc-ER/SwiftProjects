
//Defining and Calling Functions
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "张伟"))
print(greet(person: "陈琳娜"))

//Function Parameters and Return Values
//Funciton Without Parameters
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

//Functions with multiple parameters
func greets(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloWorld()
    } else {
    return greet(person: person)
    }
} 
print(greets(person: "哈喽", alreadyGreeted: false))
print(greets(person: "嘿嘿", alreadyGreeted: true))

//Functions without return values
func greet1(person: String) -> Void {//这里的 -> Void可以省略
    print("Hello, \(person)!")
}
greet1(person: "Dave")

//the return value of a function can be ignored when it is called
func printAndCount(string: String) -> Int {
    print(string)
    return string.count 
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "Hello, world")

//Functions with Multiple Return Values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value 
        } else if value > currentMax {
            currentMax = value 
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8,-6, 2, 109, 3, 71])
print("最小的是\(bounds.min)，最大的是\(bounds.max)")

//Optional Tuple Return Types
//(Int, Int)? or (String, Int,Bool)?


//Function argument Labels and Parameter Names
/*Each function parameter has both an argument label and a parameter name. The argument 
label is used when calling the function; each argument is written in the function call 
with its argument label before it. The parameter name is used in the implementation of 
the function. By default, parameters use their parameter name as their argument label.*/
func someFunction(firstParamterName: Int, secondParameterName: Int) {
    //...
}
someFunction(firstParamterName: 1, secondParameterName: 2)


//Specifying Argument Labels
func someFunction(argementLabel paramerName: Int) {
    //function body goes here
}

//here is a variation of the greet(person:) function
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))

//可以省略label
func someFunction(_ firstParamterName: Int, _ secondParameterName: Int) {
    //bodies go here
}

someFunction(2, 3)

//Parameter可以设置缺省值
func someFunction(paramerWithoutDefault: Int, paramerWithDefault: Int = 12) {
    // body goes here

}
someFunction(paramerWithoutDefault: 3, paramerWithDefault: 6)
someFunction(paramerWithoutDefault: 4)

//Variadic Parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number 
    }
    return total/Double(numbers.count)
}
arithmeticMean(1, 2, 3,5)
arithmeticMean(5, 2,9.56, 209)

//In-Out Parameters
//传进去的参数都是以constant的类型进去的，也就是说参数本身是不能变的，如果想要改变参数，则需要设置为
//inout.然后在call这个函数的时候，要将参数前面加一个符号：&
func swapTowInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var someInt = 3, anotherInt = 109
print("Initially, the someInt is \(someInt) and the anotherInt is \(anotherInt).")
swapTowInts(&someInt, &anotherInt)
print("After swap, the someInt is \(someInt) and the aotherInt is \(anotherInt).")

