import Foundation

// Base class representing a generic bird
class Bird {
    var name: String

    init(name: String) {
        self.name = name
    }

    // Method to make the bird fly
    // LSP Violation: The base class assumes that all birds can fly,
    // but this is not true for all bird species (e.g., penguins).
    func fly() -> String {
        return "\(name) is flying."
    }
}

// Subclass representing a Sparrow, a type of bird that can fly
class Sparrow: Bird {
    // Inherits fly() method from Bird, which is appropriate for sparrows
}

// Subclass representing a Penguin, a type of bird that cannot fly
class Penguin: Bird {
    // LSP Violation: Penguins cannot fly, so this method should not exist.
    // However, due to inheritance, the Penguin class is forced to override 
    // the fly() method, leading to a design that doesn't make sense.
    override func fly() -> String {
        // Inappropriate implementation for a penguin, 
        // possibly leading to errors or misuse.
        return "\(name) cannot fly."
    }
}

// Function to make birds fly
func makeBirdFly(bird: Bird) {
    // LSP Violation: This function expects any Bird to be able to fly,
    // but if a Penguin is passed, the behavior is not as expected.
    print(bird.fly())
}

// Usage
let sparrow = Sparrow(name: "Sparrow")
let penguin = Penguin(name: "Penguin")

makeBirdFly(bird: sparrow)  // Output: Sparrow is flying.
makeBirdFly(bird: penguin)  // Output: Penguin cannot fly (unexpected behavior).
