//
//  ColorModel.swift
//  STRColors
//
//  Created by satorun on 2015/05/31.
//  Copyright (c) 2015年 satorun. All rights reserved.
//

import UIKit

class STRColorModel: NSObject {
    
    private var colors:[UIColor] = []
    
    class var sharedInstance : STRColorModel {
        struct Static {
            static let instance : STRColorModel = STRColorModel()
        }
        return Static.instance
    }
    
    enum InputType {
        case Rgb
        //case Hex
        case Unknown
        
        func color(input: [AnyObject]) -> UIColor {
            switch(self) {
            case .Rgb:
                
                var rgb = [CGFloat]()
                for any in input {
                    if let str = any as? String,
                        intVal = str.toInt() {
                        rgb.append(CGFloat(intVal)/255)
                    }
                }
                return UIColor(red: rgb[0], green: rgb[1], blue: rgb[2], alpha: 1.0)
            case .Unknown:
                return STRColorModel.randomColor()
            }
        }
    }
    
    
    class func random256 () -> Int {
        return Int(arc4random_uniform(256))
    }
    
    class func randomColor () -> UIColor {
        return UIColor(
            red: CGFloat(random256())/255.0,
            green: CGFloat(random256())/255.0,
            blue: CGFloat(random256())/255.0, alpha: 1.0)
    }
    
    class func validate(input: [AnyObject]) -> InputType {
        if input.count != 3 {
            return InputType.Unknown
        }
        
        for any in input {
            if let str = any as? String, intVal = str.toInt() {
                if intVal < 0 || 255 < intVal {
                    return InputType.Unknown
                }
            } else {
                return InputType.Unknown
            }
        }
        return InputType.Rgb
    }
    
    class func color(inputString: NSString) -> UIColor {
        let inputArr = inputString.componentsSeparatedByString(",")
        let type = STRColorModel.validate(inputArr)
        
        
        return type.color(inputArr)
    }
    
    func insert(input: String, index: Int, completion: () -> ()) {
        colors.insert(STRColorModel.color(input), atIndex: index)
        completion()
    }
    
    func remove(index: Int, completion: () -> ()) {
        colors.removeAtIndex(index)
        completion()
    }
    
    func color(index: Int) -> UIColor {
        return colors[index]
    }
    
    func count() -> Int {
        return colors.count
    }
}
