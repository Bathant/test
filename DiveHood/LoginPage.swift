//
//  LoginPage.swift
//  DiveHood
//
//  Created by starwallet on 9/19/17.
//  Copyright © 2017 starwallet. All rights reserved.
// 75 >> 0.078
// 22 >> 0.045
// 8 width 0.025

import UIKit

class LoginPage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setbackground()
        SetupUi()
        // Do any additional setup after loading the view.
    }
    func setbackground(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "splashbg")
        self.view.insertSubview(backgroundImage, at: 0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var RememberMe : UILabel!
    var button :UIButton!
    func SetupUi(){
        
        let height = markableLabel()
        
        let welcomelabel = UILabel(frame: CGRect(x: view.frame.width/2-(view.frame.width*0.6/2), y: view.frame.height*0.065+height, width: view.frame.width*0.6, height: view.frame.height*0.058))
        welcomelabel.text = "Welcome Back!"
        welcomelabel.adjustsFontSizeToFitWidth = true
        welcomelabel.textColor = .white
        welcomelabel.font = UIFont(name: "OpenSans-Bold", size: 28*3)
        welcomelabel.textAlignment = .center
        welcomelabel.baselineAdjustment = .alignCenters
        // welcomelabel.backgroundColor = .red
        view.addSubview(welcomelabel)
        let waveimg = #imageLiteral(resourceName: "waves")
        let waveImage = UIImageView(frame: CGRect(x: view.frame.width/2-waveimg.size.width/2, y: welcomelabel.frame.origin.y+welcomelabel.frame.height+view.frame.height*0.015, width: waveimg.size.width, height: waveimg.size.height))
        waveImage.image = waveimg
        
        view.addSubview(waveImage)
        print(waveImage.frame.maxY)
        print(waveImage.frame.height+waveImage.frame.origin.y)
        form(waveImage.frame.maxY)
        lastPart()
        
        
    }
    
    func lastPart(){
        let img1 = #imageLiteral(resourceName: "Check_Box")
        let x = view.frame.width*0.09+view.frame.width*0.05+img1.size.width
    let AccountLabel = UIView(frame: CGRect(x: x, y: button.frame.maxY+view.frame.height*0.04, width: view.frame.width-(x*2), height: view.frame.height*0.04))
        print( RememberMe.frame.origin.x)
    let firsttext = UILabel(frame: CGRect(x: 0, y: 0, width: AccountLabel.frame.width, height: AccountLabel.frame.height))
        firsttext.font = UIFont(name: "OpenSans-SemiboldItalic", size: AccountLabel.frame.width*0.8)
        firsttext.textAlignment = .left
        firsttext.baselineAdjustment = .alignCenters
       
        
        let boldText  = "Don’t Have a Divehood account?"
        let attrs = [NSForegroundColorAttributeName:UIColor.white ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        let normalText = "Sign Up"
        let attrs2 = [NSForegroundColorAttributeName:Colors().blue]
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        firsttext.attributedText = attributedString
        
        let tap = UITapGestureRecognizer(target: self, action: #selector( SignUp_Pressed))
        firsttext.addGestureRecognizer(tap)
        firsttext.isUserInteractionEnabled = true
        firsttext.adjustsFontSizeToFitWidth = true
     // firsttext.backgroundColor = .red
        AccountLabel.addSubview(firsttext)
       
        
        
        var img = #imageLiteral(resourceName: "or")
        let orimage = UIImageView(frame: CGRect(x: view.frame.width/2-(img.size.width/2), y: AccountLabel.frame.maxY+view.frame.height*0.02, width: img.size.width, height: img.size.height))
        orimage.image = img
        view.addSubview(orimage)
        
        
         img = #imageLiteral(resourceName: "Login-Facebook")
        let facebookimg = UIImageView(frame: CGRect(x: view.frame.width/2-(img.size.width/2), y: orimage.frame.maxY+view.frame.height*0.02*2, width: img.size.width, height: img.size.height))
        facebookimg.image = img
        view.addSubview(facebookimg)
  
        
        
        
      /*  let container = UIView(frame: CGRect(x: 0, y: button.frame.maxY, width: view.frame.origin.x+facebookimg.frame.origin.x, height: view.frame.maxY-button.frame.maxY))
        img = #imageLiteral(resourceName: "Tiny-Diver")
        let manimg = UIImageView(frame: CGRect(x: 0, y: 0, width: container.frame.width/2, height: container.frame.height))
        
        manimg.image = img
        container.addSubview(manimg)
        container.backgroundColor = .gray
        view.addSubview(container)
        */

        
    view.addSubview(AccountLabel)
    
    
    
    
    
    }
    
    
    
    func form (_ y : CGFloat){
        
        let Email = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: y+view.frame.height*0.04, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "* Your E-mail" , view: view)
        view.addSubview(Email)
        
        
        let Paasword = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: Email.frame.maxY+view.frame.height*0.015, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "* Password",view:view)
        view.addSubview(Paasword)
        
        let ForgetPasswordcontainer  = UIView(frame: CGRect(x: Paasword.frame.origin.x, y:  Paasword.frame.maxY +  view.frame.height*0.05 , width: Paasword.frame.width, height: Paasword.frame.height/2))
        let img = #imageLiteral(resourceName: "Check_Box")
        
        let checkbox = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
            checkbox.image = img
          //  checkbox.contentMode = .scaleAspectFit
        ForgetPasswordcontainer.addSubview(checkbox)
         RememberMe = UILabel(frame: CGRect(x: checkbox.frame.maxX + view.frame.width*0.05, y: 0, width: ForgetPasswordcontainer.frame.width*0.28, height: view.frame.height*0.03))
           // RememberMe.backgroundColor = .gray
            print(checkbox.frame.maxX + view.frame.width*0.05)
            RememberMe.text = "Remember Me"
           // RememberMe.backgroundColor = .blue
            RememberMe.font = UIFont(name: "OpenSans", size:ForgetPasswordcontainer.frame.width*0.28)
            RememberMe.textColor = Colors().blue
        RememberMe.adjustsFontSizeToFitWidth = true
        //RememberMe.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        RememberMe.baselineAdjustment = .alignCenters
        RememberMe.textAlignment = .left
        ForgetPasswordcontainer.addSubview(RememberMe)
        
        
        
        let ForgetLabel = UILabel(frame: CGRect(x: ForgetPasswordcontainer.frame.maxX - ForgetPasswordcontainer.frame.width*0.55, y: 0, width: ForgetPasswordcontainer.frame.width*0.45, height: view.frame.height*0.03))
        ForgetLabel.text = "Forget Your Password?"
       // ForgetLabel.font = UIFont.systemFont(ofSize: RememberMe.font.pointSize)
         ForgetLabel.font = UIFont(name: "OpenSans", size:ForgetPasswordcontainer.frame.width*0.45)
        ForgetLabel.textColor = Colors().blue
        ForgetLabel.adjustsFontSizeToFitWidth = true
        ForgetLabel.baselineAdjustment = .alignCenters
        ForgetLabel.textAlignment = .right
        ForgetLabel.isUserInteractionEnabled = true
        ForgetPasswordcontainer.addSubview(ForgetLabel)
        //ForgetLabel.backgroundColor = .gray
        let tap = UITapGestureRecognizer(target: self, action: #selector(Actions().ForgerPasseord_Pressed))
        ForgetLabel.addGestureRecognizer(tap)
        
        //ForgetPasswordcontainer.backgroundColor = .gray
        view.addSubview(ForgetPasswordcontainer)
     
         button = ButtonWithGradient(frame: CGRect(x: ForgetPasswordcontainer.frame.origin.x, y: ForgetPasswordcontainer.frame.maxY+view.frame.height*0.05, width: ForgetPasswordcontainer.frame.width, height: view.frame.height*0.07), title: "LOG IN", view: self.view)
        
        
        view.addSubview(button)
        
        
    }
   

    
    
    
    func markableLabel () -> CGFloat{
        
        
        let markableContainer = UIView(frame: CGRect(x: 0, y: view.frame.height*0.078, width: view.frame.width*0.4, height: view.frame.height*0.04))
        markableContainer.backgroundColor = Colors().gray
        let textlabel = UILabel(frame: CGRect(x: view.frame.width*0.025, y: 0, width: markableContainer.frame.width-(view.frame.width*0.025*2), height: markableContainer.frame.height))
        textlabel.font = UIFont(name: "OpenSans-Bold", size: 66)
        
        let boldText  = "LOG IN "
        let attrs = [NSFontAttributeName :  UIFont(name: "OpenSans-Bold", size: 66) ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalText = "to your account"
        let attrs2 = [NSFontAttributeName :  UIFont(name: "OpenSans", size: 66)]
        
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        textlabel.attributedText = attributedString
        textlabel.baselineAdjustment = .alignCenters
        textlabel.adjustsFontSizeToFitWidth = true
        textlabel.numberOfLines = 1
        textlabel.textAlignment = .center
        textlabel.textColor = .black
        markableContainer.addSubview(textlabel)
        view.addSubview(markableContainer)
        return markableContainer.frame.origin.y+markableContainer.frame.height
    }
    
    
    //actions 
    
    
    func SignIn_Pressed(_ sender : UITapGestureRecognizer){
        
        present(LoginPage(), animated: true, completion: nil)
        
    }
    
    func ForgerPasseord_Pressed(_ sender : UITapGestureRecognizer){
        present(ForgetPassword(), animated: true, completion: nil)
    }
    
    
    func SignUp_Pressed(_ sender : UITapGestureRecognizer){
        
        present(SignUp(), animated: true, completion: nil)
        
        
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
