//
//  File.swift
//  DiveHood
//
//  Created by starwallet on 9/20/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import Foundation
import UIKit
class WallpaperWindow: UIWindow {
    
    var wallpaper: UIImage? = UIImage(named: "splashbg") {
        didSet {
            // refresh if the image changed
            setNeedsDisplay()
        }
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        //clear the background color of all table views, so we can see the background
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        // draw the wallper if set, otherwise default behaviour
        if let wallpaper = wallpaper {
            wallpaper.draw(in: self.bounds);
        } else {
            super.draw(rect)
        }
    }
}
