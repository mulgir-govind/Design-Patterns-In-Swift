import Foundation

enum Color {
    case red
    case orange
    case green
}

enum Size {
    case small, medium, large
}

struct Product {
    var name: String
    var color: Color
    var size: Size
}

// The ProductFilter class violates the Open/Closed Principle
// because it needs to be modified whenever a new filter condition is added.
// This class has methods for filtering by color, size, and a combination of both.
// Any new filtering criteria would require changing the code here, thus it's not "closed for modification".

class ProductFilter {
    func filterByColor(_ products: [Product], color: Color) -> [Product] {
        return products.filter { $0.color == color }
    }

    func filterBySize(_ products: [Product], size: Size) -> [Product] {
        return products.filter { $0.size == size }
    }

    func filterByColorAndSize(_ products: [Product], color: Color, size: Size) -> [Product] {
        return products.filter { $0.color == color && $0.size == size }
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

    // Filtering by color
    let orangeProducts = filter.filterByColor(allProducts, color: .orange)
    print("\nAll orange products:")
    orangeProducts.forEach {
        print("- \($0.name) is \($0.color) and \($0.size)")
    }

    // Filtering by size
    let smallProducts = filter.filterBySize(allProducts, size: .small)
    print("\nAll small products:")
    smallProducts.forEach {
        print("- \($0.name) is \($0.color) and \($0.size)")
    }

    // Filtering by color and size
    let smallGreenProducts = filter.filterByColorAndSize(allProducts, color: .green, size: .small)
    print("\nAll small green products:")
    smallGreenProducts.forEach {
        print("- \($0.name) is \($0.color) and \($0.size)")
    }
}

main()
