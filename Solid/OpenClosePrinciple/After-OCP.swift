import Foundation

enum Color {
    case red, green, orange
}

enum Size {
    case small, medium, large
}

struct Product {
    var name: String
    var color: Color
    var size: Size
}

// MARK: - Specifications

// The Specification protocol allows the creation of new conditions without modifying existing code.
// This satisfies the Open/Closed Principle as new filtering criteria can be added by creating new implementations of this protocol.

protocol Specification {
    associatedtype T
    func isSatisfied(_ item: T) -> Bool
}

// Concrete specification for filtering by color
struct ColorSpecification: Specification {
    typealias T = Product
    let color: Color

    func isSatisfied(_ item: T) -> Bool {
        return item.color == self.color
    }
}

// Concrete specification for filtering by size
struct SizeSpecification: Specification {
    typealias T = Product
    let size: Size

    func isSatisfied(_ item: T) -> Bool {
        return item.size == self.size
    }
}

// Composite specification to combine multiple conditions using generics
struct AndSpecification<T, 
    SpecA: Specification,
    SpecB: Specification> : Specification where SpecA.T == SpecB.T, SpecA.T == T, SpecA.T == T {
    let firstSpec: SpecA
    let secondSpec: SpecB

    func isSatisfied(_ item: T) -> Bool {
        return firstSpec.isSatisfied(item) && secondSpec.isSatisfied(item)
    }
}

// MARK: - Filter

// The Filter protocol defines a method to filter items based on a specification.
// The ProductFilter class implements this protocol, allowing it to filter products by any specification.

protocol Filter {
    associatedtype T
    func filter<Spec: Specification>(_ items: [T], spec: Spec) -> [T] where Spec.T == T
}

struct ProductFilter: Filter {
    typealias T = Product

    func filter<Spec: Specification>(_ items: [T], spec: Spec) -> [T] where Spec.T == T {
        return items.filter { spec.isSatisfied($0) }
    }
}

// MARK: - Execute

func main() {
    let chilly = Product(name: "Chilly", color: .green, size: .small)
    let apple = Product(name: "Apple", color: .red, size: .small)
    let jackfruit = Product(name: "Jackfruit", color: .green, size: .medium)
    let pumkin = Product(name: "Pumkin", color: .orange, size: .large)
    let coriander = Product(name: "Coriander", color: .green, size: .small)

    let allProducts = [ chilly, apple, jackfruit, pumkin, coriander]
    print("All products:")
    allProducts.forEach {
        print("- \($0.name) is \($0.color) and \($0.size)")
    }

    let filter = ProductFilter()

    // Filtering by color using the OCP-compliant approach
    let orangeColorSpec = ColorSpecification(color: .orange)
    let orangeProducts = filter.filter(allProducts, spec: orangeColorSpec)
    print("\nAll orange products:")
    orangeProducts.forEach {
        print("- \($0.name) is \($0.color) and \($0.size)")
    }

    // Filtering by size using the OCP-compliant approach
    let smallSizeSpec = SizeSpecification(size: .small)
    let smallProducts = filter.filter(allProducts, spec: smallSizeSpec)
    print("\nAll small products:")
    smallProducts.forEach {
        print("- \($0.name) is \($0.color) and \($0.size)")
    }

    // Filtering by a combination of color and size using the OCP-compliant approach
    let smallAndGreenProdSpec = AndSpecification(
        firstSpec: SizeSpecification(size: .small), 
        secondSpec: ColorSpecification(color: .green))
    let smallAndGreenProducts = filter.filter(allProducts, spec: smallAndGreenProdSpec)
    print("\nAll small green products:")
    smallAndGreenProducts.forEach {
        print("- \($0.name) is \($0.color) and \($0.size)")
    }
}

main()
