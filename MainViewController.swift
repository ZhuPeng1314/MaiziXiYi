//
//  MainViewController.swift
//  MaiziXiYi
//
//  Created by 鹏 朱 on 15/12/18.
//  Copyright © 2015年 鹏 朱. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    static func pushMainVC(navigationController:UINavigationController)
    {
        let mainSB = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = mainSB.instantiateViewControllerWithIdentifier("mainVC") as! ZPScrollTabBarViewController
        
        /*let VC1 = mainSB.instantiateViewControllerWithIdentifier("VCtemp")
        
        let VC2 = mainSB.instantiateViewControllerWithIdentifier("VCtemp")
        
        mainVC.viewControllers = [VC1,VC2]*/
        
        navigationController.pushViewController(mainVC, animated: true)
    }

}
