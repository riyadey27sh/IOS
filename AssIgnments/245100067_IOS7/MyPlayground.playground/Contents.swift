
import Foundation


// MARK: - Question 1: Declare Optional Int, assign nil, then assign 90
var score: Int? = nil
print("Initial score value: \(String(describing: score))")

score = 90
print("Updated score value: \(String(describing: score))\n")


// MARK: - Question 2: Force Unwrapping a nil Optional
let emptyOptional: Int? = nil
print("Explanation: Force-unwrapping an optional that is nil using '!' triggers a runtime crash:")
print("Fatal error: Unexpectedly found nil while unwrapping an Optional value.")
// Uncommenting the next line will crash the execution:
// print(emptyOptional!)
print("To avoid runtime crashes, always use safe unwrapping (if let, guard let, or ??).\n")


// MARK: - Question 3: Function taking Optional String
func printOptionalString(_ text: String?) {
    if let actualText = text {
        print("Value: \(actualText)")
    } else {
        print("No value")
    }
}

printOptionalString("Hello Swift")
printOptionalString(nil)
print("")


// MARK: - Question 4: Function returning half of Double? or 0.0
func halfValue(of number: Double?) -> Double {
    if let val = number {
        return val / 2.0
    }
    return 0.0
}

print("Half of 50.0: \(halfValue(of: 50.0))")
print("Half of nil:  \(halfValue(of: nil))\n")


// MARK: - Question 5: Optional Binding using if let
let optionalInteger: Int? = 42

if let unwrappedInteger = optionalInteger {
    print("Successfully unwrapped integer: \(unwrappedInteger)\n")
} else {
    print("The optional integer contains nil.\n")
}


// MARK: - Question 6: Class Book with Optional Chaining
class Book {
    var title: String
    var author: String?
    
    init(title: String, author: String? = nil) {
        self.title = title
        self.author = author
    }
}

let bookWithAuthor = Book(title: "The Swift Programming Language", author: "Apple Education")
let bookWithoutAuthor = Book(title: "Anonymous Anthology")

// Optional chaining to access author
if let authorName = bookWithAuthor.author {
    print("Book: '\(bookWithAuthor.title)', Author: \(authorName)")
} else {
    print("Author not available")
}

if let authorName = bookWithoutAuthor.author {
    print("Book: '\(bookWithoutAuthor.title)', Author: \(authorName)")
} else {
    print("Book: '\(bookWithoutAuthor.title)', Author: Not available\n")
}


// MARK: - Question 7: Function taking Optional Dictionary [String: Int]?
func getValue(forKey key: String, from dict: [String: Int]?) -> Int {
    // Optional chaining on the dictionary and nil-coalescing fallback to -1
    return dict?[key] ?? -1
}

let sampleDict: [String: Int]? = ["Math": 95, "Physics": 88]
print("Key 'Math' in sampleDict:     \(getValue(forKey: "Math", from: sampleDict))")
print("Key 'Chemistry' in sampleDict:\(getValue(forKey: "Chemistry", from: sampleDict))")
print("Key 'Math' in nil dictionary: \(getValue(forKey: "Math", from: nil))\n")


// MARK: - Question 8: Function returning first word from Optional sentence
func getFirstWord(from sentence: String?) -> String {
    guard let validSentence = sentence, !validSentence.trimmingCharacters(in: .whitespaces).isEmpty else {
        return "No words"
    }
    
    let words = validSentence.split(separator: " ")
    if let firstWord = words.first {
        return String(firstWord)
    }
    return "No words"
}

print("First word of 'Swift is awesome': \(getFirstWord(from: "Swift is awesome"))")
print("First word of nil:                \(getFirstWord(from: nil))\n")


// MARK: - Question 9: Struct User with Optional Email Method
struct UserWithEmail {
    var name: String
    var email: String?
    
    func getEmailStatus() -> String {
        return email ?? "No email provided"
    }
}

let userWithEmail = UserWithEmail(name: "Riya", email: "riyadey1712@gmail.com")
let userNoEmail = UserWithEmail(name: "Aman", email: nil)

print("\(userWithEmail.name): \(userWithEmail.getEmailStatus())")
print("\(userNoEmail.name): \(userNoEmail.getEmailStatus())\n")


// MARK: - Question 10: BankAccount with Failable Initializer
class BankAccount {
    var balance: Double
    
    // Failable Initializer (returns nil if balance < 0)
    init?(balance: Double) {
        if balance < 0 {
            return nil
        }
        self.balance = balance
    }
}

if let validAccount = BankAccount(balance: 1500.0) {
    print("Account created successfully with balance: ₹\(validAccount.balance)")
} else {
    print("Failed to initialize account: Negative balance provided.")
}

if let invalidAccount = BankAccount(balance: -250.0) {
    print("Account created with balance: ₹\(invalidAccount.balance)")
} else {
    print("Failed to initialize account: Negative balance provided.\n")
}


// MARK: - Question 11: Struct User with Validated Username (Failable Init)
struct UserValidated {
    var username: String
    
    // Failable Initializer requiring at least 5 characters
    init?(username: String) {
        if username.count < 5 {
            return nil
        }
        self.username = username
    }
}

if let validUser = UserValidated(username: "riyadey") {
    print("User created successfully: '\(validUser.username)'")
} else {
    print("Invalid user: Username must be at least 5 characters.")
}

if let shortUser = UserValidated(username: "ria") {
    print("User created: '\(shortUser.username)'")
} else {
    print("Invalid user: Username must be at least 5 characters.")
}
