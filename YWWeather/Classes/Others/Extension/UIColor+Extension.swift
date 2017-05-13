//
//  UIColor+Extension.swift
//  YWWeather
//
//  Created by Mac on 2017/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

extension UIColor {

    class func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    
    class func colorWithHexString(hex: String) -> UIColor {
        var cString = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).uppercaseString
        
        if cString.hasPrefix("#") {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if cString.characters.count != 6 {
            return UIColor.grayColor()
        }
        
        let rStr = (cString as NSString).substringToIndex(2)
        let gStr = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bStr = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        //将16进制值直接转化为10进制
        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0;
        NSScanner(string: rStr).scanHexInt(&r)
        NSScanner(string: gStr).scanHexInt(&g)
        NSScanner(string: bStr).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
        
    }
    
    class func colorWithWeatherType(weather: String) -> UIColor {
        let filePath = NSBundle.mainBundle().pathForResource("weatherBG.plist", ofType: nil)!
        let json = NSDictionary(contentsOfFile: filePath)
        
        for element in (json?.allKeys)! {
            if element as! String == weather || weather.hasPrefix(element as! String) {
                let value = json![element as! String] as! String
                return UIColor.colorWithHexString(value)
            }
        }
        
        return UIColor.grayColor()
    }


}
