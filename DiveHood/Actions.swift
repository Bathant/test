//
//  Actions.swift
//  DiveHood
//
//  Created by starwallet on 9/23/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import Foundation
import UIKit
class Actions :UIViewController{

    func SignIn_Pressed(_ sender : UITapGestureRecognizer){
    
     present(LoginPage(), animated: true, completion: nil)
    
    }
    
    func ForgerPasseord_Pressed(_ sender : UITapGestureRecognizer){
    present(ForgetPassword(), animated: true, completion: nil)
    }

    
    func SignUp_Pressed(_ sender : UITapGestureRecognizer){
    
     present(SignUp(), animated: true, completion: nil)
    
    
    }


}
