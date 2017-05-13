//
//  leftTableViewController.swift
//  YWWeather
//
//  Created by Mac on 2017/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class leftTableViewController: UITableViewController {

    var dataSource = [YWWeatherInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(leftTableViewController.refreshData(_:)), name: leftControllerChangeNotification, object: nil)
    }
    
    func refreshData(sender: NSNotification) {
        let info = sender.userInfo!["data"] as! NSArray
        if info.count > 0 {
            self.dataSource.removeAll()
        }
        
        for element in info {
            let dic = element as! NSDictionary
            
            let weather = YWWeatherInfo(dict: dic as! [String : NSObject])
            self.dataSource.append(weather)
            self.tableView.reloadData()
        }
    }
    
    func initUI() {
        
        self.view.backgroundColor = UIColor.blackColor()
        self.tableView.rowHeight = 120
        self.tableView.separatorStyle = .None
        
        let nib = UINib(nibName: "YWleftTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "leftCell")
        
    }
    
    //MARK：UITableViewDelegate and UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("leftCell", forIndexPath: indexPath) as! YWleftTableViewCell
        
        let weatherInfo = self.dataSource[indexPath.row]
        cell.weekDayLabel.text = YWTool.returnWeeksDayWithStr(weatherInfo.week!)
        cell.dateDayLabel.text = YWTool.returnNeedDateDay(weatherInfo.days!)
        cell.weatherLabel.text = YWTool.returnWeatherType(weatherInfo.weather!)
        cell.tempLabel.text = weatherInfo.temp_low! + "~" + weatherInfo.temp_high!
        cell.bagView.backgroundColor = UIColor.colorWithWeatherType(weatherInfo.weather!)
        
        if indexPath.row == 0 { cell.weekDayLabel.text = "今天"}
        else if indexPath.row == 1 { cell.weekDayLabel.text = "明天"}
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        return tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }


}
