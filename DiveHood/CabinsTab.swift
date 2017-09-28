//
//  CabinsTab.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class CabinsTab: UIViewController, UITableViewDelegate, UITableViewDataSource    {
    var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        setTableview()
        view.addSubview(scrollview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    //*************************** Tableview Protocols  Functionalities *******************************//
    func setTableview( ) ->CGFloat{
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*562/1334*4))
        scrollview.addSubview(tableView)
        scrollview.contentSize = CGSize(width:  view.frame.width, height: view.frame.height*562/1334*4)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CabinsTabCell.classForCoder(), forCellReuseIdentifier: "CabinsCell")
         tableView.backgroundColor = UIColor(red: 17/255, green: 42/255, blue: 76/255, alpha: 1.0)
        tableView.separatorStyle = .none
        return tableView.frame.maxY
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    let images = [#imageLiteral(resourceName: "yes"), #imageLiteral(resourceName: "Check_Box") , #imageLiteral(resourceName: "no")]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CabinsCell", for: indexPath as IndexPath) as! CabinsTabCell
        cell.selectionStyle = .none
        cell.imageview.image = images[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellimageheight  = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*562/1334
        
        return cellimageheight
    }
    
    
  
    //#############   END OF Tableview Protocols  Functionalities #####################################//

 

}
