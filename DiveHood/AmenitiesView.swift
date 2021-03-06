//
//  AmenitiesView.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class AmenitiesView: UIViewController , UITableViewDelegate ,UITableViewDataSource{
    var FacilitiyTableView : UITableView!
    var FoodandDrinkTableView : UITableView!
    var scrollview : UIScrollView!
    var Viewtitle : String!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUi()
        FacilitiyTableView.delegate = self
         FacilitiyTableView.dataSource = self
        FacilitiyTableView.register(AmenitiesCell.classForCoder(), forCellReuseIdentifier: "AmenitiesCell")
        
        FoodandDrinkTableView.delegate = self
        FoodandDrinkTableView.dataSource = self
        FoodandDrinkTableView.register(AmenitiesCell.classForCoder(), forCellReuseIdentifier: "AmenitiesCell1")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    func setUi(){
        scrollview = UIScrollView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: view.frame.height))
       scrollview.backgroundColor = .white
        view.addSubview(scrollview)
        SetupNavigationBar()
        setupbackgroundGradient()
        statusBarGradient()
        
       FacilitiyTableView =  FacilityTableview(view.frame.height*32/1334 ,text: "FACILITIES")
        FoodandDrinkTableView =  FacilityTableview(FacilitiyTableView.frame.maxY,text: "FOOD AND DRINK")
         scrollview.contentSize = CGSize(width: view.frame.width, height: FoodandDrinkTableView.frame.maxY)
      
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //*************************** Tableview Protocols  Functionalities *******************************//
    let Facilitesimagesarr = [#imageLiteral(resourceName: "Amenity-1"), #imageLiteral(resourceName: "Amenity-2"), #imageLiteral(resourceName: "Amenity-3"), #imageLiteral(resourceName: "Amenity-4"), #imageLiteral(resourceName: "Amenity-5"), #imageLiteral(resourceName: "Amenity-6")]
    let Facilitesstr = ["Wi-Fi (FREE)", "Air-conditioning", "Lounge/TV area", "European (2 pin) power sockets", "Power socket adapters available", "Shaded sun deck"]
    let foodandDrinkimages = [#imageLiteral(resourceName: "Amenity-2"), #imageLiteral(resourceName: "Amenity-1"), #imageLiteral(resourceName: "Amenity-default"), #imageLiteral(resourceName: "Amenity-default"), #imageLiteral(resourceName: "Amenity-default"), #imageLiteral(resourceName: "Amenity-default")]
     let foodandDrinkstr = ["Snaks all day ", "Buffet", "Vegetarian food", "Gluten  free food", "Power socket adapters available", "Shaded sun deck"]
    func FacilityTableview(_ y:CGFloat , text : String  ) ->UITableView{
        
        let container = UIView(frame: CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height*88/1334))
        container.backgroundColor = UIColor(red: 52/255, green: 42/255, blue: 72/255, alpha: 1.0)
        let str = text
        let height = str.height(constraintedWidth: container.frame.width, font:  UIFont(name: "OpenSans-Bold", size: view.frame.width*34/750)!)
        let firstlabel2 = UILabel(frame: CGRect(x:  view.frame.width*25/750, y:container.frame.height/2-height/2, width:container.frame.width ,height: height))
        firstlabel2.font = UIFont(name: "OpenSans-Bold", size:  view.frame.width*34/750)
        firstlabel2.text = text
        firstlabel2.textAlignment = .left
        firstlabel2.textColor = .white
        container.addSubview(firstlabel2)
        
        scrollview.addSubview(container)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: container.frame.maxY, width: view.frame.width, height: view.frame.height*100/1334*6))
        scrollview.addSubview(tableView)
        tableView.separatorStyle = .none
        return tableView
        
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var images = Facilitesimagesarr
        var content = Facilitesstr
        var identifier = "AmenitiesCell"
        if tableView == FoodandDrinkTableView{
            
            images = foodandDrinkimages
            content = foodandDrinkstr
            identifier =  "AmenitiesCell1"
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier:identifier, for: indexPath as IndexPath) as! AmenitiesCell
        cell.selectionStyle = .none
        cell.icon.image = images[indexPath.row]
        var str = content[indexPath.row]
        let height = str.height(constraintedWidth: cell.frame.width-(cell.icon.frame.maxX+view.frame.width*32/750), font: UIFont(name: "OpenSans", size:  view.frame.width*22/750)!)
        cell.title.frame = CGRect(x: cell.icon.frame.maxX+view.frame.width*32/750, y:cell.icon.frame.midY-height/2, width:cell.frame.width-(cell.icon.frame.maxX+view.frame.width*32/750) ,height: height)
        cell.title.text = str
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellimageheight  = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*100/1334
        
        return cellimageheight
    }
    
    
    
    //#############   END OF Tableview Protocols  Functionalities #####################################//
    
    func SetupNavigationBar(){
       
        let nav = self.navigationController!
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
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.backgroundColor = UIColor.clear
        
        self.navigationController?.navigationBar.tintColor = .white
    }
    func setupbackgroundGradient(){
        
        
        let gradientx = CAGradientLayer()
        gradientx.colors = [UIColor(red:17/255, green:42/255, blue:76/255, alpha:1.0).cgColor,Colors().gradientColor2.cgColor]
        gradientx.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientx.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientx.locations = [0.3, 0.7]
        gradientx.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientx, at: 0)
        
        
    }
    func statusBarGradient(){
        
        let frame = UIApplication.shared.statusBarFrame
        let view1 = UIView()
        view1.backgroundColor = UIColor(red:56/255, green:44/255, blue:98/255, alpha:1.0)
        view1.frame = frame
        view.addSubview(view1)
        
    }
    
}
