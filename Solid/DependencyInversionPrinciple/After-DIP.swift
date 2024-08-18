import Foundation

/// The high-level module now depends on an abstraction, making it easy to 
/// switch between different payment processors without changing the PaymentService class.

// Abstraction: Protocol defining the payment processing interface
protocol PaymentProcessor {
    func initiatePayment(of amount: Double)
    func verifyPayment() -> Bool
    func refundPayment(of amount: Double)
}

// Low-level module: Concrete implementation of PayPalPaymentProcessor adhering to the abstraction
class PayPalPaymentProcessor: PaymentProcessor {
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

// Low-level module: Another concrete implementation of a different payment processor
class StripePaymentProcessor: PaymentProcessor {
    func initiatePayment(of amount: Double) {
        print("- Initiating payment of $\(amount) using Stripe.")
    }

    func verifyPayment() -> Bool {
        print("- Verifying payment using Stripe.")
        return true
    }

    func refundPayment(of amount: Double) {
        print("- Refunding $\(amount) using Stripe.")
    }
}

// High-level module: Payment Service that now depends on an abstraction
class PaymentService {
    // Adheres to DIP: High-level module depends on an abstraction
    private let paymentProcessor: PaymentProcessor

    init(paymentProcessor: PaymentProcessor) {
        self.paymentProcessor = paymentProcessor
    }

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

let paypalProcessor = PayPalPaymentProcessor()
let stripeProcessor = StripePaymentProcessor()

let paymentService = PaymentService(paymentProcessor: paypalProcessor)
paymentService.processPayment(of: 100)
paymentService.refundPayment(of: 80)

// Changing the processor without modifying the PaymentService
let anotherPaymentService = PaymentService(paymentProcessor: stripeProcessor)
anotherPaymentService.processPayment(of: 200.0)
anotherPaymentService.refundPayment(of: 75.0)

