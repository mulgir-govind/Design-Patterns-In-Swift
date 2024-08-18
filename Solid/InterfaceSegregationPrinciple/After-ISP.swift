import Foundation

// Smaller, more specific interfaces
protocol Order {
    func placeOrder()
    func processPayment()
}

protocol OnlineOrderFeatures {
    func deliverToCustomer()
    func sendEmailReceipt()
}

// Online order class conforming to both Order and OnlineOrderFeatures
class OnlineOrder: Order, OnlineOrderFeatures {
    func placeOrder() {
        print("- Order placed online")
    }

    func processPayment() {
        print("- Payment processed online")
    }

    func deliverToCustomer() {
        print("- Order delivered to customer")
    }

    func sendEmailReceipt() {
        print("- Email receipt sent to customer")
    }
}

// In-store order class conforming only to the Order protocol
class InStoreOrder: Order {
    func placeOrder() {
        print("- Order placed in store")
    }

    func processPayment() {
        print("- Payment processed at the counter")
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
// No unnecessary methods for in-store orders
