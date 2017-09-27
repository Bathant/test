//
//  CabinsTab.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class CabinsTab: UIViewController, UITableViewDelegate, UITableViewDataSource    {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableview()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    //*************************** Tableview Protocols  Functionalities *******************************//
    func setTableview(_ y:CGFloat  ) ->CGFloat{
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(tableView)
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TimeSlotsCell.classForCoder(), forCellReuseIdentifier: "CabinsCell")
        
        tableView.separatorStyle = .none
        return tableView.frame.maxY
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CabinsCell", for: indexPath as IndexPath) as! TimeSlotsCell
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellimageheight  = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*272/1334
        
        return cellimageheight
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(CabinsViewController(), animated: true)
    }
    //#############   END OF Tableview Protocols  Functionalities #####################################//

 

}
