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
        let code = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.2, height: view.frame.height*0.07) , PlaceHolder: " code " , view: view)
        view.addSubview(code)
        let mobileNumber = CustomizedTextField (frame: CGRect(x: code.frame.maxX, y: repass.frame.maxY+view.frame.height*0.0239, width: view.frame.width*0.78, height: view.frame.height*0.07) , PlaceHolder: " Mobile Number " , view: view)
        view.addSubview(mobileNumber)
    
    
    }

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
