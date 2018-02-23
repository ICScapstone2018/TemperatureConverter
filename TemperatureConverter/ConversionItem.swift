//
//  ConversionItem.swift
//  TemperatureConverter
//
//  Created by  Kerensa E Mattison on 2018-02-23.
//  Copyright © 2018  Kerensa E Mattison. All rights reserved.
//

import UIKit
class ConversionItem: NSObject {
    var convertLabel: UILabel
    var leftButton: UIButton
    var rightButton: UIButton
    
    var closureConvertLeft: (String) -> Double
    var closureConvertRight: (String) -> Double
    
    init(convertLabel: UILabel, leftButton: UIButton, rightButton: UIButton, closureConvertLeft: @escaping (String) -> Double, closureConvertRight: @escaping (String) -> Double) {
        self.convertLabel = convertLabel
        self.leftButton = leftButton
        self.rightButton = rightButton
        self.closureConvertLeft = closureConvertLeft
        self.closureConvertRight = closureConvertRight
    }
}
