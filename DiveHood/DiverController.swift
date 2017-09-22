//
//  DiverController.swift
//  DiveHood
//
//  Created by starwallet on 9/22/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class DiverController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form()
        
        // Do any additional setup after loading the view.
    }
    func form (){
        let name = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: 0, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "  * Your Name" , view: view)
        view.addSubview(name)
        let Email = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: name.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "  * Your E-mail" , view: view)
        view.addSubview(Email)
        let pass = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: Email.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "  * Password" , view: view)
        view.addSubview(pass)
        let repass = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: pass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "  * Retray Password" , view: view)
        view.addSubview(repass)
        let code = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.1+view.frame.width*0.0426, height: view.frame.height*0.07) , PlaceHolder: " Code " , view: view)
        view.addSubview(code)
        let verticalline = UIView(frame: CGRect(x: code.frame.maxX, y: code.frame.minY+view.frame.height*0.02 , width: 1, height: code.frame.height-view.frame.height*0.025))
        verticalline.backgroundColor = Colors().BorderColor
        view.addSubview(verticalline)
        let mobileNumber = CustomizedTextField (frame: CGRect(x: verticalline.frame.maxX , y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.62, height: view.frame.height*0.07) , PlaceHolder: " Mobile Number " , view: view)
        view.addSubview(mobileNumber)
        
        
        //CheckBoxes
        let img = #imageLiteral(resourceName: "Check_Box")
        let container1 = UIView(frame: CGRect(x: view.frame.width*0.09, y: mobileNumber.frame.maxY+view.frame.height*0.0239, width: img.size.width, height: img.size.height))
        labelwithCheck(container: container1, text: "Verfiy your account via text messages.",adjustToFit:true)
        view.addSubview(container1)
        
        
       
        let container2 = UIView(frame: CGRect(x: view.frame.width*0.09, y: container1.frame.maxY+view.frame.height*0.0239, width: img.size.width, height: img.size.height))
        labelwithCheck(container: container2, text: "Agree to our terms and and confirms that you have", adjustToFit : false)
        view.addSubview(container2)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func labelwithCheck(container : UIView , text: String ,adjustToFit: Bool){
        let img = #imageLiteral(resourceName: "Check_Box")
        let checkbox = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        checkbox.image = #imageLiteral(resourceName: "Check_Box")
        container.addSubview(checkbox)
        let frame = CGRect(x: checkbox.frame.maxX+view.frame.width*0.0426 , y: 0, width: view.frame.width*0.5, height: container.frame.height)
        let title = CustomeLabel(frame: frame, text: text, adjustTofit: adjustToFit, size: view.frame.height*0.017, fontName: "OpenSans")
        title.textColor = Colors().blue
        container.addSubview(title)
        
        
    }
    
    
    
}
