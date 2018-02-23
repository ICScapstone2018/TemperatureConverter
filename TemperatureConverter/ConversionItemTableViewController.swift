//
//  ConversionItemTableViewController.swift
//  TemperatureConverter
//
//  Created by  Kerensa E Mattison on 2018-02-22.
//  Copyright © 2018  Kerensa E Mattison. All rights reserved.
//

import UIKit

class ConversionItemTableViewController: UITableViewController {

    var items = [ConversionItem]()
    let cellIdentifier = "ConversionItemTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ShowItem" {
            guard let detailViewController = segue.destination as? ViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
            guard let selectedTableViewCell = sender as? ConversionItemTableViewCell else {
                fatalError("Unexpected destination \(String(describing: sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedTableViewCell) else {
                fatalError("Unexpected index path for \(selectedTableViewCell)")
            }
            detailViewController.item = items[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConversionItemTableViewCell else {
            fatalError("Selected cell is not of type \(cellIdentifier)")
        }
        
        let item = items[indexPath.row]
        cell.Label.text = item.convertLabel
        
        return cell
    }
    
    func loadConversionItem() {
        let area = ConversionItem(convertLabel: "Area Converter",
                                  leftButton: "ac > ha",
                                  rightButton: "ha > ac",
                                  closureConvertLeft: {(value: Double) -> Double? in return (value < 0) ? nil : value * 0.404686},
                                  closureConvertRight: {(value: Double) -> Double?  in return (value < 0) ? nil : value * 2.47105})
        
        let length = ConversionItem(convertLabel: "Length Converter",
                                  leftButton: "ft > m",
                                  rightButton: "m > ft",
                                  closureConvertLeft: {(value: Double) -> Double? in return (value < 0) ? nil : value * 0.3048},
                                  closureConvertRight: {(value: Double) -> Double?  in return (value < 0) ? nil : value * 3.28084})
        
        let temperature = ConversionItem(convertLabel: "Temperature Converter",
                                    leftButton: "°C>°F",
                                    rightButton: "°F>°C",
                                    closureConvertLeft: {(value: Double) -> Double? in return (value < 0) ? nil : (value * 9.0/5.0 + 32.0)},
                                    closureConvertRight: {(value: Double) -> Double? in return (value < 0) ? nil : ((value - 32.0) * 5.0/9.0)})
        
        let weight = ConversionItem(convertLabel: "Weight Converter",
                                    leftButton: "lbs > kgs",
                                    rightButton: "kgs > lbs",
                                    closureConvertLeft: {(value: Double) -> Double? in return (value < 0) ? nil : value * 0.453592},
                                    closureConvertRight: {(value: Double) -> Double?  in return (value < 0) ? nil : value * 2.20462})
        
       //etc
        items += [area, length, temperature, weight]//etc
        
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
