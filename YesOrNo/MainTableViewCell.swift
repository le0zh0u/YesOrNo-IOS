//
//  MainTableViewCell.swift
//  YesOrNo
//
//  Created by zhouchunjie on 2017/5/27.
//  Copyright © 2017年 leozhou. All rights reserved.
//

import UIKit

class MainTableViewCell : UITableViewCell{
    var backView: UIView?
    var titleLabel: UILabel?
    var detailLabel: UILabel?
    
    let screenWidth: CGFloat  = UIScreen.main.bounds.size.width
    let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backView = UIView(frame: CGRect(x: 15, y: 0, width: screenWidth - 30, height: 60))
        backView!.backgroundColor = UIColor.white
        backView!.layer.cornerRadius = 8
        backView!.layer.masksToBounds = true
        self.addSubview(backView!)
        
        titleLabel = UILabel(frame: CGRect(x: 15, y: 17, width: screenWidth - 60, height: 26))
        titleLabel!.font = UIFont.systemFont(ofSize: 24, weight: UIFontWeightLight)
        backView!.addSubview(titleLabel!)
        
        detailLabel = UILabel(frame: CGRect(x: 15, y: 24, width: screenWidth - 60, height: 17))
        detailLabel!.font = UIFont.systemFont(ofSize: 15, weight: UIFontWeightLight)
        detailLabel!.textAlignment = NSTextAlignment.right
        backView!.addSubview(detailLabel!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
