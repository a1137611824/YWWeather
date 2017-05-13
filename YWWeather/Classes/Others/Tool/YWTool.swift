//
//  YWTool.swift
//  YWWeather
//
//  Created by Mac on 2017/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWTool: NSObject {
    
    class func returnDate(date: NSDate) -> String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ch")
        dateFormatter.dateFormat = "MM/dd"
        return dateFormatter.stringFromDate(date)
    }

    class func returnWeeksDay(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ch")
        dateFormatter.dateFormat = "EEEE"
        let dateStr = dateFormatter.stringFromDate(date)
        switch dateStr {
        case "Monday":
            return WeekDays.Monday.rawValue
        case "Tuesday":
            return WeekDays.Tuesday.rawValue
        case "Wednesday":
            return WeekDays.Wednesday.rawValue
        case "Thursday":
            return WeekDays.Thursday.rawValue
        case "Friday":
            return WeekDays.Friday.rawValue
        case "Saturday":
            return WeekDays.Saturday.rawValue
        default:
            return WeekDays.Sunday.rawValue
        }
    }
    
    class func returnWeeksDayWithStr(str: String) -> String {
        if str == "星期一" { return WeekDays.Monday.rawValue }
        else if str == "星期二" { return WeekDays.Tuesday.rawValue }
        else if str == "星期三" { return WeekDays.Wednesday.rawValue }
        else if str == "星期四" { return WeekDays.Thursday.rawValue }
        else if str == "星期五" { return WeekDays.Friday.rawValue }
        else if str == "星期六" { return WeekDays.Saturday.rawValue }
        else { return WeekDays.Sunday.rawValue }
        
    }
    
    class func returnNeedDateDay(date: String) -> String{
        let dateFormatter1 = NSDateFormatter()
        dateFormatter1.locale = NSLocale(localeIdentifier: "ch")
        dateFormatter1.dateFormat = "YYYY-MM-dd"
        let dateStr1 = dateFormatter1.dateFromString(date)
        let dateFormatter2 = NSDateFormatter()
        dateFormatter2.locale = NSLocale(localeIdentifier: "ch")
        dateFormatter2.dateFormat = "MM/dd"
        return dateFormatter2.stringFromDate(dateStr1!)
        
    }
    
    class func returnWeatherType(weatherType: String) -> String{
        let filePath = NSBundle.mainBundle().pathForResource("weatherBG.plist", ofType: nil)!
        let json = NSDictionary(contentsOfFile: filePath)
        
        for element in (json?.allKeys)! {
            if weatherType.hasPrefix(element as! String) {
                
                return element as! String
            }
        }
        
        return weatherType

    }
    
    
}
