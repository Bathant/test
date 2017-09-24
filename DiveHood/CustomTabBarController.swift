//
//  CustomTabBarController.swift
//  DiveHood
//
//  Created by starwallet on 9/23/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit


extension UITabBar{
    func inActiveTintColor() {
        if let items = items{
            for item in items{
                item.image =  item.image?.withRenderingMode(.alwaysOriginal)
                
                item.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: .normal)
                item.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: .selected)
                
            }
        }
    }
}
extension UIImage {
    func tintedWithLinearGradientColors(colorsArr: [CGColor?]) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
        let context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 0, y: self.size.height)
        context!.scaleBy(x: 1.0, y: -1.0)
        
        context!.setBlendMode(.normal)
        let rect = CGRect(x:0, y:0,width: self.size.width,height: self.size.height)
        
        // Create gradient
        
        let colors = colorsArr as CFArray
        let space = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: space, colors: colors, locations: [0.0 , 1.0])
        
        // Apply gradient
        
        context!.clip(to: rect, mask: self.cgImage!)
        context!.drawLinearGradient(gradient!, start: CGPoint(x:0,y:0), end: CGPoint(x:self.size.height, y: self.size.height), options: CGGradientDrawingOptions(rawValue: 0))
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return gradientImage!
    }
}
extension UIImage
{
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage
    {
      
        
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
      
        let img = image.tintedWithLinearGradientColors(colorsArr: [UIColor(red:0.05, green:0.15, blue:0.24, alpha:1.0).cgColor , Colors().gradientColor2.cgColor])
        UIGraphicsEndImageContext()
        return img
    }
}
class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.title = "LiveaboardsList"
        self.tabBar.barTintColor = UIColor(red:0.05, green:0.15, blue:0.24, alpha:0.9)
       
        setupUi()
         self.tabBar.inActiveTintColor()
        let numberOfItems = CGFloat(self.tabBar.items!.count)
        let tabBarItemSize = CGSize(width: self.tabBar.frame.width / numberOfItems, height: tabBar.frame.height + 30)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.brown, size: tabBarItemSize).resizableImage(withCapInsets: .zero)
        
    }
    
    
    
    func setupUi(){
        setbackground()
        let LiveBoards = UIViewController()
        let nav1 = UINavigationController(rootViewController: LiveBoards)
        nav1.tabBarItem.title = "Liveaboard"
        nav1.tabBarItem.image = UIImage(named: "tb-liveaboards")
        
        
        let DivingCenters = UIViewController()
        let nav2 = UINavigationController(rootViewController: DivingCenters)
        nav2.tabBarItem.title = "Diving Centers"
        nav2.tabBarItem.image = UIImage(named: "tb-diving-centers")
        
        
        let Resorts = UIViewController()
        let nav3 = UINavigationController(rootViewController: Resorts)
        nav3.tabBarItem.title = "Resorts"
        nav3.tabBarItem.image = UIImage(named: "tb-resorts")
        
        let Destination = UIViewController()
        let nav4 = UINavigationController(rootViewController: Destination)
        nav4.tabBarItem.title = "Destination"
        nav4.tabBarItem.image = UIImage(named: "tb-destinations")
        viewControllers = [nav1, nav2, nav3, nav4]
        
        
    }
    func setbackground(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "splashbg")
        self.view.insertSubview(backgroundImage, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
