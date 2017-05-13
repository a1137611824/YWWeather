//
//  rightTableViewController.swift
//  YWWeather
//
//  Created by Mac on 2017/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class rightTableViewController: UITableViewController {

    
    let section0Title = ["提醒", "设置", "支持"]
    let section0Image = ["reminder", "setting_right" , "contact"]
    let section1Title = ["添加", "定位"]
    let section1Image = ["addcity", "city"]
    let section2Title = ["上海", "北京", "江西", "湖南", "天津"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        
    }
    
    func initUI() {
        self.view.backgroundColor = UIColor.RGB(40, g: 40, b: 40)
        
        self.tableView.rowHeight = 85
        self.tableView.separatorStyle = .None
        
        let nib = UINib(nibName: "YWRightTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "rightCell")
        
    }
    
    //MARK: -UITableViewDelegate and UITableViewDatasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 3 }
        else if section == 1 { return 2 }
        else { return 5 }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rightCell", forIndexPath: indexPath) as! YWRightTableViewCell
    
        if indexPath.section == 0 {
            cell.titleLabel.text = section0Title[indexPath.row]
            cell.iconLabel.image = UIImage(named: section0Image[indexPath.row])
            cell.deleteLabel.hidden = true
        }else if indexPath.section == 1 {
            cell.titleLabel.text = section1Title[indexPath.row]
            cell.iconLabel.image = UIImage(named: section1Image[indexPath.row])
            cell.deleteLabel.hidden = true
        }else {
            cell.titleLabel.text = section2Title[indexPath.row]
            cell.iconLabel.image = UIImage(named: section1Image[1])
            cell.deleteLabel.hidden = false
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRectMake(0, 0, SCREEN_WIDTH, 30))
        label.textAlignment = .Center
        label.text = "城市管理"
        label.backgroundColor = UIColor.blackColor()
        label.textColor = UIColor.whiteColor()
        return label
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 { return 30 }
        else { return 0 }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        return tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }



   

}
