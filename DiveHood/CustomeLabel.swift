//
//  CustomeLabel.swift
//  DiveHood
//
//  Created by starwallet on 9/22/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class CustomeLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    init(frame: CGRect , text : String  , adjustTofit : Bool , size : CGFloat , fontName :String ) {
        super.init(frame: frame)
        
        self.text = text
        self.adjustsFontSizeToFitWidth = adjustTofit
        self.textColor = .white
        self.font = UIFont(name: fontName, size: size)
        self.numberOfLines = 1
        self.textAlignment = .center
        self.baselineAdjustment = .alignCenters

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
