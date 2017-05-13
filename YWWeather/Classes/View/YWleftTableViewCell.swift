//
//  YWleftTableViewCell.swift
//  YWWeather
//
//  Created by Mac on 2017/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWleftTableViewCell: UITableViewCell {

    @IBOutlet var weekDayLabel: UILabel!
    @IBOutlet var dateDayLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var bagView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //添加圆角属性
        bagView.layer.cornerRadius = 15
        bagView.layer.masksToBounds = true
    }

  
    
}
