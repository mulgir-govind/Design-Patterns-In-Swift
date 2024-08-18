import Foundation

/// Voilatoin of Dependency Inversion Principle (DIP):
/// The high-level module (PaymentService) is tightly coupled to the low-level module (PayPalPaymentProcessor). 
/// This makes it hard to change or extend the payment processing logic without modifying the PaymentService class.
/// If we need to add another payment processor let say `StripePaymentProcessor`, we will also to modify the existing
/// `PaymentService` class to incorporate new payment processor. This would again voilate the Open/Closed Principle. 

// Low-level module: Concrete payment processor
class PayPalPaymentProcessor {
    func initiatePayment(of amount: Double) {
        print("- Initiating payment of $\(amount) using PayPal.")
    }

    func verifyPayment() -> Bool {
        print("- Verifying payment using PayPal.")
        return true
    }

    func refundPayment(of amount: Double) {
        print("- Refunding $\(amount) using PayPal.")
    }
}

// High-level module: Payment Service that uses PayPal directly
class PaymentService {
    private let paymentProcessor = PayPalPaymentProcessor()

    func processPayment(of amount: Double) {
        paymentProcessor.initiatePayment(of: amount)
        if paymentProcessor.verifyPayment() {
            print("- Payment of $\(amount) processed successfully.")
        }
    }

    func refundPayment(of amount: Double) {
        paymentProcessor.refundPayment(of: amount)
    }
}

let paymentService = PaymentService()
paymentService.processPayment(of: 100)
paymentService.refundPayment(of: 80)