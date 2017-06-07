//
//  AppSetting.swift
//  YesOrNo
//
//  Created by zhouchunjie on 2017/6/7.
//  Copyright © 2017年 leozhou. All rights reserved.
//

import Foundation

class AppSetting : NSObject, NSCoding{
    var rollingTime:Int?
    
    init(rollingTime:Int) {
        self.rollingTime = rollingTime
    }
    
    required init?(coder aDecoder: NSCoder) {
        rollingTime = aDecoder.decodeInteger(forKey: "rollingTime")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(rollingTime!, forKey: "rollingTime")
    }
}
