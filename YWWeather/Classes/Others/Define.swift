//
//  Define.swift
//  YWWeather
//
//  Created by Mac on 2017/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import Foundation


//MARK: -NSNotification
var leftControllerChangeNotification = "leftControllerChangeNotification"


//MARK: - 常用变量
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

//MARK: -enum
enum WeekDays:String {
    case Monday = "周一"
    case Tuesday = "周二"
    case Wednesday = "周三"
    case Thursday = "周四"
    case Friday = "周五"
    case Saturday = "周六"
    case Sunday = "周日"
}
