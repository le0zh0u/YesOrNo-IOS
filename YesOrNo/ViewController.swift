//
//  ViewController.swift
//  YesOrNo
//
//  Created by zhouchunjie on 2017/5/27.
//  Copyright © 2017年 leozhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AboutAppDescProtocol {
    

    var tableHeaderLabel : UILabel?
    var tableView: UITableView?
    var blurView: UIVisualEffectView?
    var appDescView:AboutAppDescView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fullScreenSize = UIScreen.main.bounds.size
        
        //Header
        tableHeaderLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 80))
        tableHeaderLabel?.textColor = UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 1)
        tableHeaderLabel?.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightLight)
        tableHeaderLabel?.text = NSLocalizedString("AppName", comment: "")
        tableHeaderLabel?.textAlignment = .center
        
        tableView = UITableView(frame: CGRect(x:0, y:0,width: fullScreenSize.width, height: fullScreenSize.height), style: UITableViewStyle.grouped)
        tableView!.tableHeaderView = tableHeaderLabel
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView!.delegate = self
        tableView!.dataSource = self
        
        tableView!.separatorStyle = .singleLine
        tableView!.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
        
        tableView!.allowsSelection = true
        tableView!.allowsMultipleSelection = false
        self.view.addSubview(tableView!)
        
        let blurEffect = UIBlurEffect(style: .dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView!.frame = UIScreen.main.bounds
        blurView!.alpha = 0
        self.view.addSubview(blurView!)

        appDescView = AboutAppDescView(frame: UIScreen.main.bounds)
        appDescView!.delegate = self
        appDescView!.isHidden = true
        self.view.addSubview(appDescView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let myLabel = cell.textLabel
        cell.accessoryType = .disclosureIndicator
        if indexPath.section == 0 {
            if (myLabel != nil){
                myLabel?.text = NSLocalizedString("AboutApp", comment: "")
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                myLabel?.text = NSLocalizedString("Donate", comment: "")
            }else if indexPath.row == 1 {
                myLabel?.text = NSLocalizedString("Suggest", comment: "")
            }
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            appDescView?._display()
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, animations: {
                    self.blurView!.alpha = 0.75
                })
            }
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                
            }else if indexPath.row == 1 {
                
            }
        }
    }
    
    func hideAboutAppDesc(){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.blurView!.alpha = 0
            })
        }
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        let name = home[indexPath.section][indexPath.row]
//        print("按下的是 \(name) 的 detail")
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let title = section==0 ? "篮球" : "棒球"
//        return title
//    }
}

