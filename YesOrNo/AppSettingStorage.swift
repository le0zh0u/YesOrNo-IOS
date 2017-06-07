//
//  AppSettingStorage.swift
//  YesOrNo
//
//  Created by zhouchunjie on 2017/6/7.
//  Copyright © 2017年 leozhou. All rights reserved.
//

import Foundation
let appGroupId = "group.com.leozhou.YesOrNo"
let userDefaultsAppSetting = "UserDefaultsAppSetting"
var globalAppSetting: AppSetting?

func saveRollingTime(rollingTime:Int){
//    let filePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/appSetting.dat"
//    
//    NSKeyedArchiver.archiveRootObject(appSetting, toFile: filePath)
    
    if globalAppSetting == nil {
        return
    }
    
    let sharedUserDefaults: UserDefaults = UserDefaults(suiteName: appGroupId)!
    
    NSKeyedArchiver.setClassName("AppSetting", for: AppSetting.self)
    let tempAppSetting = NSKeyedArchiver.archivedData(withRootObject: globalAppSetting!)
    
    sharedUserDefaults.setValue(tempAppSetting, forKey: userDefaultsAppSetting)
    sharedUserDefaults.synchronize()
}

func readRollingTime() -> Int{
    if globalAppSetting != nil {
        return globalAppSetting!.rollingTime!
    }
    let sharedUserDefaults: UserDefaults = UserDefaults(suiteName: appGroupId)!
    let tempAppSetting: Data? = sharedUserDefaults.object(forKey: userDefaultsAppSetting) as? Data
    if tempAppSetting != nil {
        NSKeyedUnarchiver.setClass(AppSetting.self, forClassName: "AppSetting")
        let appSetting = NSKeyedUnarchiver.unarchiveObject(with: tempAppSetting!) as! AppSetting
        globalAppSetting = appSetting
        return (globalAppSetting?.rollingTime)!
    } else {
        return 0
    }
}
