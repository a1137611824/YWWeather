//
//  mainViewController.swift
//  YWWeather
//
//  Created by Mac on 2017/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class mainViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    lazy var myTableView: UITableView = {
        var tempTableView = UITableView()
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.separatorStyle = .None
        tempTableView.rowHeight = 720
        tempTableView.showsVerticalScrollIndicator = false
        return tempTableView
    }()
    
    var header = MJRefreshNormalHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        requestData("上海")
    }
    
    func initUI() {
        let nib = UINib(nibName: "YWmainTableViewCell", bundle: nil)
        self.myTableView.registerNib(nib, forCellReuseIdentifier: "mainCell")
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        self.layoutNavigationBar(YWTool.returnDate(NSDate()), weekDay: YWTool.returnWeeksDay(NSDate()), city: "海南")
        self.requestData("海南")
        
        self.myTableView.frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height)
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(myTableView)
        
        
        self.myTableView.mj_header = header
        header.refreshingBlock = { () -> Void in
            self.layoutNavigationBar(YWTool.returnDate(NSDate()), weekDay: YWTool.returnWeeksDay(NSDate()), city: "长沙")
            self.requestData("长沙")
        }
        
  
    }
    
    //MARK: -UITableViewDelegate and UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mainCell", forIndexPath: indexPath) as! YWmainTableViewCell
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        return tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func layoutNavigationBar(date: String, weekDay: String, city: String) {
        let categortBarItem = UIBarButtonItem(image: UIImage(named: "category_hover"), style: .Plain, target: self, action: #selector(mainViewController.leftBarItemClick))
        let dateBarItem = UIBarButtonItem(title: date + " " + weekDay, style: .Plain, target: self, action: #selector(mainViewController.leftBarItemClick))
        self.navigationItem.leftBarButtonItems = [categortBarItem, dateBarItem]
        let setBarItem = UIBarButtonItem(image: UIImage(named: "settings_hover"), style: .Plain, target: self, action: #selector(mainViewController.rightBarItemClick))
        let cityBarItem = UIBarButtonItem(title: city, style: .Plain, target: self, action: #selector(mainViewController.rightBarItemClick))
        let shareBarItem = UIBarButtonItem(image: UIImage(named: "share_small_hover"), style: .Plain, target: self, action: #selector(mainViewController.rightBarItemClick))
        self.navigationItem.rightBarButtonItems = [setBarItem, cityBarItem, shareBarItem]

    }
    
    //MARK: -UIBarBuuttonItemClick
    func leftBarItemClick() {
        
    }
    
    func rightBarItemClick() {
        
    }
    
    
    func requestData(cityName: String) {
        let session = NSURLSession.sharedSession()
        //请求当天天气信息
        let urlString1 = "http://api.k780.com:88/?app=weather.today&weaid=\(cityName)&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let url1 = NSURL(string: urlString1!)
        let request1 = NSURLRequest(URL: url1!)
        let task1 = session.dataTaskWithRequest(request1) { (data, reponse, error) in
            if error == nil {
                let dic = try? NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                let cur_weather_info = dic!["result"] as! NSDictionary
                dispatch_async(dispatch_get_main_queue(), {
                    let cur_weather_msg = cur_weather_info["weather"] as! String
                    self.view.backgroundColor = UIColor.colorWithWeatherType(cur_weather_msg)
                    self.myTableView.backgroundColor = UIColor.colorWithWeatherType(cur_weather_msg)
                    self.navigationController?.navigationBar.backgroundColor = UIColor.colorWithWeatherType(cur_weather_msg)
//                    let indexPah = NSIndexPath()
//                    let cell = self.myTableView.cellForRowAtIndexPath(indexPah)
//                    cell?.backgroundColor = UIColor.colorWithWeatherType(cur_weather_msg)
                    self.header.endRefreshing()
                    self.myTableView.reloadData()
                    
                })
            }
        }
        task1.resume()
        
        //请求七天内天气信息
        let urlString2 = "http://api.k780.com:88/?app=weather.future&weaid=\(cityName)&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let url2 = NSURL(string: urlString2!)
        let request2 = NSURLRequest(URL: url2!)
        let task2 = session.dataTaskWithRequest(request2) { (data, reponse, error) in
            let dic = try? NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
            let array = dic!["result"] as! NSArray
            
            dispatch_async(dispatch_get_main_queue(), {
                
                NSNotificationCenter.defaultCenter().postNotificationName(leftControllerChangeNotification, object: nil, userInfo: ["data": array])
            })
        }
        task2.resume()
        
    }
    
    


}
