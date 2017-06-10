//Three primary collection types:
//arrays, sets, and dictionaries
//arrays are ordered collection of values
//sets are unordered collection of unique values
//dictionaries are unordered collections of key-value associations

//Arrays
//An array stores values of the same types in an ordered list.
//NOTE:
//Swift's Array type is bridged to Foundation's NSArray class

//Creating an Empty Array
func printTitle(title: String) {
    print("==================================================")
    print(title)
    print("==================================================")
}


var someInts = [Int]()
someInts.append(3)

//Creating an Array with a Default Value
var threeDoubles = Array(repeating: 0.0, count: 3)

//Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

//Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]
//or var shoppingList = ["Eggs", "Milk"]

//Accessing and Modifying an Array
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


//Sets
// A set stores distinct values of the same type in a collection with no defined ordering
//Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")

//Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip-hop"]
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky")
} else {
    print("I have particular music preferences")
}

favoriteGenres.insert("Jazz")

// remove(_:) and removeAll()
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much care for that.")
}

//To check whether a set contains a particular item, use the contains(_:) method.
if favoriteGenres.contains("Funck") {
    print("I get up on the good foot.")
} else {
    print("It's too funcky in here.")
}



//Iterating Over a Set
for genre in favoriteGenres {
    print("\(genre)")
    print(genre)
}

//Swift's Set type does not have a defined ordering. To iterate over the values of a set in 
//a specific order, use the sorted() method, which returns the set's elements as an array
//sorted using the < operator
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}


printTitle(title: "Performing Set Operations:")

//Use the intersection(_:) method to create a new with with only the values common to both sets
//Use the symmetricDifference(_:) method to create a new set with values in either set, but not
//both
//Use the union(_:) method to create a new set with all of the values in both sets.
//Use the subtracting(_:) method to create a new set with values not in the specific set.
let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

print(oddDigits.union(evenDigits).sorted())
print(oddDigits.intersection(evenDigits).sorted())
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())

///////////////////////////////////////////////////////////////////////////////////////////////
printTitle(title: "Set Membership and Equality:")
//use the == operator to determin whether two sets contain all of the same values.
//use the isSubset(of:) method to determine whether all of the values of a set are contained in
//the specified set.
//use the isSuperset(of:) method to determine whether a set contains all of the values in a 
//specified set.
//use the isStrictSubset(of:) method to determine whether a set is a subset or suprset, but not
//equal to, a specified set.
//use the isDisjoint(with:) method to determine whether two sets have no values in common.
let houseAnimals: Set = ["🐶","🐱"]
let farmAnimals: Set = ["🐮", "🐔","🐑","🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

if houseAnimals.isSubset(of: farmAnimals) {
    print("True")
} else {
    print("False")
}

if farmAnimals.isSuperset(of: houseAnimals) {
    print("True")
} else {
    print("False")
}

if farmAnimals.isDisjoint(with: cityAnimals) {
    print("True")
} else {
    print("False")
}

