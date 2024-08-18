# Interface Segregation Principle (ISP)

## What is ISP?
The Interface Segregation Principle (ISP) is one of the SOLID principles of object-oriented design. It states that no client should be forced to depend on methods it does not use. In other words, larger interfaces should be split into smaller, more specific ones, so that implementing classes only need to be concerned with the methods that are relevant to them.

## Before-ISP.swift
In the `Before-ISP.swift` file, we have a single interface (`Order`) that contains methods for placing an order, processing payment, delivering the order to the customer, and sending an email receipt. Both online and in-store orders are required to implement this interface.

### Issues:
- **In-store orders** do not need to deliver to customers or send email receipts, but they still have to implement these methods. This leads to code that can cause runtime errors (e.g., using `fatalError` in methods that are not applicable).

## After-ISP.swift
In the `After-ISP.swift` file, the large interface is split into smaller, more specific interfaces:
- `Order` contains methods common to all orders (`placeOrder`, `processPayment`).
- `OnlineOrderFeatures` contains methods specific to online orders (`deliverToCustomer`, `sendEmailReceipt`).

### Benefits:
- **No unnecessary methods**: The `InStoreOrder` class only implements the methods it actually needs, avoiding the pitfalls of the earlier approach.
- **Improved maintainability**: Code is more modular and easier to understand, reducing the likelihood of errors.

## Summary
By applying the Interface Segregation Principle, we create more focused interfaces that better represent the needs of different clients (in this case, different types of orders). This leads to more robust and maintainable code.
