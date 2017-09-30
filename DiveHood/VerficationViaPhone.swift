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
    var language : Bool = AppDelegate.sharedInstance().language!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        // Do any additional setup after loading the view.
    }
    func setupUi(){
        setbackground()
        
        
        var  boldText  = "VERFIY"
        var  normalText = "via SMS"
        if language{
            boldText = "التأكيد"
            normalText = " عبر رسالة المحمول "
        }
        
        let width1 = boldText.widthOfString(usingFont: UIFont(name: "OpenSans-Bold", size: view.frame.width*32/750)!)
        let width2 = normalText.widthOfString(usingFont: UIFont(name: "OpenSans", size: view.frame.width*24/750)!)
        let frame =  CGRect(x: 0, y: view.frame.height*0.086, width: width1+width2+view.frame.width*0.025, height: view.frame.height*0.0329)
        let MarkableShape = Markable_Shape(frame: frame, BoldText: boldText,NormalText: normalText ,view: self.view)
        view.addSubview(MarkableShape)
        let img = #imageLiteral(resourceName: "verify-check")
        let Checkimage = UIImageView(frame: CGRect(x: view.frame.width/2 - (img.size.width/2), y: MarkableShape.frame.maxY + view.frame.height*0.08, width: img.size.width , height: img.size.height))
        Checkimage.image = img
        Checkimage.contentMode = .scaleAspectFit
        view.addSubview(Checkimage)
        
        let y =  welcomeHeader(Checkimage.frame.maxY)
        
        
        let midLabel = CustomeLabel()
        
        midLabel.frame.origin.y  = y + view.frame.height*M.HEIGHT_32
       var title = "Enter the 4-digit code you received via sms"
        if language{
            title = "ادخل الارقام المبعوثة عبر الرسائل "
        }
        
        midLabel.OneLine(fontName: "OpenSans", FontSize: view.frame.height*0.0254 , text :title  ,textColor: .white)
        view.addSubview(midLabel)
        midLabel.frame.origin.x = view.frame.width/2 - midLabel.frame.width/2
        midLabel.adjustsFontSizeToFitWidth = true
         title = "* Enter the recieved code "
        if language{
                title = "*ادخل الكود المستقبل"
        }
        let codeTXF = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*M.HEIGHT_16 + midLabel.frame.maxY, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: title , view: view)
        view.addSubview(codeTXF)
        let resendButton  = ButtonWithGradient(frame: CGRect(x: codeTXF.frame.origin.x, y: view.frame.height*M.HEIGHT_32+codeTXF.frame.maxY, width: view.frame.width * 0.2, height: view.frame.height*0.017))
        title  = "Resend Code?"
        if language{
            title = "ابعت الكود ثانية؟"
        }
        resendButton.buttonWithBottomBorder(title: title, view: view)
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
        var title = "Thanks For Sign Up"
        if language {
            title = "شكرا لإنضمامك معنا "
        }
        let width = title.widthOfString(usingFont: UIFont(name: "OpenSans-Bold", size: view.frame.width*56/750)!)
        let height2 = title.height(constraintedWidth: width, font: UIFont(name: "OpenSans-Bold", size: view.frame.width*56/750)!)
       
        
        let welcomelabel = UILabel(frame: CGRect(x: view.frame.width/2-(width/2), y: M.HEIGHT_16+height, width: width, height: height2))
        welcomelabel.text = title
        welcomelabel.textColor = .white
        welcomelabel.numberOfLines = 0
        welcomelabel.font = UIFont(name: "OpenSans-Bold", size: view.frame.width*56/750)
        view.addSubview(welcomelabel)
        
        
        let secondlabel = CustomeLabel()
         title = "Verfiy Your Account"
        if language {
            title = "تأكيد حسابك "
        }
        secondlabel.OneLine(fontName: "OpenSans", FontSize: view.frame.height*0.025, text: title, textColor: .white)
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
        
        var title = "VERFIY"
        if language{
            title = "تأكيد"
        }
        
        let button = ButtonWithGradient(frame: CGRect(x: view.frame.width*0.09 , y: y+view.frame.height*M.HEIGHT_32, width: view.frame.width*0.82, height: view.frame.height*0.07), title:title , view: self.view)
        button.addTarget(self, action: #selector(verfiy_Pressed), for: .touchUpInside)
        view.addSubview(button)
        
        //last part
        let LabelsContainer  = UIView(frame: CGRect(x: button.frame.origin.x, y:  button.frame.maxY +  view.frame.height*M.HEIGHT_32 , width: button.frame.width, height: view.frame.height*0.03))
        var str  = "تسجيل الدخول "
        if !language{
            str = "Log In To Your Account"
        }
        let width = str.widthOfString(usingFont: UIFont(name: "OpenSans-SemiboldItalic", size: view.frame.width*24/750)!)
        let Firsttext = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: view.frame.height*0.03))
        // RememberMe.backgroundColor = .gray
        
        Firsttext.text  = str
        Firsttext.font =
            UIFont(name: "OpenSans-SemiboldItalic", size: view.frame.width*24/750)
        Firsttext.textColor = .white
        //Firsttext.adjustsFontSizeToFitWidth = true
        
        Firsttext.baselineAdjustment = .alignCenters
        Firsttext.textAlignment = .left
        LabelsContainer.addSubview(Firsttext)
        let tab = UITapGestureRecognizer(target: self, action: #selector( SignIn_Pressed))
        Firsttext.isUserInteractionEnabled = true
        Firsttext.addGestureRecognizer(tab)
        
        
        str = "ليس لديك حساب ؟ إشترك الآن"
        if !language{
            str = "Don't Have Any? Sign Up"
        }
        let width2 = str.widthOfString(usingFont: UIFont(name: "OpenSans-SemiboldItalic", size: view.frame.width*24/750)!)
        let SecondText = UILabel(frame: CGRect(x: LabelsContainer.frame.maxX - width2-view.frame.width*0.09, y: 0, width: width2, height: view.frame.height*0.03))
        SecondText.text = str
        

        SecondText.font = UIFont(name: "OpenSans-SemiboldItalic", size: view.frame.width*24/750)
        SecondText.textColor = .white
        //SecondText.adjustsFontSizeToFitWidth = true
        SecondText.baselineAdjustment = .alignCenters
        SecondText.isUserInteractionEnabled = true
        SecondText.textAlignment = .right
        let tap = UITapGestureRecognizer(target: self, action: #selector( SignUp_Pressed))
        SecondText.addGestureRecognizer(tap)
        SecondText.isUserInteractionEnabled = true
        LabelsContainer.addSubview(SecondText)
      
        
        view.addSubview(LabelsContainer)
        
        
        let lastParagraph = UILabel(frame: CGRect(x: LabelsContainer.frame.origin.x-10, y:  LabelsContainer.frame.maxY+view.frame.height*M.HEIGHT_16, width: view.frame.width - ((LabelsContainer.frame.origin.x-10)*2), height: view.frame.height*0.1 ))
       
        lastParagraph.text = "A code has been sent to your device via SMS.You can always verify your account by following the link sent to your ?E-mail account."
        if language{
            
             lastParagraph.text = "لقد تم إرسال رسالة نصية .تستطيع دائماً تفعيل حسابك عن طريق اتباع التعليمات المرسلة في بريدك الإلكتروني "
        }
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
