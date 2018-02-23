//
//  ConversionItem.swift
//  TemperatureConverter
//
//  Created by  Kerensa E Mattison on 2018-02-23.
//  Copyright © 2018  Kerensa E Mattison. All rights reserved.
//

import UIKit
class ConversionItem: NSObject {
    var convertLabel: String
    var leftButton: String
    var rightButton: String
    
    var closureConvertLeft: (Double) -> Double?
    var closureConvertRight: (Double) -> Double?
    
    init(convertLabel: UILabel, leftButton: UIButton, rightButton: UIButton, closureConvertLeft: @escaping (Double) -> Double?, closureConvertRight: @escaping (Double) -> Double?) {
        self.convertLabel = convertLabel
        self.leftButton = leftButton
        self.rightButton = rightButton
        self.closureConvertLeft = closureConvertLeft
        self.closureConvertRight = closureConvertRight
    }
}
