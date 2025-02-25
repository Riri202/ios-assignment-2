//
//  ProductManagerModel.swift
//  ios-assignment-2
//
//  Created by Rita-Maria Oladokun on 2025-02-25.
//

import Foundation

class ProductManager {
    var allProducts: [Product] = [
        Product(name: "Pants" , price: 20, quantity: 20),
        Product(name: "Shoes" , price: 26, quantity: 230),
        Product(name: "T-Shirts" , price: 43, quantity: 250),
        Product(name: "Hats" , price: 20, quantity: 270),
        Product(name: "Dresses" , price: 20, quantity: 80),
        Product(name: "Flowers" , price: 20, quantity: 20),
    ]
    
    func addProduct (){
        
    }
    
    func updateQuantity (name: String, newQuantity: Int) {
        if let index = allProducts.firstIndex(where: {$0.name == name}) {
            allProducts[index].quantity = newQuantity
        }
    }
}
