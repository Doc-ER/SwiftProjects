//Subscripts
/*Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing
the member elements of a collection, list or sequence. For example, someArray[index]
someDictionary[key]*/

//Subscript Syntax
/*subscript(index: Int) -> Int {
    get {
        //....
    }

    set(newValue) {
        //...
    }
}

//As with read-only computed properties, you can simplify the delcaration of a read-only 
//subscript by removing the get keyword and its braces:
subscript(index: Int) -> Int {
    //return an appropriate subscript value here
}
*/
//below is an example of a read-only subscript implementation, which defines a TimesTable
//structure to represent an n-times-table of integers:
struct TimesTable {
    let multiplier: Int 
    subscript(index: Int) -> Int {
        return multiplier * index 
    }
}

let threeTimesTable = TimesTable(multiplier: 3)

print(threeTimesTable[6])
///////////////////////////////////////////////////////////////////////////////////////////////


struct Matrix {
    let rows: Int, columns: Int 
    var grid: [Double]
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns 
        grid = Array(repeating: 0.0, count: rows * columns)

    }

    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns 
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column ] = newValue
        }
    }

}

var matrix = Matrix(rows:5, columns: 6)

matrix[1, 1] = 2.5

print(matrix.grid )