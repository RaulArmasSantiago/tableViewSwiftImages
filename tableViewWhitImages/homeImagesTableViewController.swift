//
//  homeImagesTableViewController.swift
//  tableViewWhitImages
//
//  Created by Raul Armas Santiago on 10/9/19.
//  Copyright © 2019 Sento40. All rights reserved.
//

import UIKit

var namePersonaje = [String]()
var imagePersonaje = [UIImage]()

class homeImagesTableViewController: UITableViewController {
    
    var list = ["texto1","texto2","Texto3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(namePersonaje)
        print(imagePersonaje)
        tableView.reloadData();
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return namePersonaje.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! homeImagesTableTableViewCell
        
        cell.imageOutlet.image = imagePersonaje[indexPath.row]
        cell.labelTextOutlet.text = namePersonaje[indexPath.row]
        

        // Configure the cell...
        //cell.textLabel?.text = namePersonaje[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let alertDelete = UIAlertController(title: "Warning", message: "Seguro que quiere eliminar la imagen", preferredStyle: .alert)
            
            let yesAction = UIAlertAction(title: "Si", style: .default, handler: {(UIAlertAction)-> Void in
                imagePersonaje.remove(at: indexPath.row)
                namePersonaje.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            })
            
            let noAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
            
            alertDelete.addAction(yesAction)
            alertDelete.addAction(noAction)
            present(alertDelete,animated: true, completion: nil)
        }
    }
    

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
