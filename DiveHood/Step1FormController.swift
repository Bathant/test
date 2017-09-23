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
        let name = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*Mes.HEIGHT_32, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "* Your Name" , view: view)
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
        
        let  NextStepBtn = ButtonWithGradient(frame: CGRect(x: view.frame.width*0.09, y: mobileNumber.frame.maxY+view.frame.height*Mes.HEIGHT_32, width: view.frame.width-(view.frame.width*0.09*2), height: view.frame.height*0.07), title: "NEXT FILL YOUR COMPANY", view: self.view)
        NextStepBtn.addTarget(self, action: #selector(nextStep), for: .touchUpInside)
        
        
        view.addSubview(NextStepBtn)
        
      return NextStepBtn.frame.maxY
        
    }
    func intializeControllers(Bowner : BusinessOwnerController){
    self.BusinessOwner = Bowner
    
    }
    
    func nextStep(){
    UIView.animate(withDuration: 0.5) { 
        self.BusinessOwner.setupControllers(0, -2*self.view.frame.width)
        self.BusinessOwner.setupControllers(1, 0)
        }
   
    
    
    }

}
