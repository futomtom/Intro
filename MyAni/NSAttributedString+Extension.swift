//
//  NSAttributedString+Extension.swift
//  FlyGo
//
//  Created by 范舟弛 on 2016/12/13.
//  Copyright © 2016年 舟弛 范. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    convenience init(string:String, font:UIFont, textColor:UIColor) {
        self.init(string: string,
                  attributes: [NSFontAttributeName:font,
                               NSForegroundColorAttributeName:textColor])
    }
    
    convenience init(imageNamed:String) {
        guard let image = UIImage(named: imageNamed) else {
            
            self.init()
            
            return
        }
        
        let attach = NSTextAttachment()
        
        attach.image = image
        
        self.init(attachment: attach)
    }
    
    convenience init(string:String, font:UIFont, textColor:UIColor, lineSpace:CGFloat, alignment:NSTextAlignment = .left) {
        
        let ps = NSMutableParagraphStyle()
        
        ps.lineSpacing = lineSpace
        ps.alignment = alignment
        
        self.init(string: string,
                  attributes: [NSParagraphStyleAttributeName:ps,
                               NSFontAttributeName:font,
                               NSForegroundColorAttributeName:textColor])
    }
    
    convenience init(withUnderLine string:String, font:UIFont, textColor:UIColor) {
        self.init(string: string,
                  attributes: [NSFontAttributeName:font,
                               NSForegroundColorAttributeName:textColor,
                               NSUnderlineStyleAttributeName:NSNumber(integerLiteral: NSUnderlineStyle.styleSingle.rawValue)])
    }
}
