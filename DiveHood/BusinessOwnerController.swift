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
     var Controllers : [UIViewController]!
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupControllers(_ Index:Int, _ x:CGFloat){
        
        
        Controllers[Index].view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        
    }
    
    func StepOneForm(_ x:CGFloat){
        
        
        let controller = Step1FormController()
        controller.view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        controller.intializeControllers(Bowner: self)
        addChildViewController(controller)
        container.addSubview((controller.view)!)
        controller.didMove(toParentViewController: self)
        Controllers[0] = controller
        
        
    }
    func Step2Form(_ x:CGFloat){
        let controller = Step2FormController()
        controller.view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        controller.intializeControllers(Bowner: self)

        addChildViewController(controller)
        container.addSubview((controller.view)!)
        controller.didMove(toParentViewController: self)
        
        Controllers[1] = controller
        
        
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
