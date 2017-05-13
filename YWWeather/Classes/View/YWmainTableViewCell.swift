//
//  YWmainTableViewCell.swift
//  YWWeather
//
//  Created by Mac on 2017/5/13.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWmainTableViewCell: UITableViewCell {

    @IBOutlet var messageImageView: UIImageView!
    @IBOutlet var animationImageView: UIImageView!
    
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var weatherLabel: UILabel!
    
    @IBOutlet var tempImageView: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    @IBOutlet var windyImageView: UIImageView!
    @IBOutlet var windyLabel: UILabel!
    
    @IBOutlet var humidityImageView: UIImageView!
    @IBOutlet var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
        self.backgroundColor = UIColor.grayColor()
    }
    
    
}
