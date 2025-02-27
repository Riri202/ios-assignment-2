//
//  PurchaseHistoryDetailsViewController.swift
//  ios-assignment-2
//
//  Created by Rita-Maria Oladokun on 2025-02-26.
//

import UIKit

class PurchaseHistoryDetailsViewController: UIViewController {
    
    var historyDetailsItem: PurchaseHistory?
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var datePurchased: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let goodProduct = historyDetailsItem {
            name.text = "Product: \(goodProduct.name)"
            quantity.text = "Quantity Purchased: \(goodProduct.quantity)"
            totalPrice.text = "Total Price: $\(goodProduct.totalPrice)"
            datePurchased.text = "Product: \(goodProduct.purchaseDate)"
        }
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
