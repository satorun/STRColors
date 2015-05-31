//
//  UIColor+STRExtension.swift
//  STRColors
//
//  Created by satorun on 2015/05/31.
//  Copyright (c) 2015年 satorun. All rights reserved.
//

import UIKit

extension UIColor {
    func stringColor () -> String {
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        var alpha:CGFloat = 0
        self.getRed(&red, green:&green , blue: &blue, alpha: &alpha)
        
        return String(format: "%d,%d,%d", Int(red*255), Int(green*255), Int(blue*255))
    }
}
