

import Foundation
import UIKit

class ViewFactory {
    static func view(color:UIColor) -> UIView {
        let view = UIView()
        
        view.backgroundColor = color
        
        return view
    }
    
  
    
    static func label(font:UIFont,
                      textColor:UIColor,
                      backgroudColor:UIColor? = .white) -> UILabel {
        let label = UILabel()
        
        label.font = font
        label.textColor = textColor
        label.backgroundColor = backgroudColor
        
        return label
    }
    
    static func label(backgroudColor:UIColor? = .white) -> UILabel {
        let label = UILabel()
        label.backgroundColor = backgroudColor
        
        return label
    }
    

}



// MARK: - Genaral Buttons
extension ViewFactory {
    
    static func button(imageNamed:String) -> UIButton {
        let button = UIButton(type: .custom)
        
        button.setImage(UIImage(named:imageNamed),
                        for: .normal)
        button.sizeToFit()
        
        return button
    }
    
    static func serverButton() -> UIButton {
        let serverButton = UIButton(type: .custom)
        
        serverButton.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        serverButton.setImage(UIImage(named:"icon_contact_customer_service"),
                              for: .normal)
        serverButton.setTitle("联系客服",
                              for: .normal)
      
        serverButton.titleLabel?.font = .systemFont(ofSize: 10)
        
        serverButton.titleEdgeInsets = UIEdgeInsetsMake(26, 0, 0, 20)
        serverButton.imageEdgeInsets = UIEdgeInsetsMake(0, 36, 15, 0)
       
        
        return serverButton
    }
    
    static func redButton(title:String) -> UIButton {
        let redButton = UIButton(type: .custom)
        
        redButton.setTitle(title,
                           for: .normal)
        
        redButton.setTitleColor(UIColor.white,
                                for: .normal)
        
        redButton.setBackgroundColor(UIColor.red.withAlphaComponent(0.95),
                                     forState: .normal)
        redButton.setBackgroundColor(UIColor.red.withAlphaComponent(0.95),
                                     forState: .highlighted)
        
        redButton.titleLabel?.font = .systemFont(ofSize: 15)
        
        return redButton
    }
    
    static func grayButton(title:String) -> UIButton {
        let grayButton = UIButton(type: .custom)
        
        grayButton.setTitle(title,
                           for: .normal)
        
        grayButton.setTitleColor(UIColor.white,
                                for: .normal)
        
        grayButton.setBackgroundColor(UIColor.gray.withAlphaComponent(0.95),
                                     forState: .normal)
        
        grayButton.titleLabel?.font = .systemFont(ofSize: 15)
        
        return grayButton
    }
    
  }



