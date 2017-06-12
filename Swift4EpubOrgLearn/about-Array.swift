func printTitle(_ title: String) {
    print(String(Array(repeating:"=", count: title.count)))
    print(title)
    print(String(Array(repeating:"=", count: title.count)))
}

printTitle("利用String将一个字符串的Array连成字符串：")
var myArray: [String] = Array(repeating: "=", count: 10)
print(myArray)
print(String(myArray))



//Creating an Empty Array
printTitle("Creating an Empty Array:")
var someInts = [Int]()
print(someInts)

printTitle("The append method:")
someInts.append(3)


//Creating an Array with a Default Value
printTitle("Creating an Array with a Default Value:")
var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)


//Creating an Array by Adding Two Arrays Together
printTitle("Creating an Array by Adding Two Arrays Together")
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)


//Creating an Array with an Array Literal
printTitle("Creating an Array with an Array Literal:")
var shoppingList: [String] = ["Eggs", "Milk"]
//or var shoppingList = ["Eggs", "Milk"]
print(shoppingList)



//Accessing and Modifying an Array
printTitle("Accessing and Modifying an Array:")
print("The shopping list contains \(shoppingList.count) items.")
if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")
shoppingList += ["Baking Power"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter", "蓖麻油", "香菜"]
var firstItem = shoppingList[0]

//even if the replacement set of values has a different length than the range
//you are replacing,you still can replace them 
shoppingList[4...6] = ["Bananas", "Apples"]

//insert method
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)

// remove an item from the array with remove(at:) method and returns the removed item if 
//you need it
let mapleSyrup = shoppingList.remove(at: 0)
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
print(shoppingList)
print(mapleSyrup)

// to remove the last item with removeLast() method instead of remove(at:) method avoiding 
//query the count of the array
let apples = shoppingList.removeLast()
print(apples)



// Iterating Over an Array
for item in shoppingList {
    print(item)
}

// if you need the integer index of each item as well as its value, use the enumerated() method
//to iterate over the array instead
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
