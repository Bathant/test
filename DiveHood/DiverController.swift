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
    var ContainerHeight : CGFloat!
    var language : Bool = AppDelegate.sharedInstance().language!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .gray
        form()
        
        // Do any additional setup after loading the view.
    }
    func form (){
        var title = "* الاسم"
        if !language{
            title = "* Your Name"
        }
        let name = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: 0, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: title , view: view)
        view.addSubview(name)
        title = "* بريدك الإلكتروني  "
        if !language{
            
         title = "* Your E-mail"
        }
        let Email = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: name.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: title , view: view)
        view.addSubview(Email)
        title = "* كلمة المرور "
        if !language{
            
            title =  "* Password"
        }
        let pass = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: Email.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder:title, view: view)
        view.addSubview(pass)
        
        title = "* إعادة كلمة المرور"
        if !language{
            
            title = "* ReType Password"
        }
        let repass = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: pass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder:  title, view: view)
        view.addSubview(repass)
        
        
        //  in arabic language
        title = "رقم التليفون المحمول "
         var  mobileNumber = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09 , y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.7, height: view.frame.height*0.07) , PlaceHolder: title , view: view)
        var verticalline = UIView(frame: CGRect(x: mobileNumber.frame.maxX, y: mobileNumber.frame.minY+view.frame.height*0.02 , width: 1, height: mobileNumber.frame.height-view.frame.height*0.025))
        verticalline.backgroundColor = Colors().BorderColor
       
         title = "الكود "
      var  code = CustomizedTextField (frame: CGRect(x: verticalline.frame.maxX , y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width-( verticalline.frame.maxX+view.frame.width*0.09 ), height: view.frame.height*0.07) , PlaceHolder: title , view: view)
        //in english language
       
        if !language{
            
            title = "Code "
         code = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09  , y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width-( view.frame.width*0.75+view.frame.width*0.09+1 ), height: view.frame.height*0.07) , PlaceHolder: title , view: view)
             title = "Mobile Number "
      
             verticalline = UIView(frame: CGRect(x: code.frame.maxX, y: code.frame.minY+view.frame.height*0.02 , width: 1, height: code.frame.height-view.frame.height*0.025))
            verticalline.backgroundColor = Colors().BorderColor
            
               mobileNumber = CustomizedTextField (frame: CGRect(x: verticalline.frame.maxX , y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.75-view.frame.width*0.09, height: view.frame.height*0.07) , PlaceHolder: title , view: view)
        
                
            
            
            
        }
        
       view.addSubview(verticalline)
       view.addSubview(code)
        view.addSubview(mobileNumber)
        
        
        //CheckBoxes
        let img = #imageLiteral(resourceName: "Check_Box")
        
        var x = view.frame.width*0.09
        if language{
            x = view.frame.maxX-img.size.width-view.frame.width*0.09
        }
        
        
        let container1 = UIView(frame: CGRect(x: x, y: mobileNumber.frame.maxY+view.frame.height*0.0239, width: img.size.width, height: img.size.height))
        //container1.backgroundColor = .black
        title = "تحقق من حسابك عبر الرسائل النصية."
        if !language{
            
            title = "Verfiy your account via text messages."
        }
        
       let tuple1 =  labelwithCheck(container: container1, text: title,adjustToFit:true , number: 0)
        view.addSubview(container1)
        verficationCheckBox = tuple1.1
        
       
        let container2 = UIView(frame: CGRect(x: x, y: container1.frame.maxY+view.frame.height*0.0239, width: img.size.width, height: view.frame.height*0.05))
        
        title = "أوافق علي الشروط وأؤكد انني قرأت الشروط المستوفاة"
        if !language{
            
            title = "Agree to our terms and confirms that you have read our policy"
        }
        
        
        
        let tuple  = labelwithCheck(container: container2, text: title, adjustToFit : false , number : 1 )
 
        var boldText = "أوافق علي الشروط وأؤكد انني قرأت"
        if !language{
            
            boldText = "Agree to our terms and confirms that you have "
        }
        
        let attrs = [NSForegroundColorAttributeName:Colors().blue ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        var normalText = " الشروط المستوفاة"
        if !language{
            
            normalText = " read our policy"
        }
        
        
        
        
        let attrs2 = [NSForegroundColorAttributeName:UIColor.white]
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        tuple.0.attributedText = attributedString
        ReadPolicyCheckBox = tuple.1
        view.addSubview(container2)
        
        
       title = "تحقق من حسابك "
    if !language{
            
            title = "VERFIY YOUR ACCOUNT"
        }
       
        let  signupBtn = ButtonWithGradient(frame: CGRect(x: view.frame.width*0.09, y: container2.frame.maxY+view.frame.height*0.0479, width: view.frame.width-(view.frame.width*0.09*2), height: view.frame.height*0.07), title: title, view: self.view)
        signupBtn.addTarget(self, action: #selector(Verfication_Pressed), for: .touchUpInside)
        
        
        view.addSubview(signupBtn)
        
        ContainerHeight = signupBtn.frame.maxY
        
    }
    func Verfication_Pressed(){
        
        if verficationChecked{
            present(VerficationViaPhone(), animated: true, completion: nil)
        }
        else{
            present(VerficationViaMail(), animated: true, completion: nil)
            
        }
        
        
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
        var x = checkbox.frame.maxX+view.frame.width*0.12
        var alignment = NSTextAlignment.left
        var width = view.frame.width*0.82-(checkbox.frame.maxX+view.frame.width*0.0426*2)
        var y = container.frame.minY
        if language{
            x = 0
            alignment = .right
            width = view.frame.width-checkbox.frame.width-view.frame.width*0.12
            y = container.frame.minY
        }

        checkbox.isUserInteractionEnabled = true
        container.addSubview(checkbox)
        let height = text.height(constraintedWidth: width, font: UIFont(name: "OpenSans", size: view.frame.width*24/750)!)
        let frame = CGRect(x: x, y:y , width: width, height: height)
        let title = CustomeLabel(frame: frame, text: text, adjustTofit: adjustToFit, size: view.frame.width*24/750, fontName: "OpenSans")
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textAlignment = alignment
        title.textColor = Colors().blue
        //title.sizeToFit()
        view.addSubview(title)


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
