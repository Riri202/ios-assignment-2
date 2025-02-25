//
//  ProductModel.swift
//  ios-assignment-2
//
//  Created by Rita-Maria Oladokun on 2025-02-25.
//

import Foundation

class Product {
    var id: UUID
    var name: String
    var price: Int
    var quantity: Int
    
    init(name: String, price: Int, quantity: Int) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}
