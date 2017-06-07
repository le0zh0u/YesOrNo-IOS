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

    var yesLabel:UILabel?
    var startButton:UIButton?
    var noLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        let fullScreenSize = UIScreen.main.bounds.size
        //sub view 1
        yesLabel = UILabel(frame: CGRect(x:0, y:0,width:fullScreenSize.width/3, height: 50))
        yesLabel?.backgroundColor = UIColor.lightGray
        yesLabel?.text = NSLocalizedString("YesLabel", comment: "")
        yesLabel?.font = UIFont(name: "Helvetica-Light", size: 20)
        yesLabel?.textAlignment = NSTextAlignment.center
        self.view.addSubview(yesLabel!)
        
        startButton = UIButton(
            frame: CGRect(x: fullScreenSize.width/3, y: 0, width: fullScreenSize.width/3, height: 50))
        startButton?.setTitle(NSLocalizedString("StartButtonText", comment: ""), for: .normal)
        startButton?.backgroundColor = UIColor.gray
        startButton?.addTarget(self, action: #selector(TodayViewController.clickStartButton), for: .touchUpInside)
        self.view.addSubview(startButton!)
        
        noLabel = UILabel(frame: CGRect(x:fullScreenSize.width*2/3, y:0,width:fullScreenSize.width/3, height: 50))
        noLabel?.backgroundColor = UIColor.lightGray
        noLabel?.text = NSLocalizedString("NoLabel", comment: "")
        noLabel?.font = UIFont(name: "Helvetica-Light", size: 20)
        noLabel?.textAlignment = NSTextAlignment.center
        self.view.addSubview(noLabel!)
        
        //sub view 2
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clickStartButton(){
        let randomNum = drand48()
        self.yesLabel?.backgroundColor = UIColor.lightGray
        self.noLabel?.backgroundColor = UIColor.lightGray
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            if randomNum>0.5{
                self.yesLabel?.backgroundColor = UIColor.darkGray
            }else{
                self.noLabel?.backgroundColor = UIColor.darkGray
            }
            self.startButton?.setTitle(NSLocalizedString("StartButtonText", comment: ""), for: .normal)
            self.startButton?.isEnabled = true
        }
        startButton?.isEnabled = false
        startButton?.setTitle(NSLocalizedString("StartButtonTextRolling", comment: ""), for: .disabled)
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
