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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        items += [area, length, temperature, weight]
    }
}
