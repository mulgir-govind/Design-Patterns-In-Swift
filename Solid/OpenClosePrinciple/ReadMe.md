# Open/Closed Principle (OCP)

## Introduction

The Open/Closed Principle (OCP) is one of the five SOLID principles of object-oriented design. It states that software entities (classes, modules, functions, etc.) should be **open for extension, but closed for modification**. This means that the behavior of a module should be extendable without modifying its source code, thus reducing the risk of introducing new bugs into existing functionality.

## Before Applying OCP

In the `Before-OCP.swift` file, we have a `ProductFilter` class that violates the Open/Closed Principle. The class has methods for filtering products by color, size, and a combination of both. If we need to add a new filtering criterion (e.g., by weight, material, etc.), we would need to modify the `ProductFilter` class, which increases the risk of breaking existing functionality.

## After Applying OCP

In the `After-OCP.swift` file, the code has been refactored to follow the Open/Closed Principle. We introduced the `Specification` protocol, which allows us to create new filter criteria without modifying the existing `ProductFilter` class. The filtering logic is now encapsulated within specific implementations of the `Specification` protocol (e.g., `ColorSpecification`, `SizeSpecification`). We also demonstrated how to combine multiple specifications using generics and composite specifications (`AndSpecification`).

### Key Benefits

- **Extensibility**: We can add new filtering criteria by creating new specifications without changing the `ProductFilter` class.
- **Maintainability**: Since we don't modify existing code, we reduce the risk of introducing bugs.
- **Reusability**: The specifications can be reused in different parts of the codebase or combined in various ways to create complex filtering logic.

## Conclusion

The Open/Closed Principle encourages writing code that is easy to extend with new features while ensuring that the existing code remains stable and unchanged. By following this principle, we create software that is more flexible, maintainable, and resilient to change.
