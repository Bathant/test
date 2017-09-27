//
//  TimeSlotsView.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class TimeSlotsView: UIViewController,UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUi()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUi(){
        
        SetupNavigationBar()
        setupbackgroundGradient()
        statusBarGradient()
        setTableview((self.navigationController?.navigationBar.frame.maxY)!)
        
        
    }
    
    //*************************** Tableview Protocols  Functionalities *******************************//
    func setTableview(_ y:CGFloat  ) ->CGFloat{
        let tableView = UITableView(frame: CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height))
        view.addSubview(tableView)
        //tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TimeSlotsCell.classForCoder(), forCellReuseIdentifier: "TimeSlotCell")
       
        tableView.separatorStyle = .none
        return tableView.frame.maxY
        
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeSlotCell", for: indexPath as IndexPath) as! TimeSlotsCell
        cell.selectionStyle = .none
      
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellimageheight  = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*240/1334
        
        return cellimageheight
    }
    
    
  
    //#############   END OF Tableview Protocols  Functionalities #####################################//
    
    func SetupNavigationBar(){
        self.title = "Time Slots"
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
