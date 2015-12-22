//
//  ViewController.swift
//  MaiziXiYi
//
//  Created by 鹏 朱 on 15/12/16.
//  Copyright © 2015年 鹏 朱. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        let scrollViewWidth = UIScreen.mainScreen().bounds.width
        let scrollViewHeight = UIScreen.mainScreen().bounds.height
        let imageNames = ["0-引-1","0-引-2","0-引-3"]
        
        self.welcomeScrollView.contentSize = CGSizeMake(scrollViewWidth * CGFloat(imageNames.count), scrollViewHeight)
        
        //对引导图片进行布局
        for var i=0; i < imageNames.count; i++
        {
            let image = UIImage(named: imageNames[i])
            let imageView = UIImageView(frame:
                CGRect(x: scrollViewWidth * CGFloat(i),
                       y: 0,
                   width: scrollViewWidth,
                  height: scrollViewHeight))
            imageView.image = image
            self.welcomeScrollView.addSubview(imageView)
        }
        
        let registerButton = UIButton(type: UIButtonType.Custom)
        registerButton.frame = CGRectMake(scrollViewWidth * (CGFloat(imageNames.count) - 0.5) - 75, scrollViewHeight - 35 - 70, 150, 35)
        registerButton.setImage(UIImage(named: "0-引-3-Button"), forState: UIControlState.Normal)
        self.welcomeScrollView.addSubview(registerButton)
        registerButton.addTarget(self, action: "registerButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func registerButtonPressed()
    {
        let registerVC = self.storyboard!.instantiateViewControllerWithIdentifier("RegisterVC")
        self.navigationController?.pushViewController(registerVC, animated: true)
    }


}

