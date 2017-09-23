//
//  DiverController.swift
//  DiveHood
//
//  Created by starwallet on 9/22/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class DiverController: UIViewController {
    var verficationChecked: Bool = true
    var verficationCheckBox:UIImageView!
    var ReadPolicyCheckBox : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .gray
        form()
        
        // Do any additional setup after loading the view.
    }
    func form (){
        let name = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: 0, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "* Your Name" , view: view)
        view.addSubview(name)
        let Email = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: name.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "* Your E-mail" , view: view)
        view.addSubview(Email)
        let pass = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: Email.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "* Password" , view: view)
        view.addSubview(pass)
        let repass = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: pass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "* Retray Password" , view: view)
        view.addSubview(repass)
        let code = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.1+view.frame.width*0.0426, height: view.frame.height*0.07) , PlaceHolder: "Code " , view: view)
        view.addSubview(code)
        let verticalline = UIView(frame: CGRect(x: code.frame.maxX, y: code.frame.minY+view.frame.height*0.02 , width: 1, height: code.frame.height-view.frame.height*0.025))
        verticalline.backgroundColor = Colors().BorderColor
        view.addSubview(verticalline)
        let mobileNumber = CustomizedTextField (frame: CGRect(x: verticalline.frame.maxX , y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.62, height: view.frame.height*0.07) , PlaceHolder: "Mobile Number " , view: view)
        view.addSubview(mobileNumber)
        
        
        //CheckBoxes
        let img = #imageLiteral(resourceName: "Check_Box")
        let container1 = UIView(frame: CGRect(x: view.frame.width*0.09, y: mobileNumber.frame.maxY+view.frame.height*0.0239, width: img.size.width, height: img.size.height))
       let tuple1 =  labelwithCheck(container: container1, text: "Verfiy your account via text messages.",adjustToFit:true , number: 0)
        view.addSubview(container1)
        verficationCheckBox = tuple1.1
        
       
        let container2 = UIView(frame: CGRect(x: view.frame.width*0.09, y: container1.frame.maxY+view.frame.height*0.0239, width: img.size.width, height: view.frame.height*0.05))
        let tuple  = labelwithCheck(container: container2, text: "Agree to our terms and confirms that you have read our policy", adjustToFit : false , number : 1 )
        let boldText  = "Agree to our terms and confirms that you have "
        let attrs = [NSForegroundColorAttributeName:Colors().blue ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        let normalText = "read our policy"
        let attrs2 = [NSForegroundColorAttributeName:UIColor.white]
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        tuple.0.attributedText = attributedString
        ReadPolicyCheckBox = tuple.1
        view.addSubview(container2)
        
       
        let  signupBtn = ButtonWithGradient(frame: CGRect(x: view.frame.width*0.09, y: container2.frame.maxY+view.frame.height*0.0479, width: view.frame.width-(view.frame.width*0.09*2), height: view.frame.height*0.07), title: "VERFIY YOUR ACCOUNT", view: self.view)
        signupBtn.addTarget(self, action: #selector(Verfication_Pressed), for: .touchUpInside)
        
        
        view.addSubview(signupBtn)
        
        
        
    }
    func Verfication_Pressed(){
    
    
    }
    func verfiy(_ sender:UITapGestureRecognizer){
  
            if verficationCheckBox.image == #imageLiteral(resourceName: "Empty_Check_Box"){
                verficationCheckBox.image = #imageLiteral(resourceName: "Check_Box")
                verficationChecked = true
            }
            else{
            verficationCheckBox.image = #imageLiteral(resourceName: "Empty_Check_Box")
            verficationChecked = false
            }
    }
    
    
    func ReadPolicy(_ sender:UITapGestureRecognizer){
        
        
        
        if ReadPolicyCheckBox.image == #imageLiteral(resourceName: "Empty_Check_Box"){
            ReadPolicyCheckBox.image = #imageLiteral(resourceName: "Check_Box")
           
        }
        else{
            ReadPolicyCheckBox.image = #imageLiteral(resourceName: "Empty_Check_Box")
           
        }
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func labelwithCheck(container : UIView , text: String ,adjustToFit: Bool , number :Int)->(UILabel,UIImageView){
        let img = #imageLiteral(resourceName: "Check_Box")
        let checkbox = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        checkbox.image = #imageLiteral(resourceName: "Check_Box")
        
       checkbox.tag = number
        
        
        
        checkbox.isUserInteractionEnabled = true
        container.addSubview(checkbox)
        let frame = CGRect(x: checkbox.frame.maxX+view.frame.width*0.0426 , y: 0, width: view.frame.width*0.82-(checkbox.frame.maxX+view.frame.width*0.0426*2), height: container.frame.height)
        let title = CustomeLabel(frame: frame, text: text, adjustTofit: adjustToFit, size: view.frame.height*0.017, fontName: "OpenSans")
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textAlignment = .left
        title.textColor = Colors().blue
        title.sizeToFit()
        container.addSubview(title)
        
        
        if number == 0 {
            let tap = UITapGestureRecognizer(target: self, action: #selector(verfiy))
            checkbox.addGestureRecognizer(tap)
        }
        else {
        
            let tap = UITapGestureRecognizer(target: self, action: #selector(ReadPolicy))
            checkbox.addGestureRecognizer(tap)
        
        }
        
        return (title , checkbox)
        
    }
    
    
    
}
