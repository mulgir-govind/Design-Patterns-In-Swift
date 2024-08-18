import Foundation

// A single interface that both Online and InStore orders must conform to
protocol Order {
    func placeOrder()
    func processPayment()
    func deliverToCustomer() // Not applicable for in-store orders
    func sendEmailReceipt() // Not applicable for in-store orders
}

// Online order class
class OnlineOrder: Order {
    func placeOrder () {
        print("- Order placed online")
    }

    func processPayment() {
        print("- Payment processed online")
    }

    func deliverToCustomer() {
        print("- Order delivered to customer")
    }

    func sendEmailReceipt() {
        print("- email receipt sent to customoer")
    }
}

// In-store order class
class InStoreOrder: Order {
    func placeOrder() {
        print("- Order placed in store")
    }

    func processPayment() {
        print("- Payment processed at counter")
    }

    func deliverToCustomer() {
        // In-store orders are picked up, so this method is not needed.
        fatalError("- In-store orders cannot be delivered")
    }

    func sendEmailReceipt() {
        // In-store orders provide printed receipts, so this method is not needed.
        fatalError("- In-store orders do not send email receipts")
    }
}

// Execute the code
print("\nOnline order:")
let onlineOrder = OnlineOrder()
onlineOrder.placeOrder()
onlineOrder.processPayment()
onlineOrder.deliverToCustomer()
onlineOrder.sendEmailReceipt()

print("\nIn store order:")
let inStoreOrder = InStoreOrder()
inStoreOrder.placeOrder()
inStoreOrder.processPayment()
// inStoreOrder.deliverToCustomer() // This will crash as it is unintended functionality for in store orders
// inStoreOrder.sendEmailReceipt() // This will crash as it is unintended functionality for in store orders