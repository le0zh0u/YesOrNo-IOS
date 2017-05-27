//
//  ViewController.swift
//  YesOrNo
//
//  Created by zhouchunjie on 2017/5/27.
//  Copyright © 2017年 leozhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableHeaderLabel : UILabel?
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Header
        tableHeaderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 80))
        tableHeaderLabel?.textColor = UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 1)
        tableHeaderLabel?.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightLight)
        tableHeaderLabel?.text = NSLocalizedString("AppName", comment: "")
        tableHeaderLabel?.textAlignment = .center
        self.view.addSubview(tableHeaderLabel!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

