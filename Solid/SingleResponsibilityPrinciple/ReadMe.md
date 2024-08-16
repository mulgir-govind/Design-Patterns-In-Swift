# Single Responsibility Principle (SRP)

## What is SRP?

The Single Responsibility Principle (SRP) is one of the five SOLID principles of object-oriented design. It states that a class should have only one reason to change, meaning that a class should have only one job or responsibility.

By adhering to SRP, we can achieve:

1. **Modularity**: Each class has a single responsibility, making it easier to maintain and extend the codebase.
2. **Code Organization**: The code is more organized and easier to understand.
3. **Reusability**: Classes that adhere to SRP can be reused more easily in different parts of the application.
4. **Testability**: Classes with a single responsibility are easier to test.

## Example Overview

In the provided example, we have a `Journal` class responsible for managing journal entries and a `Persistence` class responsible for saving and loading the journal data.

### Before SRP
In the `Before-SRP.swift` file, you will see that the `Journal` class also handles persistence, violating SRP.

### After SRP
In the `After-SRP.swift` file, the responsibilities are separated into different classes, following the SRP.