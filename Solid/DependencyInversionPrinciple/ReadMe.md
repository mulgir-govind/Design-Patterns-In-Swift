# What is the Dependency Inversion Principle (DIP)?

The Dependency Inversion Principle is one of the five SOLID principles of object-oriented design. It suggests that:

- High-level modules should not depend on low-level modules. Both should depend on abstractions.
- Abstractions should not depend on details. Details should depend on abstractions.

This principle is about inverting the direction of dependency. In traditional design, high-level modules (like business logic) often depend on low-level modules (like data access). DIP encourages us to make both high- and low-level modules depend on abstractions (e.g., interfaces or protocols). This leads to a more flexible and maintainable design where the implementation details can change without affecting the high-level logic.

## Inversion in DIP:
- The term "inversion" in DIP refers to the reversal of the conventional dependency direction. Typically, high-level modules depend on low-level modules. DIP inverts this by making both high-level and low-level modules depend on abstractions, reducing coupling and improving modularity.

## High-Level vs. Low-Level Modules

### High-Level Module:
- This is a module that defines complex logic and policies. For example, in a payroll system, the high-level module might calculate salaries, bonuses, and deductions.

### Low-Level Module:
- This is a module that performs basic, detailed operations. For example, in the same payroll system, a low-level module might access the database to retrieve employee data or write transaction logs.


In traditional design, the high-level module might directly depend on the low-level module, making it harder to change or extend the system.

## Abstraction vs. Details

### Abstraction:
- This refers to the general, high-level concepts or interfaces that define what something does, not how it does it. For example, a protocol or interface that defines a method to send a notification is an abstraction.

### Details:
- This refers to the specific, low-level implementations that fulfill the abstraction. For example, an email service that sends notifications is a detail.


According to DIP, high-level modules should depend on abstractions rather than concrete details. This way, the specifics of how something is done can be changed without affecting the broader logic.