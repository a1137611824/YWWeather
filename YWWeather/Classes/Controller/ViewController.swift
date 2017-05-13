//
//  ViewController.swift
//  YWWeather
//
//  Created by Mac on 2017/5/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    var mainController: UIViewController?
    var leftController: leftTableViewController?
    var rightController: rightTableViewController?
    
    //滑动速率
    var speed_f: CGFloat = 0.5
    
    //判断view所在位置
    var condition_f: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    
    func initUI() {
        
        self.leftController = leftTableViewController()
        self.view.addSubview(leftController!.view)
        
        self.rightController = rightTableViewController()
        self.view.addSubview(rightController!.view)
        
        let vc = mainViewController()
        self.mainController = UINavigationController(rootViewController: vc)
        self.view.addSubview((self.mainController?.view)!)
        
        self.leftController?.view.hidden = true
        self.rightController?.view.hidden = true
        
        //添加滑动手势
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panAction(_:)))
        self.mainController?.view.addGestureRecognizer(pan)
        
    }
    
    func panAction(sender: UIPanGestureRecognizer) {
        
        
        //获取手指的位置
        let point = sender.translationInView(sender.view)
        
        self.condition_f = point.x * self.speed_f + self.condition_f
        
        if sender.view?.frame.origin.x >= 0 {
            sender.view?.center = CGPointMake((sender.view?.center.x)! + point.x * self.speed_f , (sender.view?.center.y)!)
            //让手指位置归位
            sender.setTranslation(CGPointMake(0, 0), inView: self.view)
            self.leftController?.view.hidden = false
            self.rightController?.view.hidden = true
        }else{
            sender.view?.center = CGPointMake((sender.view?.center.x)! + point.x * self.speed_f , (sender.view?.center.y)!)
            //让手指位置归位
            sender.setTranslation(CGPointMake(0, 0), inView: self.view)
            self.leftController?.view.hidden = true
            self.rightController?.view.hidden = false
        }
        
        if sender.state == .Ended {
            if self.condition_f > UIScreen.mainScreen().bounds.width/2 * self.speed_f {
                showLeftView()
            }else if self.condition_f < -UIScreen.mainScreen().bounds.width/2 * self.speed_f {
                self.showRightView()
            }else{
                self.showMainView()
            }
        }

    }
    
    func showLeftView() {
        UIView.beginAnimations(nil, context: nil)
        self.mainController?.view.center = CGPointMake(SCREEN_WIDTH*CGFloat(1.5) - 120, SCREEN_HEIGHT/2)
        
        UIView.commitAnimations()
    }
    
    func showRightView() {
        UIView.beginAnimations(nil, context: nil)
        self.mainController?.view.center = CGPointMake(120 - SCREEN_WIDTH/2 , SCREEN_HEIGHT/2)
        
        UIView.commitAnimations()
    }
    
    func showMainView() {
        UIView.beginAnimations(nil, context: nil)
        self.mainController?.view.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)

        UIView.commitAnimations()
        
    }
    
    //隐藏状态栏
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    


}

