import Foundation
//Q1.
class Car{
    var brand: String
    var model: String
    var year: Int
    
    init(brand: String, model:String, year:Int){
        self.brand=brand
        self.model=model
        self.year=year
    }
}

let myCar=Car(brand: "Rolls Royce", model:"RD27", year:2027)
print("Car Details \n Brand: \(myCar.brand) \n Model: \(myCar.model) \n Year: \(myCar.year)")

//Q2. MODIFY AND UPDATE
class CarWithMethod{
    var brand: String
    var model: String
    var year: Int
    
    init(brand: String, model: String, year: Int){
        self.brand=brand
        self.model=model
        self.year=year
    }
    func displayDetails(){
        print("Car Details \n Brand: \(brand) \n Model: \(model) \n Year: \(year)")
    }
    var carAge: Int{
        let currentYear=Calendar.current.component(.year, from:Date())
        return currentYear-year
    }
}

let instanceCar=CarWithMethod(brand: "Honda", model:"City", year:2018)
instanceCar.displayDetails()
print("Calculated age of car: \(instanceCar.carAge) years")

//Q3. SUBCLASS ELECTRICCAR WITH OVERRIDDEN DISPLAYDETAILS
class ElectricCar: CarWithMethod{
    var batteryCapacity: Int
    init(brand: String, model:String, year: Int, batteryCapacity:Int){
        self.batteryCapacity=batteryCapacity
        super.init(brand: brand, model: model, year: year)
    }
    override func displayDetails(){
        print("Electric Car Details \n Brand: \(brand) \n Model: \(model) \n Year: \(year) \n Battery Capacity: \(batteryCapacity)")
    }
}
let myTesla = ElectricCar(brand: "Tesla", model: "Model S", year: 2023, batteryCapacity: 100)
myTesla.displayDetails()

//Q4. SUBCLASS DOG OVERRIDING INITIALIZER
class Animal {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Dog: Animal {
    var breed: String
    
    init(name: String, age: Int, breed: String) {
        self.breed = breed
        super.init(name: name, age: age)
    }
}

let myDog = Dog(name: "Bruno", age: 3, breed: "German Shepherd")
print("Dog Details \n Name: \(myDog.name), Age: \(myDog.age), Breed: \(myDog.breed)\n")

//Q5: Subclass GamingLaptop with Default Parameter Value
class Laptop {
    var brand: String
    var processor: String
    var ramSize: Int
    
    init(brand: String, processor: String, ramSize: Int) {
        self.brand = brand
        self.processor = processor
        self.ramSize = ramSize
    }
}

class GamingLaptop: Laptop {
    var graphicsCard: String
    
