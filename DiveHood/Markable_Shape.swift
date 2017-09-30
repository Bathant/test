//
//  Markable_Shape.swift
//  DiveHood
//
//  Created by starwallet on 9/22/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class Markable_Shape: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    init(frame: CGRect , BoldText : String , NormalText: String, view:UIView) {
        super.init(frame: frame)

        self.backgroundColor = Colors().gray
      
        let textlabel = UILabel(frame: CGRect(x: view.frame.width*0.025, y: 0, width: self.frame.width, height: self.frame.height))
        let boldText  = BoldText
        let attrs = [NSFontAttributeName :  UIFont(name: "OpenSans-Bold", size: 24*view.frame.width/750) ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalText = NormalText
        let attrs2 = [NSFontAttributeName : UIFont(name: "OpenSans", size: 24*view.frame.width/750)]
        
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        textlabel.attributedText = attributedString
          textlabel.textColor = .black
        self.addSubview(textlabel)
      
       
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
