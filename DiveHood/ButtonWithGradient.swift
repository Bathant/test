//
//  selfWithGradient.swift
//  DiveHood
//
//  Created by starwallet on 9/21/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class ButtonWithGradient: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(frame: CGRect, title: String, view: UIView) {
        super.init(frame: frame)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: view.frame.height*0.025)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.baselineAdjustment = .alignCenters
        self.titleLabel?.textColor = .white
        let gradientx = CAGradientLayer()
        gradientx.colors = [Colors().gradientColor1.cgColor,Colors().gradientColor2.cgColor]
        
        
        gradientx.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientx.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientx.frame = self.bounds
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        
        
        self.layer.insertSublayer(gradientx, at: 0)
        
        
        
    }
    
    
    
    func buttonWithBottomBorder (title : String, view: UIView){
    
        
        
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.height-1, width: self.frame.width, height: 1)
        bottomLine.backgroundColor = Colors().BorderColor.cgColor
        self.layer.addSublayer(bottomLine)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "OpenSans", size: view.frame.height*0.017)
        self.titleLabel?.textAlignment = .left
        

        self.backgroundColor = UIColor.clear
    
    
    
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}
