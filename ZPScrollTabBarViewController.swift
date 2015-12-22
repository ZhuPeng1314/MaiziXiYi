//
//  ZPScrollTabBarViewController.swift
//  包含一个可横向滚动的主区域和底部tabBar
//  横向滚动和选择tabBar都能够切换子视图
//
//  Created by 鹏 朱 on 15/12/17.
//  Copyright © 2015年 鹏 朱. All rights reserved.
//

import UIKit

class ZPScrollTabBarViewController: UIViewController,UITabBarDelegate, UIScrollViewDelegate {

    //默认tabBar在屏幕最底端，scrollView占满屏幕的其余空间（包括状态栏）
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet var scrollView: UIScrollView!
    
    var viewControllers:[UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.tabBar.items?.count < 1
        {
            return
        }
        
        self.tabBar.delegate = self
        for var i=0; i < tabBar.items!.count; i++
        {
            tabBar.items![i].tag = i //为每个tabBarItem设置tag序号，方便索引
        }
        self.tabBar.selectedItem = self.tabBar.items![0]
        
        
        if viewControllers != nil
        {
            let scrollWidth = UIScreen.mainScreen().bounds.size.width
            let scrollHeight = UIScreen.mainScreen().bounds.size.height - self.tabBar.frame.size.height
            
            self.scrollView.delegate = self
            self.scrollView.contentSize = CGSizeMake(scrollWidth * CGFloat(viewControllers.count), scrollHeight)
            self.scrollView.bounces = false
            self.scrollView.showsHorizontalScrollIndicator = false
            self.scrollView.showsVerticalScrollIndicator = false
            self.scrollView.pagingEnabled = true
            
            
            for var i=0; i < viewControllers.count; i++
            {
                let contentView = viewControllers[i].view
                //scroll与实际内容视图之间应该有一个容器视图（页面视图）来防止自动布局出错
                let pageView = UIView(frame: CGRectMake(scrollWidth * CGFloat(i), 0, scrollWidth, scrollHeight))
                contentView.frame = pageView.bounds
                //contentView.backgroundColor = i % 2==0 ? UIColor.greenColor() : UIColor.redColor()
                pageView.addSubview(contentView)
                
                scrollView.addSubview(pageView)
            }
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // 选择tabBar中的item，Scroll自动滚动到对应的内容页
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let pageNum = item.tag
        let scrollWidth = UIScreen.mainScreen().bounds.size.width
        
        if pageNum < viewControllers.count
        {
            self.scrollView.setContentOffset(CGPointMake(scrollWidth * CGFloat(pageNum), 0), animated: false)
        }
    }
    
    // 滚动停止时,tab选中对应的item
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let scrollWidth = UIScreen.mainScreen().bounds.size.width
        
        let pageNum = Int(self.scrollView.contentOffset.x / scrollWidth)
        
        self.tabBar.selectedItem = self.tabBar.items![pageNum]
    }
    

}
