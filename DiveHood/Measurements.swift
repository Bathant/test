//
//  Measurements.swift
//  DiveHood
//
//  Created by starwallet on 9/22/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import Foundation
import UIKit

class Measurements{

    let WIDTH_16:CGFloat = 32/750
let HEIGHT_16:CGFloat = 32/1334
let WIDTH_32:CGFloat  = 64/750
let HEIGHT_32:CGFloat = 64/1334
let ratio = UIScreen.main.scale
// Images size 
    
  /*  func resizeImage(imge : UIImage )->CGSize{
       
        
        let size = CGSize(width: imge.size.width, height: imge.size.height)
        print("resize image ")
        print(ratio)
        print(size)
        
        return size
        
    
    }*/
    
    func resizeFont(_ size : CGFloat ) ->CGFloat{
        let fontsize  = size * ratio
        return size
    }


}
