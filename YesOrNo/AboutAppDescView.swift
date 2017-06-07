//
//  AboutAppDescView.swift
//  YesOrNo
//
//  Created by zhouchunjie on 2017/6/7.
//  Copyright © 2017年 leozhou. All rights reserved.
//

import UIKit

protocol AboutAppDescProtocol {
    func hideAboutAppDesc()
}

class AboutAppDescView: UIView{
    
    var backView:UIView?
    var delegate: AboutAppDescProtocol?
    var appNameLabel: UILabel?
    var appDescLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let fullScreenSize = UIScreen.main.bounds.size
        backView = UIView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height))
        backView!.backgroundColor = UIColor(white: 0, alpha: 0.6)
        backView!.alpha = 0
        backView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self._hideAboutAppDesc)))
        self.addSubview(backView!)
        
        appNameLabel = UILabel(frame: CGRect(x: 0, y: 60, width: fullScreenSize.width, height: 80))
        appNameLabel!.text = NSLocalizedString("AppName", comment: "")
        appNameLabel!.textAlignment = .center
        appNameLabel!.textColor = UIColor.white
        appNameLabel!.alpha = 0
        appNameLabel!.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightLight)
        self.addSubview(appNameLabel!)
        
        appDescLabel = UILabel(frame: CGRect(x: 30, y: 140, width: fullScreenSize.width-60, height: 160))
        appDescLabel!.text = NSLocalizedString("AboutAppDesc", comment: "")
        appDescLabel!.textAlignment = .center
        appDescLabel!.textColor = UIColor.white
        appDescLabel!.alpha = 0
        appDescLabel!.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightLight)
        appDescLabel?.numberOfLines = 5
        self.addSubview(appDescLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _display() {
        self.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.backView!.alpha = 1
            self.appNameLabel!.alpha = 1
            self.appDescLabel!.alpha = 1
        }
    }
    
    func _hideAboutAppDesc(){
        _hide()
        delegate?.hideAboutAppDesc()
    }
    
    func _hide(){
        UIView.animate(withDuration: 0.3, animations: {
            self.backView!.alpha = 0
            self.appNameLabel!.alpha = 0
            self.appDescLabel!.alpha = 0
        }) { (finished: Bool) in
            self.isHidden = true
        }
    }
}
