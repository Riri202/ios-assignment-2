//
//  RestockTableViewCell.swift
//  ios-assignment-2
//
//  Created by Rita-Maria Oladokun on 2025-02-26.
//

import UIKit

class RestockTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var restockStackView: UIStackView!
    
    var showAlertHandler: ((String, String) -> Void)?

    var onRestockTapped: ((Int) -> Void)?
    var onCancelTapped: (() -> Void)?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        restockStackView?.isHidden = true
//        quantityTextField?.isHidden = true

    }
    
    func configure(with product: Product) {
        nameLabel.text = product.name
        quantityLabel.text = "\(product.quantity)"
        quantityTextField.text = "\(product.quantity)"
    }
    
    @IBAction func restockTapped(_ sender: UIButton) {
        guard let newQuantityText = quantityTextField.text, !newQuantityText.isEmpty,
                 let newQuantity = Int(newQuantityText), newQuantity > 0 else {
               showAlertHandler?("Invalid Quantity", "Please enter a valid quantity before restocking.")
               return
           }

           if onRestockTapped != nil {
               onRestockTapped?(newQuantity)
           } else {
               showAlertHandler?("Selection Required", "Please select an item from the list.")
           }
    }
    
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        onCancelTapped?()

        
    }
    
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
