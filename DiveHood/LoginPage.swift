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
    var Email  : CustomizedTextField!
    var Language : Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        Language = AppDelegate.sharedInstance().language
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
        if Language{
            welcomelabel.text = "مرحبا بعودتك!"
        }else{
            welcomelabel.text = "Welcome Back"
        }
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
        firsttext.font = UIFont(name: "OpenSans-SemiboldItalic", size:view.frame.width*24/750)
        
       
        var  boldText  = "ليس لديك حساب؟"
        if !Language {
            boldText  =  "Don't Have a Divehood account "
        }
        let attrs = [NSForegroundColorAttributeName:UIColor.white ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        var  normalText = " سجل من هنا"
        if !Language{
            normalText = "Sign Up"
        }
        let attrs2 = [NSForegroundColorAttributeName:Colors().blue]
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        firsttext.attributedText = attributedString
        
        let tap = UITapGestureRecognizer(target: self, action: #selector( SignUp_Pressed))
        firsttext.addGestureRecognizer(tap)
        firsttext.isUserInteractionEnabled = true
       
        firsttext.textAlignment = .center
       
        AccountLabel.addSubview(firsttext)
        
        
        
        var img = #imageLiteral(resourceName: "or")
        let orimage = UIImageView(frame: CGRect(x: view.frame.width/2-(img.size.width/2), y: AccountLabel.frame.maxY+view.frame.height*0.02, width: img.size.width, height: img.size.height))
        orimage.image = img
        view.addSubview(orimage)
        
        
        img = #imageLiteral(resourceName: "Login-Facebook")
        let facebookimg = UIImageView(frame: CGRect(x: view.frame.width/2-(img.size.width/2), y: orimage.frame.maxY+view.frame.height*0.02*2, width: img.size.width, height: img.size.height))
        facebookimg.image = img
        view.addSubview(facebookimg)
        
        
        
        
        
        view.addSubview(AccountLabel)
        
        
        
        
        
    }
    
    
    
    func form (_ y : CGFloat){
        
        var placeholder = "* بريدك الالكتروني"
        if !Language{
            placeholder = "*Your Email"
        }
        Email = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: y+view.frame.height*0.04, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: placeholder , view: view)
        view.addSubview(Email)
        placeholder = " * كلمه المرور"
        if !Language{
            placeholder = "*Your Password"
        }
        
        let Paasword = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: Email.frame.maxY+view.frame.height*0.015, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: placeholder,view:view)
        view.addSubview(Paasword)
        
        let ForgetPasswordcontainer  = UIView(frame: CGRect(x: Paasword.frame.origin.x, y:  Paasword.frame.maxY +  view.frame.height*0.05 , width: Paasword.frame.width, height: Paasword.frame.height/2))
        let img = #imageLiteral(resourceName: "Check_Box")
        
        let checkbox = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        checkbox.image = img
        //  checkbox.contentMode = .scaleAspectFit
        ForgetPasswordcontainer.addSubview(checkbox)
        
        let str2 = "Remeber Me"
        let widthstr2:CGFloat =  str2.widthOfString(usingFont: UIFont(name: "OpenSans", size:view.frame.width*24/750)!)
        RememberMe = UILabel(frame: CGRect(x: checkbox.frame.maxX + view.frame.width*0.05, y: 0, width: widthstr2, height: view.frame.height*0.03))
        RememberMe.text = "تذكرني"
        if !Language{
            RememberMe.text = "Remeber Me"
        }
        // RememberMe.backgroundColor = .blue
        RememberMe.font = UIFont(name: "OpenSans", size:view.frame.width*24/750)
        RememberMe.textColor = Colors().blue
        RememberMe.textAlignment = .left
        ForgetPasswordcontainer.addSubview(RememberMe)
        
        let str = "Forget Your Password?"
        let widthstr:CGFloat =  str.widthOfString(usingFont: UIFont(name: "OpenSans", size:view.frame.width*24/750)!)
        let ForgetLabel = UILabel(frame: CGRect(x: ForgetPasswordcontainer.bounds.maxX - widthstr, y: 0, width: widthstr, height: view.frame.height*0.03))
        ForgetLabel.text = "نسييت كلمه المرور؟"
        if !Language{
            ForgetLabel.text = "Forget Your Password?"
            
        }
        ForgetLabel.font = UIFont(name: "OpenSans", size:view.frame.width*24/750)
        ForgetLabel.textColor = Colors().blue
       
        ForgetLabel.textAlignment = .right
        ForgetLabel.isUserInteractionEnabled = true
        ForgetPasswordcontainer.addSubview(ForgetLabel)
        let tap = UITapGestureRecognizer(target: self, action: #selector(Actions().ForgerPasseord_Pressed))
        ForgetLabel.addGestureRecognizer(tap)
        view.addSubview(ForgetPasswordcontainer)
        var title = "تسجيل الدخول"
        if !Language{
            title = "LOG IN"
        }
        button = ButtonWithGradient(frame: CGRect(x: ForgetPasswordcontainer.frame.origin.x, y: ForgetPasswordcontainer.frame.maxY+view.frame.height*0.05, width: ForgetPasswordcontainer.frame.width, height: view.frame.height*0.07), title: title , view: self.view)
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(lOGIN_Pressed), for: .touchUpInside)
        
    }
    func lOGIN_Pressed(_ sender : UIButton){
        
        AppDelegate.sharedInstance().window?.rootViewController = CustomTabBarController()
        
        
    }
    
    
    
    
    func markableLabel () -> CGFloat{
        var  boldText  = " الدخول "
        var normalText = "الي حسابك "
        let width1 = boldText.widthOfString(usingFont: UIFont(name: "OpenSans-Bold", size: 32*view.frame.width/750)!)
        let width2 = normalText.widthOfString(usingFont: UIFont(name: "OpenSans", size: 24*view.frame.width/750)!)
        let markableContainer = UIView(frame: CGRect(x: 0, y: view.frame.height*0.078, width: width1*2, height: view.frame.height*0.04))
        markableContainer.backgroundColor = Colors().gray
        let textlabel = UILabel(frame: CGRect(x: view.frame.width*0.025, y: 0, width: markableContainer.frame.width-(view.frame.width*0.025*2), height: markableContainer.frame.height))
       
        
        
        if !Language{
            boldText = "LOGIN "
        }
        let attrs = [NSFontAttributeName : UIFont(name: "OpenSans-Bold", size: 24*view.frame.width/750) ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        
        if !Language{
            normalText = "to your account"
        }
        
        let attrs2 = [NSFontAttributeName :  UIFont(name: "OpenSans", size: 24*view.frame.width/750)]
        
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        textlabel.attributedText = attributedString

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
    
    override func viewDidLayoutSubviews() {
        
        //        Email.translatesAutoresizingMaskIntoConstraints = false
        //        view.addConstraint(NSLayoutConstraint(item: Email, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant:view.frame.width*0.09))
        //        view.addConstraint(NSLayoutConstraint(item: Email, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: view.frame.width*0.09))
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


