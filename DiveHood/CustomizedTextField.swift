//
//  CustomizedTextField.swift
//  DiveHood
//
//  Created by starwallet on 9/21/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class CustomizedTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    

    }
    var leftTextMargin : CGFloat = 0.0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += leftTextMargin
        return newBounds
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += leftTextMargin
        return newBounds
    }
    convenience init(frame:CGRect , PlaceHolder:String ,view:UIView ) {
        self.init(frame: frame)
        self.placeholder = PlaceHolder
        self.attributedPlaceholder = NSAttributedString(string : self.placeholder!,
                                                        attributes: [NSForegroundColorAttributeName: UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.6)])
        self.font = UIFont(name: "OpenSans", size:view.frame.height*0.024)
        //self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .left
        self.contentVerticalAlignment = .center
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height-1, width: self.frame.width, height: 1)
        bottomLine.backgroundColor = Colors().BorderColor.cgColor
        self.borderStyle = UITextBorderStyle.none
        self.layer.addSublayer(bottomLine)
        self.leftTextMargin = 10
        self.textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
