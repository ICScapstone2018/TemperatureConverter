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
    
    
    @IBOutlet weak var LeftButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    
    
    @IBAction func LeftButtonClick(_ sender: Any) {
    }
    
    @IBAction func RightButtonClick(_ sender: Any) {
    }
  
    //input fields: value field and a result field
    
    var item: ConversionItem?
    
    // MARK: Delegate Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tempField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

