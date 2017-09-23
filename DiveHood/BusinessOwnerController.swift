//
//  BusinessOwnerController.swift
//  DiveHood
//
//  Created by starwallet on 9/22/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class BusinessOwnerController: UIViewController {
   
    var container : UIView!
    var signUpInstance: SignUp!
    var Controllers : [UIViewController]!
    var stepOneFormHeight : CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
         Controllers = [Step1FormController() , Step2FormController()]
         container = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.7))
        //container.backgroundColor = .gray
        view.addSubview(container)
        StepOneForm(0)
        Step2Form(view.frame.width)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    init(SignupInstance: SignUp) {
        super.init(nibName: nil, bundle: nil)
        self.signUpInstance = SignupInstance
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupControllers(_ Index:Int, _ x:CGFloat){
        
        
        Controllers[Index].view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        if x==0{
        
            if Index == 0{
            let temp  = Controllers[0] as! Step1FormController
                signUpInstance.container.frame.size.height = temp.height!
                container.frame.size.height = signUpInstance.container.frame.size.height
                signUpInstance.footerCntainer.removeFromSuperview()
                signUpInstance.Footer(maxy: signUpInstance.container.frame.maxY)
                
                
            }
            else{
                let temp  = Controllers[1] as! Step2FormController
                signUpInstance.container.frame.size.height = temp.Containerheight!
                container.frame.size.height = signUpInstance.container.frame.size.height
                signUpInstance.footerCntainer.removeFromSuperview()
                signUpInstance.Footer(maxy: signUpInstance.container.frame.maxY)
                
            }
          
        }
        
    }
    
    func StepOneForm(_ x:CGFloat){
        
        
        let controller = Step1FormController()
        controller.view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        controller.intializeControllers(Bowner: self)
        addChildViewController(controller)
        let height = controller.height
        container.frame.size.height = height!
        stepOneFormHeight = height
         print(height)
        //container.backgroundColor = .lightGray
        container.addSubview((controller.view)!)
        controller.didMove(toParentViewController: self)
        Controllers[0] = controller
        
        
    }
    func Step2Form(_ x:CGFloat){
        let controller = Step2FormController()
        controller.view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        controller.getinstance(Bowner: self)
        addChildViewController(controller)
    
                        container.addSubview((controller.view)!)
        controller.didMove(toParentViewController: self)
        
        Controllers[1] = controller
        
        
    }
    
 
}
