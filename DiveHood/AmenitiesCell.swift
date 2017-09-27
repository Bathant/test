//
//  AmenitiesCell.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class AmenitiesCell: UITableViewCell {
    var heightView:CGFloat!
    var WidthView:CGFloat!
    var icon : UIImageView!
    var str : String!
    var title: UILabel!
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let height = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*100/1334
            
            frame.size.height = height
            frame.size.width = super.frame.width
            super.frame = frame
            
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       setup()
        
        
        
    }
    func setup(){
        
        
        heightView = UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY
        WidthView = UIScreen.main.bounds.maxX-UIScreen.main.bounds.minX
        
         icon =  UIImageView(frame: CGRect(x: WidthView*32/1334, y: WidthView*32/1334, width: #imageLiteral(resourceName: "Amenity-6").size.width , height: #imageLiteral(resourceName: "Amenity-6").size.height))

        title = UILabel()
        title.font = UIFont(name: "OpenSans", size:  WidthView*22/750)
    
        title.textAlignment = .left
        title.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        
        contentView.addSubview(icon)
        contentView.addSubview(title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
