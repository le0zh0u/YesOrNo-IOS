//
//  TodayViewController.swift
//  TodayYesOrNo
//
//  Created by zhouchunjie on 2017/5/27.
//  Copyright © 2017年 leozhou. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    var content:UILabel?
    
    let screenWidth: CGFloat  = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        content = UILabel(frame: CGRect(x: 10, y: 19, width: screenWidth - 40, height: 48))
        content!.text = "asdfasdfasdf"
        content!.textColor = UIColor.darkText
        content!.textAlignment = NSTextAlignment.center
        self.view.addSubview(content!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
