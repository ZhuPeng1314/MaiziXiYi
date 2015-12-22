//
//  RegisterViewController.swift
//  MaiziXiYi
//
//  Created by 鹏 朱 on 15/12/16.
//  Copyright © 2015年 鹏 朱. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var phoneNumberField: UITextField!
    @IBOutlet var identifyingCodeField: UITextField!
    
    @IBOutlet var getIdCodeButton: ZPCountdownButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        phoneNumberField.layer.borderColor = UIColor.fieldBorderColor().CGColor
        phoneNumberField.layer.borderWidth = 1.0
        
        identifyingCodeField.layer.borderColor = UIColor.fieldBorderColor().CGColor
        identifyingCodeField.layer.borderWidth = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }

    
    @IBAction func getIdentifyingCodeButtonPressed(sender: ZPCountdownButton) {
        
        if (phoneNumberField.text! as NSString).isPhoneNumber() == false
        {
            UIAlertController.simpleAlert("提示", message: "手机号码有误", superVC: self)
            return
        }
        
        sender.startCountdown(60, stringAfterDone: "重新发送", validColor: UIColor.themeColor(), invalidColor: UIColor.fieldBorderColor())
    }
    
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        self.phoneNumberField.resignFirstResponder()
        self.identifyingCodeField.resignFirstResponder()
        
       // if (phoneNumberField.text! as NSString).isPhoneNumber() == true
         //   && identifyingCodeField.text == "123"
       // {
            //登录成功
            MainViewController.pushMainVC(self.navigationController!)
       // }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
