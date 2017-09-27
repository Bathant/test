//
//  CabinsViewController.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class CabinsViewController: UIViewController {
      var Bigcontainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.SetupGradient(viewx: self.view)
        self.SetupStautsBar(viewx: view)
        self.setupnavigation(viewController: self, Title: "Cabin Details")
        let Container = SetFirstPart((self.navigationController?.navigationBar.frame.maxY)!)
        let y = setupSegmentedControl(Container.frame.maxY)
        self.tabBarController?.tabBar.isHidden = true
         Bigcontainer = UIView(frame: CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height-y))
        Bigcontainer.backgroundColor = .black
        view.addSubview(Bigcontainer)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
   
    
    func setupSegmentedControl(_ y : CGFloat)->CGFloat{
        let container = UIView(frame: CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height*0.07))
        
        
        
        print("navigation height\(self.navigationController!.navigationBar.intrinsicContentSize.height)")
        container.backgroundColor = UIColor(red:56/255, green:44/255, blue:98/255, alpha:1.0)
        let items = ["Cabins", "Trip Info","Itineraries", "Extras"]
        let segmented = UISegmentedControl(items: items)
        segmented.frame = CGRect(x: view.frame.width*0.04, y: view.frame.height*0.013, width: container.frame.width-(view.frame.width*0.04*2), height: container.frame.height-(view.frame.height*0.013*2))
        segmented.tintColor = Colors().blue
        segmented.selectedSegmentIndex = 0
        container.addSubview(segmented)
        view.addSubview(container)
        segmented.addTarget(self, action: #selector(self.segmentChange), for: .valueChanged )
        
        return container.frame.maxY
    }
    
    
    func segmentChange(sender:UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            CabinsController(viewController: CabinsTab())

     

        default:
            break
        }
        
    }
    
    func CabinsController(viewController : UIViewController){
        
        let views = Bigcontainer.subviews
        for view in views {
            view.removeFromSuperview()
        }
        let controller = viewController
        controller.view.frame = CGRect(x: 0, y:  0 , width:  Bigcontainer.frame.width, height:  Bigcontainer.frame.height)
        
        addChildViewController(controller)
         Bigcontainer.addSubview((controller.view)!)
        controller.didMove(toParentViewController: self)
      
        
        
    }
    
  //   this is the first part before segmented bar
    func SetFirstPart( _ y:CGFloat)->UIView{
        
        let date = UIView(frame: CGRect(x: 0, y: y, width: view.frame.width*96/750, height: view.frame.height*140/1334))
        date.backgroundColor = UIColor(red : 177/255,green: 177/255,blue: 177/255, alpha: 1.0)
        verticallyLabels(date, "IN", "8", "July")
        let outDate = UIView(frame: CGRect(x: date.frame.width+1 , y: y, width: view.frame.width*96/750, height: view.frame.height*140/1334))
        outDate.backgroundColor = UIColor(red : 207/255,green: 207/255,blue: 209/255, alpha: 1.0)
        verticallyLabels(outDate, "OUT", "12", "July")
        let ticketDescription = UIView(frame: CGRect(x: outDate.frame.maxX, y: y, width: view.frame.width-outDate.frame.maxX, height: outDate.frame.height))
        ticketDescription.backgroundColor = UIColor(red: 230/255,green:  230/255,blue: 230/255, alpha:1.0 )
        
        let getlabel = HorizontalyLabels("Brothers, Daedalus and Elphinstone", font: UIFont(name: "OpenSans-SemiBold", size: view.frame.width*28/750)!, textcolor: UIColor(red: 12/255, green: 37/255, blue: 60/255, alpha: 1), y: 0, container: ticketDescription, Width: ticketDescription.frame.width-(view.frame.width*25/750))
        
        let label2  =   HorizontalyLabels("5 Days / 6 Nights (Approximately 17 dives)", font: UIFont(name: "OpenSans", size: view.frame.width*24/750)!, textcolor: UIColor(red: 12/255, green: 37/255, blue: 60/255, alpha: 1), y: getlabel.frame.maxY, container: ticketDescription, Width: ticketDescription.frame.width-(view.frame.width*25/750))
        let label3 =  HorizontalyLabels("4 spaces Left", font: UIFont(name: "OpenSans", size: view.frame.width*24/750)!, textcolor: UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1), y: label2.frame.maxY+view.frame.height*8/1334, container: ticketDescription, Width:(view.frame.width*174/750))
        label3.backgroundColor = UIColor(red: 207/255,green:  207/255,blue: 209/255, alpha:1.0 )
        label3.textAlignment = .center
        
        view.addSubview(ticketDescription)
        return date
    }
    
    
    func HorizontalyLabels(_ text :String , font : UIFont , textcolor : UIColor , y: CGFloat , container: UIView , Width : CGFloat)->UILabel{
        
        let text2 = text
        let getHeight2 = text.height(constraintedWidth: Width, font:  font)
        let firstlabel2 = UILabel(frame: CGRect(x: view.frame.width*25/750, y:y, width: Width, height: getHeight2))
        firstlabel2.font = font
        firstlabel2.text = text2
        firstlabel2.textAlignment = .left
        firstlabel2.textColor = textcolor
        container.addSubview(firstlabel2)
        return firstlabel2
        
    }
    func verticallyLabels(_ date : UIView, _ str1 : String , _ str2: String , _ str3: String){
        
        
        let Inlabel = UILabel()
        Inlabel.frame.origin = CGPoint(x: 0, y:view.frame.height*8/1334)
        var string = str1
        var height = string.height(constraintedWidth:date.frame.width , font: UIFont(name: "OpenSans-Bold", size: view.frame.width*22/750)!)
        Inlabel.text = str1
        Inlabel.textAlignment = .center
        Inlabel.textColor = .black
        Inlabel.font = UIFont(name: "OpenSans-Bold", size: view.frame.width*22/750)
        Inlabel.frame.size = CGSize(width: date.frame.width, height: height)
        date.addSubview(Inlabel)
        view.addSubview(date)
        
        
        
        let numberlabel = UILabel()
        numberlabel.frame.origin = CGPoint(x:0, y:Inlabel.frame.maxY)
        numberlabel.text = str2
        string = str2
        height = string.height(constraintedWidth:date.frame.width , font: UIFont(name: "OpenSans-Bold", size: view.frame.width*34/750)!)
        numberlabel.textAlignment = .center
        numberlabel.textColor = .black
        numberlabel.font = UIFont(name: "OpenSans-Bold", size: view.frame.width*34/750)
        numberlabel.frame.size = CGSize(width: date.frame.width, height: height)
        date.addSubview(numberlabel)
        view.addSubview(date)
        
        
        let label = UILabel()
        label.frame.origin = CGPoint(x:0 , y:numberlabel.frame.maxY)
        label.text = str3
        string = str3
        height = string.height(constraintedWidth:date.frame.width , font: UIFont(name: "OpenSans", size: view.frame.width*24/750)!)
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "OpenSans", size: view.frame.width*24/750)
        label.frame.size = CGSize(width: date.frame.width, height: height)
        date.addSubview(label)
        view.addSubview(date)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}
