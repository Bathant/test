//
//  LiveaBoardsLists.swift
//  DiveHood
//
//  Created by starwallet on 9/24/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class LiveaBoardsLists: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var tableview: UITableView!
    let imags = ["fiji-siren-1","indo-siren-1","palau-siren-5", "indo-siren-1"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupbackgroundGradient()
        self.title = "LiveaBoard Lists"
       let nav = self.navigationController!
        nav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName :UIColor.white]
        if #available(iOS 11.0, *) {
            nav.navigationBar.prefersLargeTitles = true
            nav.navigationBar.largeTitleTextAttributes = [NSForegroundColorAttributeName :UIColor.white]

            print("height is ??? \(nav.navigationBar.intrinsicContentSize.height)")
        } else {
            // Fallback on earlier versions
        }
      
        

       //  nav.navigationItem.title = "LiveaBoard Lists"
        print(nav.navigationItem == nil)
        
        setupUi()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CustomTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableview.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }
    

    
    
    func setupUi(){
      statusBarGradient()
        let maxy = setupSegmentedControl()
        setupTableView(maxy)
        setNavigationGradient()
        statusBarGradient()
        //SetUpStatusBar()
        
    }
    func statusBarGradient(){
      
       
        let frame = UIApplication.shared.statusBarFrame
        let view1 = UIView()
        view1.backgroundColor = UIColor(red:56/255, green:44/255, blue:98/255, alpha:1.0)
        view1.frame = frame
        
        view.addSubview(view1)
        
    }
    
    func setNavigationGradient(){
        
        print("inside background color >>>>>>>>>>>>>>>")
    self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController!.navigationBar.shadowImage = UIImage()
    self.navigationController!.navigationBar.isTranslucent = true
    self.navigationController!.navigationBar.backgroundColor = UIColor.clear
    var menuimage = UIImage(named: "nb-menu")
    menuimage = menuimage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuimage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
       
        var SearchImage = UIImage(named: "nb-search")
        SearchImage = SearchImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
       
        var FilterImage = UIImage(named: "nb-filter")
        FilterImage = FilterImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        
        let searrchItem = UIBarButtonItem(image: SearchImage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        let filterItem =  UIBarButtonItem(image: FilterImage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItems = [ filterItem,searrchItem]
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
    

    func setupSegmentedControl()->CGFloat{
        let container = UIView(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: view.frame.width, height: view.frame.height*0.07))
        
        
        
        print("navigation height\(self.navigationController!.navigationBar.intrinsicContentSize.height)")
        container.backgroundColor = UIColor(red:56/255, green:44/255, blue:98/255, alpha:1.0)
        let items = ["List", "Map"]
        let segmented = UISegmentedControl(items: items)
        segmented.frame = CGRect(x: view.frame.width*0.04, y: view.frame.height*0.013, width: container.frame.width-(view.frame.width*0.04*2), height: container.frame.height-(view.frame.height*0.013*2))
        segmented.tintColor = Colors().blue
        segmented.selectedSegmentIndex = 0
        container.addSubview(segmented)
        view.addSubview(container)
        
        return container.frame.maxY
    }
    func setupTableView(_ maxy:CGFloat){

     tableview = UITableView(frame: CGRect(x: 0, y: maxy+view.frame.height*0.007, width: view.frame.width, height: view.frame.height - (maxy+view.frame.height*0.007)))
        view.addSubview(tableview)
    

    
    }
    //*************************** Tableview Protocols  Functionalities *******************************//
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomTableViewCell
            cell.img.image = UIImage(named: imags[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellimageheight  = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*450/1334
        
        return cellimageheight
    }
    
 
    
    //#############   END OF Tableview Protocols  Functionalities #####################################//
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
