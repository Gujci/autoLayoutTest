//
//  ColorUpgrade.swift
//  AutoLayoutTest
//
//  Created by Gujgiczer Máté on 25/02/15.
//  Copyright (c) 2015 Gujgiczer Máté. All rights reserved.
//

import UIKit

public extension UIColor {
    
    class func randomColor() -> UIColor {
        var red = CGFloat(arc4random_uniform(256)) / 255
        var green = CGFloat(arc4random_uniform(256)) / 255
        var blue = CGFloat(arc4random_uniform(256)) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}