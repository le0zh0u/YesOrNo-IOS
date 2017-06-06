//
//  ViewController.swift
//  YesOrNo
//
//  Created by zhouchunjie on 2017/5/27.
//  Copyright © 2017年 leozhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var info = [
        ["林書豪","陳信安"],
        ["陳偉殷","王建民","陳金鋒","林智勝"]
    ]

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
        
        
        let fullScreenSize = UIScreen.main.bounds.size
        let myTableView = UITableView(frame: CGRect(x:0, y:100,width: fullScreenSize.width, height: fullScreenSize.height-100), style: .grouped)
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.separatorStyle = .singleLine
        myTableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
        
        myTableView.allowsSelection = true
        myTableView.allowsMultipleSelection = false
        self.view.addSubview(myTableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.accessoryType = .checkmark
            }else if indexPath.row == 1 {
                cell.accessoryType = .detailButton
            }else if indexPath.row == 2 {
                cell.accessoryType = .detailDisclosureButton
            }else if indexPath.row == 3 {
                cell.accessoryType = .disclosureIndicator
            }
        }
        if let myLabel = cell.textLabel{
            myLabel.text = "\(info[indexPath.section][indexPath.row])"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let name = info[indexPath.section][indexPath.row]
        print("選擇的是 \(name)")
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let name = info[indexPath.section][indexPath.row]
        print("按下的是 \(name) 的 detail")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section==0 ? "篮球" : "棒球"
        return title
    }
}

