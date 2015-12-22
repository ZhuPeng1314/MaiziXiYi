//
//  ZPCountdownButton.swift
//  使按钮带有倒计时功能
//
//  Created by 鹏 朱 on 15/12/17.
//  Copyright © 2015年 鹏 朱. All rights reserved.
//

import UIKit

class ZPCountdownButton: UIButton {

    var stringAfterDone:String! //倒计时结束后显示的文本
    var countdown:Int = 0
    var validColor:UIColor!

    //开始倒计时，countdownMax：倒计时的总时长，stringAfterDone:倒计时结束后显示的文本, validColor:倒计时结束后显示的按钮背景颜色, invalidColor:倒计时进行中的按钮背景颜色，并且倒计时进行中，按钮为不可用状态
    func startCountdown(countdownMax:Int, stringAfterDone:String, validColor:UIColor, invalidColor:UIColor)
    {
        self.countdown = countdownMax
        self.stringAfterDone = stringAfterDone
        self.validColor = validColor
        
        self.backgroundColor = invalidColor
        self.userInteractionEnabled = false
        self.setTitle("\(countdown) 秒", forState: UIControlState.Normal)
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "changeCountdownButton:", userInfo: nil, repeats: true)
    }
    
    func changeCountdownButton(theTimer:NSTimer)
    {
        if self.countdown == 0
        {
            self.backgroundColor = validColor
            self.userInteractionEnabled = true
            self.setTitle(stringAfterDone, forState: UIControlState.Normal)
            theTimer.invalidate()
        }else
        {
            (countdown)--
            self.setTitle("\(countdown) 秒", forState: UIControlState.Normal)
        }
        
    }

}
