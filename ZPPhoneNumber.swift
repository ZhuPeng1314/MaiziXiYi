//
//  ZPPhoneNumber.swift
//  验证是否为有效的手机号码
//
//  Created by 鹏 朱 on 15/12/17.
//  Copyright © 2015年 鹏 朱. All rights reserved.
//

import UIKit

extension NSString {
    
    func isPhoneNumber()->Bool
    {
        if self.length < 11
        {
            return false
        }
        
        //移动号段正则表达式
        let CM_NUM = "^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$"
        //联通号段正则表达式
        let CU_NUM = "^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$"
        //电信号段正则表达式
        let CT_NUM = "^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$"
        
        let pred1 = NSPredicate(format: "SELF MATCHES %@", CM_NUM)
        let isCM = pred1.evaluateWithObject(self)
        
        let pred2 = NSPredicate(format: "SELF MATCHES %@", CU_NUM)
        let isCU = pred2.evaluateWithObject(self)
        
        let pred3 = NSPredicate(format: "SELF MATCHES %@", CT_NUM)
        let isCT = pred3.evaluateWithObject(self)
        
        if (isCM || isCU || isCT)
        {
            return true
        }
        return false
    }

}
