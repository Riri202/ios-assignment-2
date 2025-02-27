//
//  RestockViewController.swift
//  ios-assignment-2
//
//  Created by Rita-Maria Oladokun on 2025-02-26.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func cancelRestock(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
    var productManager: ProductManager?
    
    @IBOutlet weak var restockTableView: UITableView!
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productManager = ((UIApplication.shared.delegate) as! AppDelegate).myModel
        restockTableView.delegate = self
        restockTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (productManager?.allProducts.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! RestockTableViewCell
        let product = (productManager?.allProducts[indexPath.row])!
        cell.configure(with: product)
        
        cell.restockStackView.isHidden = selectedIndexPath != indexPath
        cell.quantityTextField.isHidden = selectedIndexPath != indexPath
        cell.nameLabel.isHidden = selectedIndexPath == indexPath
        cell.quantityLabel.isHidden = selectedIndexPath == indexPath
        
        // Button actions
        cell.onRestockTapped = { newQuantity in
            self.restockProduct(at: indexPath, newQuantity: newQuantity)
        }
        
        cell.onCancelTapped = {
            self.selectedIndexPath = nil
            self.restockTableView.reloadData()
            
        }
        
        cell.showAlertHandler = { [weak self] title, message in
                self?.showAlert(title: title, message: message)
            }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        tableView.reloadData()
    }
    
    func restockProduct ( at indexPath: IndexPath, newQuantity: Int) {
        productManager!.allProducts[indexPath.row].quantity = newQuantity
        selectedIndexPath = nil
        restockTableView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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
