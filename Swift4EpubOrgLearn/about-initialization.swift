struct Fahrenheit {
    var temperature: Double 
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

struct Celsius {
    var temperatureInCelsius: Double 
    init(fromFahrenheight fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }

}

let boilingPointOfWater = Celsius(fromFahrenheight: 212.0 )

let freezingPointOfWater = Celsius(fromKelvin: 273.15 )

struct Color {
    let red, green, blue: Double 
    init(red: Double, green: Double, blue: Double ){
        self.red = red 
        self.green = green
        self.blue = blue 

    }
    init(white: Double) {
        red = white 
        green = white 
        blue = white 
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 0.0)
let halfGray = Color(white: 0.5)
//let veryGreen = Color(0.0, 1.0, 0.0) this reports an error --
//argument labels are required.

//Optional Property Types
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text 
    }
    func ask(){
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese ?")
cheeseQuestion.ask()

//Default Initiailizers
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false

}

var item = ShoppingListItem()
