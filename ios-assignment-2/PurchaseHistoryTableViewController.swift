//
//  PurchaseHistoryTableViewController.swift
//  ios-assignment-2
//
//  Created by Rita-Maria Oladokun on 2025-02-26.
//

import UIKit

class PurchaseHistoryTableViewController: UITableViewController {
    
    var productManager: ProductManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productManager = ((UIApplication.shared.delegate) as! AppDelegate).myModel
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (productManager?.purchaseHistory.count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "purchaseHistoryItem", for: indexPath)
        
        if let goodPoduct = productManager?.purchaseHistory[indexPath.row] {
            cell.textLabel?.text = "\(goodPoduct.name)"
            cell.detailTextLabel?.text = "\(goodPoduct.quantity)"
            return cell
            
        } else {
            print("Error: Could not dequeue a cell with identifier 'mycell'")
            return UITableViewCell()
        }
        
        // Configure the cell...
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPurchaseDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPurchaseDetails") {
            let indexPath = tableView.indexPathForSelectedRow
            
            if let historyDetailsVC = segue.destination as? PurchaseHistoryDetailsViewController {
                historyDetailsVC.historyDetailsItem = productManager?.purchaseHistory[indexPath?.row ?? 0]
            }
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
