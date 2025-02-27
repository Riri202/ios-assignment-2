import Foundation

class ProductManager {
    var allProducts: [Product] = [
        Product(name: "Pants", price: 20, quantity: 20),
        Product(name: "Shoes", price: 26, quantity: 230),
        Product(name: "T-Shirts", price: 43, quantity: 250),
        Product(name: "Hats", price: 20, quantity: 270),
        Product(name: "Dresses", price: 20, quantity: 80),
        Product(name: "Flowers", price: 20, quantity: 20) // Removed extra comma
    ]
    
    var purchaseHistory: [PurchaseHistory] = [] // Removed optional
    
    //    func addProduct(name: String, price: Double, quantity: Int) {
    //        let newProduct = Product(name: name, price: price, quantity: quantity)
    //        allProducts.append(newProduct)
    //    }
    
    func updateQuantity(name: String, newQuantity: Int) {
        if let index = allProducts.firstIndex(where: { $0.name == name }) {
            allProducts[index].quantity = newQuantity
        }
    }
    
    func addToPurchaseHistory(name: String, quantity: Int) {
        if let index = allProducts.firstIndex(where: { $0.name == name }) {
            let product = allProducts[index]
            purchaseHistory.append(PurchaseHistory(name: name, quantity: quantity, price: Double(product.price)))
        }
    }
}

class PurchaseHistory {
    var name: String
    var quantity: Int
    var totalPrice: Double
    var purchaseDate: String
    
    init(name: String, quantity: Int, price: Double) {
        self.name = name
        self.quantity = quantity
        self.totalPrice = Double(quantity) * price
        self.purchaseDate = Self.getPurchaseDate()
    }
    
    static func getPurchaseDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm a"
        return formatter.string(from: Date())
    }
}
