import Foundation

// Base protocol representing generic bird behavior
protocol Bird {
    var name: String { get }
}

// Separate protocol for birds that can fly
protocol Flyable {
    func fly() -> String
}

// Sparrow class conforming to Bird and Flyable
class Sparrow: Bird, Flyable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    // Sparrow can fly, so the fly method is implemented here
    func fly() -> String {
        return "\(name) is flying."
    }
}

// Penguin class conforming only to Bird
class Penguin: Bird {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    // Penguins do not conform to Flyable, so they don't implement fly().
    // This design naturally reflects the real-world behavior of penguins.
}

// Function to make birds fly, but only for those that are Flyable
func makeBirdFly(bird: Bird & Flyable) {
    // Since the function only accepts Bird types that are Flyable,
    // it adheres to LSP by ensuring that any passed bird can indeed fly.
    print(bird.fly())
}

// Usage
let sparrow = Sparrow(name: "Sparrow")
let penguin = Penguin(name: "Penguin")

makeBirdFly(bird: sparrow)  // Output: Sparrow is flying.
// makeBirdFly(bird: penguin) // This would cause a compile-time error, preventing misuse.
