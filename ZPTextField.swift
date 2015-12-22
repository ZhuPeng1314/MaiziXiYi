//
//  ZPTextField.swift
//  本类实现了输入框中输入的字符以及placeholder向右缩进leftPadding个单位
//
//  Created by 鹏 朱 on 15/12/17.
//  Copyright © 2015年 鹏 朱. All rights reserved.
//

import UIKit

class ZPTextField: UITextField {
    
    var leftPadding:CGFloat = 5.0
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        let originalRect = super.textRectForBounds(bounds)
    
        return CGRectMake(originalRect.origin.x + leftPadding, originalRect.origin.y, originalRect.size.width - leftPadding, originalRect.size.height)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        let originalRect = super.editingRectForBounds(bounds)
        
        return CGRectMake(originalRect.origin.x + leftPadding, originalRect.origin.y, originalRect.size.width - leftPadding, originalRect.size.height)
    }

}
