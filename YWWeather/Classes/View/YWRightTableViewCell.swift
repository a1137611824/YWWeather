//
//  YWRightTableViewCell.swift
//  YWWeather
//
//  Created by Mac on 2017/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWRightTableViewCell: UITableViewCell {

    
    @IBOutlet var deleteLabel: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var iconLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.RGB(40, g: 40, b: 40)
    }

   
    
}
