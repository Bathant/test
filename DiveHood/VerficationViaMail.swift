//
//  VerficationViaMail.swift
//  DiveHood
//
//  Created by starwallet on 9/22/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class VerficationViaMail: UIViewController {
    let M = Measurements()
    var language :Bool =   AppDelegate.sharedInstance().language!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        // Do any additional setup after loading the view.
    }
    func setupUi(){
        setbackground()
        var  boldText  = "VERFIY "
        var  normalText = "via Email"
        if language{
            boldText = "التأكيد"
            normalText = "عبر البريد الإلكتروني"
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
        
        midLabel.frame.origin.y  = y + view.frame.height*M.HEIGHT_16
        var text = "Haven’t received your email yet?"
        if language{
            text = "لم تستقبل بريدك بعد ؟"
        }
        midLabel.OneLine(fontName: "OpenSans", FontSize: view.frame.height*0.0254 , text :text  ,textColor: .white)
        view.addSubview(midLabel)
        midLabel.frame.origin.x = view.frame.width/2 - midLabel.frame.width/2
        text = "* Enter Your Email To resend"
        if language{
            text = "ادخل بريدك لإعادة الإرسال"
        }
        let codeTXF = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*M.HEIGHT_16 + midLabel.frame.maxY, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: text, view: view)
        
        view.addSubview(codeTXF)
        
        lastPart(codeTXF.frame.maxY)
        
        
        
        
        
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
        
        let frame = CGRect(x: view.frame.width/2-(view.frame.width*0.6/2), y: view.frame.height*M.HEIGHT_16+welcomelabel.frame.maxY, width: view.frame.width*0.6, height: view.frame.height*0.07)
        
        
        title = "Check your email to recieve your confirmation link"
        if language{
            title = "تفقد بريدك الألكتروني للحصول علي رسالة التأكيد "
        }
        
        
        let secondlabel = CustomeLabel(frame: frame, text:title, adjustTofit: false, size: view.frame.height*0.02, fontName: "OpenSans")
        
        //secondlabel.backgroundColor = .gray
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
       var  title = "RESEND E-MAIL"
        if language{
            title = "إعادة إرسال البريد الإلكتروني "
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
        
         title = "Often, confirmation emails will get caught in a spam filter, so be sure to look there."
        if language{
            title = "غالبا ما تبعث رسائلنا الإلكترونية في ملف السبام فتأكد من  وجوده في جميع ملفاتك"
        }
        lastParagraph.text = title
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
