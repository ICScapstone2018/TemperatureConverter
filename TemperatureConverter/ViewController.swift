//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by  Kerensa E Mattison on 2018-01-26.
//  Copyright © 2018  Kerensa E Mattison. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var tempField: UITextField!
    @IBOutlet weak var tempResult: UILabel!
    
    // MARK: Delegate Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tempField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tempField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Actions
    // Converts Celsius to Farenheit, prints N/A if not a number
    @IBAction func toF(_ sender: Any) {
        if let temp = Double(self.tempField.text!) {
    self.tempResult.text = String(temp * 9.0/5.0 + 32.0)
        }
        else {
            print("N/A: Not a valid number")
            self.tempResult.text = String("N/A")
            
        }
    }
    // Converts Farenheit to Celsius, prints N/A if not a number
    @IBAction func toC(_ sender: Any) {
        if let temp = Double(self.tempField.text!) {
            self.tempResult.text = String((temp - 32.0) * 5.0/9.0)
        }
        else {
            print("N/A: Not a valid number")
            self.tempResult.text = String("N/A")
                 }
    }
}

