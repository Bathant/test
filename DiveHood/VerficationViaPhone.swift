//
//  VerficationViaPhone.swift
//  DiveHood
//
//  Created by starwallet on 9/22/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class VerficationViaPhone: UIViewController {
let M = Measurements()
    override func viewDidLoad() {
        super.viewDidLoad()
            setupUi()
        // Do any additional setup after loading the view.
    }
    func setupUi(){
    setbackground()
     let frame =  CGRect(x: 0, y: view.frame.height*0.086, width: view.frame.width*0.3, height: view.frame.height*0.0329)
        let MarkableShape = Markable_Shape(frame: frame, BoldText: "VERFIY ",NormalText: "via SMS" ,view: self.view)
        view.addSubview(MarkableShape)
        let img = #imageLiteral(resourceName: "verify-check")
        let Checkimage = UIImageView(frame: CGRect(x: view.frame.width/2 - (img.size.width/2), y: MarkableShape.frame.maxY + view.frame.height*0.08, width: img.size.width , height: img.size.height))
        Checkimage.image = img
        Checkimage.contentMode = .scaleAspectFit
        view.addSubview(Checkimage)
        
       let y =  welcomeHeader(Checkimage.frame.maxY)
        
        
        let midLabel = CustomeLabel()
        
        midLabel.frame.origin.y  = y + view.frame.height*M.HEIGHT_32
        midLabel.OneLine(fontName: "OpenSans", FontSize: view.frame.height*0.0254 , text : "Enter the 4-digit code you received via sms" ,textColor: .white)
        view.addSubview(midLabel)
        midLabel.frame.origin.x = view.frame.width/2 - midLabel.frame.width/2
        let codeTXF = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*M.HEIGHT_16 + midLabel.frame.maxY, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "* Enter the recieved code " , view: view)
        view.addSubview(codeTXF)
        let resendButton  = ButtonWithGradient(frame: CGRect(x: codeTXF.frame.origin.x, y: view.frame.height*M.HEIGHT_32+codeTXF.frame.maxY, width: view.frame.width * 0.2, height: view.frame.height*0.017))
        resendButton.buttonWithBottomBorder(title: "Resend Code?", view: view)
        resendButton.setTitleColor(Colors().blue, for: .normal)
        view.addSubview(resendButton)
        
        lastPart(resendButton.frame.maxY)
        
        
        
        
    
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
    func welcomeHeader(_ height : CGFloat)->CGFloat{
    
        var frame = CGRect(x: view.frame.width/2-(view.frame.width*0.7/2), y: M.HEIGHT_16+height, width: view.frame.width*0.7, height: view.frame.height*0.06)
        let welcomelabel = CustomeLabel(frame: frame, text: "Thanks For Sign Up", adjustTofit: true, size: view.frame.height*0.04, fontName: "OpenSans-Bold")
        welcomelabel.sizeToFit()
        view.addSubview(welcomelabel)
     
        
        let secondlabel = CustomeLabel()
        secondlabel.OneLine(fontName: "OpenSans", FontSize: view.frame.height*0.025, text: "Verfiy Your Account", textColor: .white)
        secondlabel.frame.origin.x = view.frame.width/2 - secondlabel.frame.width/2
        secondlabel.frame.origin.y = welcomelabel.frame.maxY
        view.addSubview(secondlabel)
        let waveImage = UIImageView(frame: CGRect(x: view.frame.width/2-(#imageLiteral(resourceName: "waves").size.width/2), y: secondlabel.frame.maxY+view.frame.height*M.HEIGHT_16, width: #imageLiteral(resourceName: "waves").size.width, height: #imageLiteral(resourceName: "waves").size.height))
        waveImage.image = #imageLiteral(resourceName: "waves")
        waveImage.contentMode = .scaleToFill
        waveImage.frame.origin = CGPoint(x: view.frame.width/2-waveImage.frame.width/2, y: secondlabel.frame.origin.y+secondlabel.frame.height+view.frame.height*0.015)
        view.addSubview(waveImage)

    
        return waveImage.frame.maxY
    }

    func verfiy_Pressed(){
    
    
    
    }
    func lastPart(_ y :CGFloat){
    
        
        let button = ButtonWithGradient(frame: CGRect(x: view.frame.width*0.09 , y: y+view.frame.height*M.HEIGHT_32, width: view.frame.width*0.82, height: view.frame.height*0.07), title: "VERFIY", view: self.view)
        button.addTarget(self, action: #selector(verfiy_Pressed), for: .touchUpInside)
        view.addSubview(button)
        
        //last part
        let LabelsContainer  = UIView(frame: CGRect(x: button.frame.origin.x, y:  button.frame.maxY +  view.frame.height*M.HEIGHT_32 , width: button.frame.width, height: view.frame.height*0.03))
        
        let Firsttext = UILabel(frame: CGRect(x: 0, y: 0, width: LabelsContainer.frame.width*0.45, height: view.frame.height*0.03))
        
        Firsttext.text = "Log In To Your Account"
        Firsttext.font =
            UIFont(name: "OpenSans-SemiboldItalic", size: LabelsContainer.frame.width*0.45)
        Firsttext.textColor = .white
        Firsttext.adjustsFontSizeToFitWidth = true
        
        Firsttext.baselineAdjustment = .alignCenters
        Firsttext.textAlignment = .left
        LabelsContainer.addSubview(Firsttext)
        let tab = UITapGestureRecognizer(target: self, action: #selector( SignIn_Pressed))
        Firsttext.isUserInteractionEnabled = true
        Firsttext.addGestureRecognizer(tab)
        let SecondText = UILabel(frame: CGRect(x: LabelsContainer.frame.maxX - LabelsContainer.frame.width*0.55, y: 0, width: LabelsContainer.frame.width*0.45, height: view.frame.height*0.03))
        SecondText.text = "Don't Have Any? Sign Up"
        SecondText.font =  UIFont(name: "OpenSans-SemiboldItalic", size: LabelsContainer.frame.width*0.45)
        SecondText.textColor = .white
        SecondText.adjustsFontSizeToFitWidth = true
        SecondText.baselineAdjustment = .alignCenters
        SecondText.isUserInteractionEnabled = true
        SecondText.textAlignment = .right
        let tab2 = UITapGestureRecognizer(target: self, action: #selector( SignUp_Pressed))
        SecondText.isUserInteractionEnabled = true
        SecondText.addGestureRecognizer(tab2)
        LabelsContainer.addSubview(SecondText)

        view.addSubview(LabelsContainer)
        
        
        let lastParagraph = UILabel(frame: CGRect(x: LabelsContainer.frame.origin.x-10, y:  LabelsContainer.frame.maxY+view.frame.height*M.HEIGHT_16, width: view.frame.width - ((LabelsContainer.frame.origin.x-10)*2), height: view.frame.height*0.1 ))
        lastParagraph.text = "A code has been sent to your device via SMS? You always can verify your account by following the link sent to your ?E-mail account."
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
    
    
    func markableLabel () -> CGFloat{
        
        
        let markableContainer = UIView(frame: CGRect(x: 0, y: view.frame.height*0.078, width: view.frame.width*0.4, height: view.frame.height*0.04))
        markableContainer.backgroundColor = Colors().gray
        let textlabel = UILabel(frame: CGRect(x: view.frame.width*0.025, y: 0, width: markableContainer.frame.width-(view.frame.width*0.025*2), height: markableContainer.frame.height))
        textlabel.font = UIFont(name: "OpenSans-Bold", size: 66)
        
        let boldText  = "VERFIY"
        let attrs = [NSFontAttributeName :  UIFont(name: "OpenSans-Bold", size: 66) ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalText = "via SMS"
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
    
}