    init(brand: String, processor: String, ramSize: Int = 16, graphicsCard: String) {
        self.graphicsCard = graphicsCard
        super.init(brand: brand, processor: processor, ramSize: ramSize)
    }
}

let myGamingPC = GamingLaptop(brand: "ASUS", processor: "Intel i7", graphicsCard: "RTX 4060")
print("Gaming Laptop -> Brand: \(myGamingPC.brand), Processor: \(myGamingPC.processor), RAM: \(myGamingPC.ramSize)GB, GPU: \(myGamingPC.graphicsCard)\n")


// MARK: - Question 6: Array Searching / Checking Elements
var numbers = [1, -3, 50, 72, -95, 115]
let has72 = numbers.contains(72)
let has95 = numbers.contains(95)
print("Is 72 in the array? \(has72)")
print("Is 95 in the array? \(has95)\n")


// MARK: - Question 7: Array of 20 elements with default value 0
let myArray = Array(repeating: 0, count: 20)
print("myArray elements (20 zeros): \(myArray)\n")


// MARK: - Question 8: Array Emptiness and Count Check
var fruits = ["Apple", "Banana", "Mango", "Orange", "Grapes"]
if fruits.isEmpty {
    print("The fruits array is empty.")
} else {
    print("The fruits array is not empty. Total elements present: \(fruits.count)\n")
}


// MARK: - Question 9: Array Mutating Operations on Cricketers
var cricketers = ["Sachine", "Rahul", "Rohit", "Virat"]
print("Initial array: \(cricketers)")

cricketers[0] = "Yuvraj"              // Update "Sachine" with "Yuvraj"
cricketers.append("Shubhaman")         // Add "Shubhaman" using append method
cricketers += ["Ravindra", "Hardik"]   // Add array using + operator
cricketers.insert("Suresh", at: 4)     // Insert "Suresh" at position 5 (index 4)
cricketers.remove(at: 3)               // Remove name at position 4 (index 3)
cricketers.removeLast()                // Remove last cricketer
print("Display cricketers after all operations: \(cricketers)\n")


// MARK: - Question 10: Array of Arrays (Name and Age)
let cricketerNames = ["Sachin", "Rahul", "Rohit", "Virat"]
let cricketerAges = [50, 51, 37, 35]
let nameAge: [[Any]] = [cricketerNames, cricketerAges]
// Display name and age of first cricketer
if let firstNames = nameAge[0] as? [String], let firstAges = nameAge[1] as? [Int] {
    print("First Cricketer -> Name: \(firstNames[0]), Age: \(firstAges[0])\n")
}


// MARK: - Question 11: Dictionary Creation and Display
var scores = ["Sachin": 50000, "Hardik": 4000, "Ravindra": 8000]
print("Scores Dictionary details: \(scores)\n")


// MARK: - Question 12: Add/Update Dictionary Elements
scores["Virat"] = 25000 // Add Virat
let oldHardikScore = scores.updateValue(9000, forKey: "Hardik") // Update Hardik score
print("Old score of Hardik was: \(oldHardikScore ?? 0)")
print("Updated Scores Dictionary: \(scores)\n")


// MARK: - Question 13: Remove Dictionary Key and Print Score at Deletion
let sachinScore = scores.removeValue(forKey: "Sachin")
print("Score of Sachin at the time of deletion: \(sachinScore ?? 0)")
print("Remaining dictionary elements: \(scores)\n")


// MARK: - Question 14: Create Two Separate Arrays from Dictionary
let playerNames = Array(scores.keys)
let playerScores = Array(scores.values)
print("Player Names Array: \(playerNames)")
print("Player Scores Array: \(playerScores)\n")


// MARK: - Question 15: For Loop on Array of 5 Cities
let cities = ["Mumbai", "Pune", "Sangli", "Kolhapur", "Bangalore"]
print("Cities listed on new lines:")
for city in cities {
    print(city)
}
print("")


// MARK: - Question 16: For Loop to Calculate Factorial
let num = 5
var factorial = 1
for i in 1...num {
    factorial *= i
}
print("Factorial of \(num) = 5*4*3*2*1 = \(factorial)\n")


// MARK: - Question 17: For Loop on Vehicles Dictionary
let vehicles = ["unicycle": 1, "bicycle": 2, "tricycle": 3, "quad bike": 4]
for (vehicle, wheels) in vehicles {
    print("\(vehicle) - has - \(wheels) wheels")
}
print("")


// MARK: - Question 18: While Loop for Prime Number Check
let testNumber = 17
var isPrime = true
var divisor = 2

if testNumber <= 1 {
    isPrime = false
} else {
    while divisor * divisor <= testNumber {
        if testNumber % divisor == 0 {
            isPrime = false
            break
        }
        divisor += 1
    }
}
print("Number \(testNumber) is: " + (isPrime ? "Prime" : "Not prime") + "\n")


// MARK: - Question 19: While Loop to Reverse an Integer
var inputInteger = 1234
let originalInteger = inputInteger
var reversedInteger = 0

while inputInteger > 0 {
    let remainder = inputInteger % 10
    reversedInteger = reversedInteger * 10 + remainder
    inputInteger /= 10
}
print("Original Integer: \(originalInteger), Reversed Integer: \(reversedInteger)\n")


// MARK: - Question 20: While Loop for Armstrong Number Check
let armstrongInput = 153
var tempVar = armstrongInput
var digitSum = 0
let digitCount = String(armstrongInput).count

while tempVar > 0 {
    let digit = tempVar % 10
    var powerVal = 1
    for _ in 0..<digitCount {
        powerVal *= digit
    }
    digitSum += powerVal
    tempVar /= 10
}

let isArmstrongResult = (digitSum == armstrongInput)
print("\(armstrongInput) is " + (isArmstrongResult ? "an Armstrong number." : "not an Armstrong number."))
