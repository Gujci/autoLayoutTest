//
//  ViewController.swift
//  AutoLayoutTest
//
//  Created by Gujgiczer Máté on 25/02/15.
//  Copyright (c) 2015 Gujgiczer Máté. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var controllView: UIView!
    
    var ListedViews: Array<UIView>!
    var isFull = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ListedViews = Array<UIView>()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rediceViewCount(sender: AnyObject) {
        if self.ListedViews.count > 0 {
            self.ListedViews.last!.removeFromSuperview()
            self.ListedViews.removeLast()
                
            for view in self.ListedViews {
                let indexOfLast = find(self.ListedViews, view)! - 1
                let indexOfNext = find(self.ListedViews, view)! + 1
                
                view.snp_removeConstraints()
                view.snp_makeConstraints{ make in
                    make.top.equalTo(self.view.snp_top).with.offset(10)
                    make.left.equalTo(indexOfLast >= 0 ? self.ListedViews[indexOfLast].snp_right : self.view.snp_left).with.offset(10)
                    make.bottom.equalTo(self.controllView.snp_top).with.offset(-10)
                    make.right.equalTo(indexOfNext < self.ListedViews.count ? self.ListedViews[indexOfNext].snp_left : self.view.snp_right).width.offset(-10)
                    if indexOfLast > 0 {
                        make.width.equalTo(self.ListedViews[indexOfLast].snp_width)
                    }
                    else if indexOfNext < self.ListedViews.count {
                        make.width.equalTo(self.ListedViews[indexOfNext].snp_width)
                    }
                }
                view.updateConstraints()
            }
            
        }
        
        self.view.layoutSubviews()
    }

    @IBAction func increaseViewCount(sender: AnyObject) {
        
        if self.ListedViews.last != nil ? self.ListedViews.last!.frame.size.width < 30 : false {
            return
        }
        
        var newView = UIView()
        newView.backgroundColor = UIColor.randomColor()
        self.view.addSubview(newView)
        newView.snp_makeConstraints{ make in
            make.top.equalTo(self.view.snp_top).with.offset(10)
            make.left.equalTo(self.ListedViews.last != nil ? self.ListedViews.last!.snp_right : self.view.snp_left).with.offset(10)
            make.bottom.equalTo(self.controllView.snp_top).with.offset(-10)
            make.right.equalTo(self.view.snp_right).with.offset(-10)
        }

        self.ListedViews.append(newView)
        
        if self.ListedViews.count > 0 {
            
            for view in self.ListedViews {
                let indexOfLast = find(self.ListedViews, view)! - 1
                let indexOfNext = find(self.ListedViews, view)! + 1
                
                view.snp_removeConstraints()
                view.snp_makeConstraints { make in
                    make.top.equalTo(self.view.snp_top).with.offset(10)
                    make.left.equalTo(indexOfLast >= 0 ? self.ListedViews[indexOfLast].snp_right : self.view.snp_left).with.offset(10)
                    make.bottom.equalTo(self.controllView.snp_top).with.offset(-10)
                    make.right.equalTo(indexOfNext < self.ListedViews.count ? self.ListedViews[indexOfNext].snp_left : self.view.snp_right).width.offset(-10)
                    make.width.equalTo(newView.snp_width)
                }

                view.updateConstraints()
            }
            
        }
    }
    

}

