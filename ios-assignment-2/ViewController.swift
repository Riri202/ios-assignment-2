//
//  ViewController.swift
//  ios-assignment-2
//
//  Created by Rita-Maria Oladokun on 2025-02-21.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource {
    
    
    var productManager: ProductManager?
    
    // outlets
    @IBOutlet weak var productTable: UITableView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    var selectedProductPrice: Int = 0
    var selectedProductQuantity: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        productManager = ((UIApplication.shared.delegate) as! AppDelegate).myModel
        
        productTable.dataSource = self
        productTable.delegate = self
        
        quantityLabel.text = ""
        productLabel.text = "select an item"
        totalLabel.text = ""
        selectedProductPrice = 0
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (productManager?.allProducts.count)!
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // number of rows in table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") {
            if let goodproduct = productManager?.allProducts[indexPath.row] {
                cell.textLabel?.text = "\(goodproduct.name)"
                cell.detailTextLabel?.text = "\(goodproduct.quantity)"
            }
            return cell
        } else {
            print("Error: Could not dequeue a cell with identifier 'mycell'")
            return UITableViewCell()
        }
    }
    
    // when a table row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let goodProduct = productManager?.allProducts[indexPath.row] {
            productLabel.text = goodProduct.name
            selectedProductPrice = goodProduct.price
            selectedProductQuantity = goodProduct.quantity
        }
    }
    
    
    // when a digit button is clicked
    
    @IBAction func DigitClicked(_ sender: UIButton) {
        if let goodDigit = sender.titleLabel?.text {
            quantityLabel.text = String(describing: quantityLabel.text!) + String(describing: goodDigit)
            if let quantity = Int( quantityLabel.text ?? "") {
                totalLabel.text = "\(quantity * Int(selectedProductPrice))"
                
            }
        }
        
    }
    
    // clear quantity label
    @IBAction func clearQuantityLabel(_ sender: Any) {
        quantityLabel.text = ""
    }
    
    // when buy buttin is clicked
    
    @IBAction func Buy(_ sender: Any) {
        var newQuantity = selectedProductQuantity - (Int(quantityLabel.text!) ?? 0)
        print(newQuantity)
        productManager!.updateQuantity(name: productLabel.text!, newQuantity: newQuantity)
        productTable.reloadData()
        quantityLabel.text = ""
        productLabel.text = "select an item"
        totalLabel.text = ""
        selectedProductPrice = 0
    }
    
    
}

