//
//  CustomTabBarController.swift
//  DiveHood
//
//  Created by starwallet on 9/23/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit



class CustomTabBarController: UITabBarController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        SetTabBar()
        setNavigtionBar()
        
        
    }
    
    func setNavigtionBar(){
        
        //self.title = "Liveaboards List"
        
        var nav = self.navigationController?.navigationBar
        // nav?.titleTextAttributes = [NSForegroundColorAttributeName :UIColor.white]
        print("height from tab bar \(nav?.intrinsicContentSize.height)")
        
        
        
        
        
    }
    
    func SetTabBar(){
        
        self.tabBar.barTintColor = UIColor(red:0.05, green:0.13, blue:0.25, alpha:1.0)
        self.tabBar.alpha = 0.9
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -2.0)
        self.tabBar.inActiveTintColor()
        self.tabBar.tintColor = .white
        
        
        let numberOfItems = CGFloat(self.tabBar.items!.count)
        let tabBarItemSize = CGSize(width:10, height: tabBar.frame.height+15 )
        print(self.tabBar.frame.width)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.brown, size: tabBarItemSize).resizableImage(withCapInsets: .init())
        
        var items = self.tabBar.items
        items?[0].titlePositionAdjustment = UIOffsetMake(0.0, -10.0)
        items?[0].setTitleTextAttributes([NSFontAttributeName : UIFont(name : "OpenSans",size: 12)], for: .normal)
        items?[0].imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0)
        
        
        
        
    }
    func setupUi(){
        setbackground()
        let LiveBoards = LiveaBoardsLists()
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
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        var items = self.tabBar.items
        
        items?[self.selectedIndex].titlePositionAdjustment = UIOffsetMake(0.0, -2.0)
        items?[self.selectedIndex].setTitleTextAttributes([NSFontAttributeName : UIFont(name : "OpenSans",size: 10), NSForegroundColorAttributeName: UIColor.white], for: .normal)
        items?[self.selectedIndex].imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
        var index = items?.index(of: item)
        
        items?[index!].titlePositionAdjustment = UIOffsetMake(0.0, -10.0)
        items?[index!].setTitleTextAttributes([NSFontAttributeName : UIFont(name : "OpenSans",size: 12)], for: .normal)
        items?[index!].imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0)
        
        
        
        
    }
    
}
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
    func tintedWithLinearGradientColors(colorsArr: [CGColor?], size : CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale);
        let context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 0, y: self.size.height)
        context!.scaleBy(x: 1.0, y: -1.0)
        
        context!.setBlendMode(.normal)
        let rect = CGRect(x:0, y:0,width: self.size.width,height: self.size.height)
        
        // Create gradient
        
        let colors = colorsArr as CFArray
        let space = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: space, colors: colors, locations: nil)
        
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
        let img = image.tintedWithLinearGradientColors(colorsArr: [UIColor(red:0.05, green:0.15, blue:0.24, alpha:1.0).cgColor , Colors().gradientColor2.cgColor], size : size )
        UIGraphicsEndImageContext()
        return img
    }
}
