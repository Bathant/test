//
//  AllExtensions.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import Foundation
import UIKit

////////////////////////////////////// UIVIEWCONTROLLER ////////////////////////////////////////////////////
extension UIViewController {
    func  setupnavigation( viewController : UIViewController , Title : String){
        
        viewController.title = Title
        let nav = viewController.navigationController!
        nav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName :UIColor.white]
        if #available(iOS 11.0, *) {
            nav.navigationBar.prefersLargeTitles = true
            nav.navigationBar.largeTitleTextAttributes = [NSForegroundColorAttributeName :UIColor.white]
            
            print("height is ??? \(nav.navigationBar.intrinsicContentSize.height)")
        } else {
            // Fallback on earlier versions
        }
        print(nav.navigationItem == nil)
        print("inside background color >>>>>>>>>>>>>>>")
        viewController.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        viewController.navigationController!.navigationBar.shadowImage = UIImage()
        viewController.navigationController!.navigationBar.isTranslucent = true
        viewController.navigationController!.navigationBar.backgroundColor = UIColor.clear
        
        viewController.navigationController?.navigationBar.tintColor = .white
    }
    func SetupStautsBar(viewx: UIView){
        let frame = UIApplication.shared.statusBarFrame
        let view1 = UIView()
        view1.backgroundColor = UIColor(red:56/255, green:44/255, blue:98/255, alpha:1.0)
        view1.frame = frame
        viewx.addSubview(view1)
        
    }
    func SetupGradient(viewx: UIView){
        
        let gradientx = CAGradientLayer()
        gradientx.colors = [UIColor(red:17/255, green:42/255, blue:76/255, alpha:1.0).cgColor,Colors().gradientColor2.cgColor]
        gradientx.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientx.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientx.locations = [0.3, 0.7]
        gradientx.frame = viewx.bounds
        viewx.layer.insertSublayer(gradientx, at: 0)
        
    }
    
    
}
//***************************************************** END OF UIVIEWCONTROLLER *****************************************************

////////////////////////////////////// Start Of String  ////////////////////////////////////////////////////
extension String {
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
    
    
}
//***************************************************** END OF String *****************************************************








