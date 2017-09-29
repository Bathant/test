//
//  Step1FormController.swift
//  DiveHood
//
//  Created by starwallet on 9/23/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class Step1FormController: UIViewController {
    let Mes = Measurements()
    var height : CGFloat!
    var language : Bool = AppDelegate.sharedInstance().language!
    var BusinessOwner  = BusinessOwnerController()
    override func viewDidLoad() {
        super.viewDidLoad()
          height =  form()
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func form ()->CGFloat{

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
        
        view.addSubview(code)
        view.addSubview(verticalline)
        view.addSubview(mobileNumber)
        
        
        
        title = "NEXT FILL YOUR COMPANY DATA"
        if language{
            title = "التالي بيانات شركتك "
        }
        
        let  NextStepBtn = ButtonWithGradient(frame: CGRect(x: view.frame.width*0.09, y: mobileNumber.frame.maxY+view.frame.height*Mes.HEIGHT_32, width: view.frame.width-(view.frame.width*0.09*2), height: view.frame.height*0.07), title:title , view: self.view)
        NextStepBtn.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
        
        
        view.addSubview(NextStepBtn)
        
      return NextStepBtn.frame.maxY
        
    }
    func intializeControllers(Bowner : BusinessOwnerController){
    self.BusinessOwner = Bowner
    
    }
    
    func nextStep(){
 
  // UIView.animate(withDuration: 0.5, animations: {
    self.BusinessOwner.setupControllers(0, -2*self.view.frame.width)
    self.BusinessOwner.setupControllers(1, 0)
   //})
   
     self.BusinessOwner.setFooter()
    }

}
