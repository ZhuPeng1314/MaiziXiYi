//
//  ZPSimpleAlert.swift
//  弹出一个带有Ok按钮的简单的提示框
//
//  Created by 鹏 朱 on 15/12/17.
//  Copyright © 2015年 鹏 朱. All rights reserved.
//

import UIKit

extension UIAlertController {

    static func simpleAlert(title: String?, message: String?, superVC:UIViewController)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let OKButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: { [unowned alertController] (_) -> Void in
            alertController.dismissViewControllerAnimated(true, completion: nil)
            })
        
        alertController.addAction(OKButton)
        
        superVC.presentViewController(alertController, animated: true, completion: nil)
    }

}
