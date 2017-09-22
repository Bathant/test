//
//  ForgetPassword.swift
//  DiveHood
//
//  Created by starwallet on 9/21/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class ForgetPassword: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setbackground()
                  SetupUi()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setbackground(){
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    backgroundImage.image = UIImage(named: "splashbg")
    self.view.insertSubview(backgroundImage, at: 0)
    }
    func SetupUi(){
    
    let height = markableLabel()
        let welcomelabel = UILabel(frame: CGRect(x: view.frame.width/2-(view.frame.width*0.625/2), y: view.frame.height*0.217, width: view.frame.width*0.625, height: view.frame.height*0.13))
        welcomelabel.text = "Having trouble logging in?"
    welcomelabel.adjustsFontSizeToFitWidth = true
        welcomelabel.textColor = .white
        welcomelabel.font = UIFont(name: "OpenSans-Bold", size: view.frame.width*0.625)
        welcomelabel.numberOfLines = 0
        welcomelabel.textAlignment = .center
        welcomelabel.baselineAdjustment = .alignCenters
         //welcomelabel.backgroundColor = .red
        view.addSubview(welcomelabel)
        let waveimg = #imageLiteral(resourceName: "waves")
        let waveImage = UIImageView(frame: CGRect(x: view.frame.width/2-waveimg.size.width/2, y: welcomelabel.frame.origin.y+welcomelabel.frame.height+view.frame.height*0.015, width: waveimg.size.width, height: waveimg.size.height))
        waveImage.image = waveimg
        print(waveimg.size)
        view.addSubview(waveImage)
        print(waveImage.frame.maxY)
        print(waveImage.frame.height+waveImage.frame.origin.y)
        
        let Email = CustomizedTextField(frame: CGRect(x: view.frame.width*0.09, y: waveImage.frame.maxY+view.frame.height*0.04, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "  * Your E-mail" , view: view)
          view.addSubview(Email)
        
         let button = ButtonWithGradient(frame: CGRect(x: Email.frame.origin.x, y: Email.frame.maxY+view.frame.height*0.05, width: Email.frame.width, height: view.frame.height*0.07), title: "RECOVER PASSWORD", view: self.view)
        button.addTarget(self, action: #selector(recovery_Pressed), for: .touchUpInside)
        view.addSubview(button)
    
        //last part 
        let LabelsContainer  = UIView(frame: CGRect(x: button.frame.origin.x, y:  button.frame.maxY +  view.frame.height*0.05 , width: button.frame.width, height: view.frame.height*0.03))
    
        let Firsttext = UILabel(frame: CGRect(x: 0, y: 0, width: LabelsContainer.frame.width*0.45, height: view.frame.height*0.03))
        // RememberMe.backgroundColor = .gray
      
        Firsttext.text = "Log In To Your Account"
        Firsttext.font =
        UIFont(name: "OpenSans-SemiboldItalic", size: LabelsContainer.frame.width*0.45)
        Firsttext.textColor = .white
        Firsttext.adjustsFontSizeToFitWidth = true
       
        Firsttext.baselineAdjustment = .alignCenters
        Firsttext.textAlignment = .left
        LabelsContainer.addSubview(Firsttext)
        
        
        
        let SecondText = UILabel(frame: CGRect(x: LabelsContainer.frame.maxX - LabelsContainer.frame.width*0.55, y: 0, width: LabelsContainer.frame.width*0.45, height: view.frame.height*0.03))
        SecondText.text = "Don't Have Any? Sign Up"
        // ForgetLabel.font = UIFont.systemFont(ofSize: RememberMe.font.pointSize)
        SecondText.font =  UIFont(name: "OpenSans-SemiboldItalic", size: LabelsContainer.frame.width*0.45)
        SecondText.textColor = .white
        SecondText.adjustsFontSizeToFitWidth = true
        SecondText.baselineAdjustment = .alignCenters
        SecondText.isUserInteractionEnabled = true
        SecondText.textAlignment = .right
        let tap = UITapGestureRecognizer(target: self, action: #selector(signup_Pressed))
        SecondText.addGestureRecognizer(tap)
        SecondText.isUserInteractionEnabled = true
        LabelsContainer.addSubview(SecondText)
        //ForgetLabel.backgroundColor = .gray
       
        
        //ForgetPasswordcontainer.backgroundColor = .gray
        view.addSubview(LabelsContainer)
        
        
        let lastParagraph = UILabel(frame: CGRect(x: LabelsContainer.frame.origin.x-10, y:  LabelsContainer.frame.maxY , width: view.frame.width - ((LabelsContainer.frame.origin.x-10)*2), height: view.frame.height*0.2 ))
        lastParagraph.text = "Enter your E-mail to recover your password. You will receive an email with instructions.if you are experiencing problems recovering your password send us email."
        lastParagraph.textColor = Colors().blue
       lastParagraph.baselineAdjustment = .alignCenters
        lastParagraph.lineBreakMode = .byWordWrapping
        lastParagraph.font = UIFont.systemFont(ofSize: view.frame.width*0.034)
     
        //lastParagraph.sizeToFit()
        lastParagraph.lineBreakMode = .byWordWrapping
        lastParagraph.numberOfLines = 0
        lastParagraph.adjustsFontSizeToFitWidth = true
        lastParagraph.textAlignment = .center
       // lastParagraph.backgroundColor = .gray
        view.addSubview(lastParagraph)

        
        
        
        
        
        
    }
    func signup_Pressed(){
    present(SignUp(), animated: true, completion: nil)
    
    
    
    }
    func recovery_Pressed(){
    
    
    
    
    
    }
    
    
    
    func markableLabel () -> CGFloat{
        
        
        let markableContainer = UIView(frame: CGRect(x: 0, y: view.frame.height*0.078, width: view.frame.width*0.4, height: view.frame.height*0.04))
        markableContainer.backgroundColor = Colors().gray
        let textlabel = UILabel(frame: CGRect(x: view.frame.width*0.025, y: 0, width: markableContainer.frame.width-(view.frame.width*0.025*2), height: markableContainer.frame.height))
        textlabel.font = UIFont(name: "OpenSans-Bold", size: 66)
        
        let boldText  = "PASSWORD "
        let attrs = [NSFontAttributeName :  UIFont(name: "OpenSans-Bold", size: 66) ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalText = "recovering"
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
    
    
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
