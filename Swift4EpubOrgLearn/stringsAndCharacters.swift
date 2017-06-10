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

