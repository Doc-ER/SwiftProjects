//String Literals
let someString = "Some string literal value"


func generateQuotation() -> String {
    let quotation = "White Rabiit"
    return quotation 
}           

print(generateQuotation())



//Initializing an Empty String
var emptyString = ""
var anotherEmptyString = String()
//These two strings are both empty, and are equivalent to each other

if emptyString.isEmpty{
    print("Nothing to see here")
}


//String Mutability
var variableString = "Horse"
variableString += " and carriage"


//Strings Are Value Types
//Working with Characters

for character in "Dog!" {
    print(character)
}//这是第四版的语法

/*for character in "Dog!".characters {
    print(character)
}//这是第三版的语法
*/
//String values can be constructed by passing an array of Character values as  an argument to 
//its initialzier:
let catCharacter: [Character] = ["C", "a", "t", "!", "耄"]
let catString = String(catCharacter)
print(catString)


//Concatenating Strings and Characters
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

//use +=
var instruction = "look over"
instruction += string2

//append()
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
print(welcome)

//String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)*2.5)"
print(message)

//Counting Characters
let unusualMenagerie = "Koala, Snail, Penguin, Dromedary"
print("unusualMenagerie has \(unusualMenagerie.count) characters")//这是第四版的语法
// print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")//这是第三版语法


//Accessing and Modifying a String
//String Indices
let greeting = "Guten Tag!"
print(greeting[greeting.startIndex])
print(greeting[greeting.index(before:greeting.endIndex)])
print(greeting[greeting.index(after:greeting.startIndex)])
let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(greeting[index])

for index in greeting.indices {
    print("\(greeting[index])", terminator:"|")
}//这是第四版的
/*for index in greeting.characters.indices {
    print("\(greeting[index])", terminator: "|")
}*/

//Inserting and Removing
welcome = "hello"
welcome.insert("!", at:welcome.endIndex)
print(welcome)

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
print(welcome)

welcome.remove(at:welcome.index(before:welcome.endIndex))

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
print(welcome)
/*NOTE
You can use the the insert(_:at:), insert(contentsOf:at:), remove(at:), and removeSubrange(_:) methods on 
any type that conforms to the RangeReplaceableCollection protocol. 
This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.*/





/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Substrings
let greetings = "Hello, world!"
let indexx = greetings.index(of: ",") ?? greetings.endIndex
let beginning = greetings[..<indexx]

let newString = String(beginning)
print(newString)


//Comparing Strings
/*swift provides 3 ways to compare textual values:
1. string and character equality
2. prefix equality
3. suffix equality
*/
//1.String and Character Equality
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

//2.Prefix and Suffix Equality
/*
To check whether a string has a particular string prefix or suffix,
call the string's hasPrefix(_:) and hasSuffix(_:) methods, both of which
take a single argument of type String and return a Boolean value.
*/
/*
The hasPrefix(_:) and hasSuffix(_:) member of String is bridged from NSString(and in so from Foundation).
When working with Swift in Xcode Playgrounds and projects, this method is availabe from the Swift standard
library, whereas when compiling Swift from e.g. the IBM sandbox/your local Linux machine, the Swift std-lib
version is not accessible, whereas the one from core-libs Foundation is.

To have access to the latter implementation, you need to explicitly import Foundation:,
*/
import Foundation
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 "){
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")


/*
Similarly, use the hasSuffix(_:) method to count the number of scenes that take
place in or around Capulet's mansion and Friar Lawrence's cell:
*/
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) mansion secens; \(cellCount) cell scenes")
