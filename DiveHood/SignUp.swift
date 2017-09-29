//
//  SignUp.swift
//  DiveHood
//
//  Created by starwallet on 9/22/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class SignUp: UIViewController {
    
    var container : UIView!
    var Controllers : [UIViewController]!
    var   scrollview : UIScrollView!
    var AccountLabel: UIView!
    var language : Bool = AppDelegate.sharedInstance().language!
    var footerCntainer:UIView!
       override func viewDidLoad() {
        super.viewDidLoad()
        Controllers = [DiverController() , BusinessOwnerController()]
        
        scrollview = UIScrollView(frame: CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        //scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 3000)
        view.addSubview(scrollview)
        
        setbackground()
        let height = markableLabel()
        var frame = CGRect(x: scrollview.frame.width/2-(view.frame.width*0.625/2), y: view.frame.height*0.06+height, width: view.frame.width*0.625, height: view.frame.height*0.06)
        var title = "مرحبا!"
        if !language{
            title = "Welcome!"
        }
        
        
        let welcomelabel = CustomeLabel(frame: frame, text: title, adjustTofit: true, size: view.frame.height*0.04, fontName: "OpenSans-Bold")
        scrollview.addSubview(welcomelabel)
        title = "فلتصبح عضواً"
        if !language{
            title  = "Become A Divehoodian"
        }
        frame = CGRect(x: welcomelabel.frame.minX, y: welcomelabel.frame.maxY, width: welcomelabel.frame.width, height: welcomelabel.frame.height/2)
        let secondlabel = CustomeLabel(frame: frame, text: title, adjustTofit: true, size: view.frame.height*0.025, fontName: "OpenSans-Bold")
        
        scrollview.addSubview(secondlabel)
      
        let waveImage = UIImageView(frame: CGRect(x: view.frame.width/2-(#imageLiteral(resourceName: "waves").size.width/2), y: secondlabel.frame.origin.y+secondlabel.frame.height+view.frame.height*0.015, width: #imageLiteral(resourceName: "waves").size.width, height: #imageLiteral(resourceName: "waves").size.height))
       
        waveImage.image = #imageLiteral(resourceName: "waves")
       
        
        waveImage.contentMode = .scaleToFill
        
         waveImage.frame.origin = CGPoint(x: view.frame.width/2-waveImage.frame.width/2, y: secondlabel.frame.origin.y+secondlabel.frame.height+view.frame.height*0.015)
        
        print("wave image size is \(waveImage.frame.size)")
         print("wave image origin is \(waveImage.frame.origin)")
        scrollview.addSubview(waveImage)
        print(waveImage.frame.maxY)
        print(waveImage.frame.height+waveImage.frame.origin.y)
        
        setupSegmentedControl(view.frame.height*0.048+waveImage.frame.maxY)
        
    }
    func setbackground(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "splashbg")
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func setupSegmentedControl(_ y : CGFloat){
        var items = ["صاحب عمل ", "غواص"]
        if !language{
         items =  ["Diver", "Business Owner"]
        }
        let segment  = UISegmentedControl(items: items)
        segment.frame = CGRect(x: view.frame.width*0.05, y: y, width: view.frame.width-(view.frame.width*0.05*2), height: view.frame.height*0.0445)
         segment.selectedSegmentIndex = 0
        if language{
             segment.selectedSegmentIndex = 1
        }
       
        segment.tintColor = Colors().blue
        scrollview.addSubview(segment)
        
        
        container = UIView(frame: CGRect(x: 0, y: view.frame.height*0.048+segment.frame.maxY, width: view.frame.width, height: view.frame.height*0.7))
        //container.backgroundColor = .red
        scrollview.addSubview(container)
        DiverControllerfunc(0)
        BusinessOwnerControllerfunc(container.frame.width)
        
        segment.addTarget(self, action: #selector(segmentChange), for: .valueChanged)
      
        Footer(maxy: container.frame.maxY)
        
        
        
        
    }
    
    func Footer(maxy :CGFloat ){
    
        var Checkimg = #imageLiteral(resourceName: "Check_Box")
         var Orimg = #imageLiteral(resourceName: "or")
            var FacebbokImage = #imageLiteral(resourceName: "Login-Facebook")
         let x = view.frame.width*0.0426+Checkimg.size.width+view.frame.width*0.09
        let  FooterHeight  = view.frame.height*0.025+Orimg.size.height+FacebbokImage.size.height+view.frame.height*0.0426+view.frame.height*0.0239
         footerCntainer = UIView(frame: CGRect(x: x, y: maxy+view.frame.height*Measurements().HEIGHT_32, width: view.frame.width - (2*x), height: FooterHeight))
      //  footerCntainer.backgroundColor = .gray
       
         AccountLabel = UIView(frame: CGRect(x: 0, y: 0, width: footerCntainer.frame.width, height: view.frame.height*0.025))
        //container.backgroundColor = .gray
        
        let firsttext = UILabel(frame: CGRect(x: 0, y: 0, width: AccountLabel.frame.width, height: AccountLabel.frame.height))
        firsttext.font = UIFont(name: "OpenSans-SemiboldItalic", size: view.frame.width*0.032)
        firsttext.textAlignment = .left
        firsttext.baselineAdjustment = .alignCenters
        firsttext.textColor = .white
        var boldText  =  "لديك حساب مسبقاً؟"
        if !language{
            boldText = "Already Have A DiveHood Account?"
        }
       
        
        let attrs = [NSForegroundColorAttributeName:UIColor.white ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        var normalText = " تسجيل الدخول"
        
        if !language{
        normalText = "Sign In"
        }
        
        let attrs2 = [NSForegroundColorAttributeName:Colors().blue]
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        firsttext.attributedText = attributedString
        firsttext.adjustsFontSizeToFitWidth = true
        let tab = UITapGestureRecognizer(target: self, action: #selector( SignIn_Pressed))
        firsttext.isUserInteractionEnabled = true
        firsttext.addGestureRecognizer(tab)
        firsttext.textAlignment = .center
        AccountLabel.addSubview(firsttext)
        
        footerCntainer.addSubview(AccountLabel)
        
        
        
       
        let orimage = UIImageView(frame: CGRect(x: footerCntainer.frame.width/2-(Orimg.size.width/2), y: AccountLabel.frame.maxY+view.frame.height*0.0239, width: Orimg.size.width, height: Orimg.size.height))
        orimage.image = Orimg
        footerCntainer.addSubview(orimage)
        
        

        let facebookimg = UIImageView(frame: CGRect(x: footerCntainer.frame.width/2-(FacebbokImage.size.width/2), y: orimage.frame.maxY+view.frame.height*0.0426, width: FacebbokImage.size.width, height: FacebbokImage.size.height))
        facebookimg.image = FacebbokImage
        footerCntainer.addSubview(facebookimg)
        scrollview.addSubview(footerCntainer)
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: footerCntainer.frame.maxY+view.frame.height*0.0426)
        
    
    
    }
    
    
 
    func segmentChange(sender:UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            if language{
                setupControllers(0, container.frame.width)
                setupControllers(1, 0)
            }
            else{
            setupControllers(0, 0)
            setupControllers(1, container.frame.width)
            }
            
        case 1:
           
            if language{
                setupControllers(0, 0)
                setupControllers(1, container.frame.width)
            }
            else{
                setupControllers(0, container.frame.width)
                setupControllers(1, 0)
            }
        default:
            break
            
            
        }
        
        
        
    }
    func setupControllers(_ Index:Int, _ x:CGFloat){
        
        
        Controllers[Index].view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        if x == 0 {
        
            if Index == 0{
            let temp = Controllers[0] as! DiverController
                container.frame.size.height = temp.ContainerHeight
                footerCntainer.removeFromSuperview()
              
                Footer(maxy: container.frame.maxY)
                
            }
            else{
            
                let temp = Controllers[1] as! BusinessOwnerController
                container.frame.size.height = temp.stepOneFormHeight
                  footerCntainer.removeFromSuperview()
                 Footer(maxy: container.frame.maxY)
            
            }
        
        
        }
    }
    
    
    
    
    func markableLabel () -> CGFloat{
        
        
       
        
        
        var boldText = "اصنع"
        if !language{
         boldText  = "CREATE "
        }
        let width1 = boldText.widthOfString(usingFont: UIFont(name: "OpenSans-Bold", size: 32*view.frame.width/750)!)
        
        
        
        let attrs = [NSFontAttributeName :  UIFont(name: "OpenSans-Bold", size: 24*view.frame.width/750) ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        var normalText = " حسابك"
        if !language{
         normalText = "a Divehood Account"
        }
        let width2 = normalText.widthOfString(usingFont: UIFont(name: "OpenSans", size: 32*view.frame.width/750)!)
        let attrs2 = [NSFontAttributeName :  UIFont(name: "OpenSans", size: 24*view.frame.width/750)]
        
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        
        let markableContainer = UIView(frame: CGRect(x: 0, y: view.frame.height*0.086, width: width1+width2, height: view.frame.height*0.04))
        markableContainer.backgroundColor = Colors().gray
        let textlabel = UILabel(frame: CGRect(x: view.frame.width*0.025, y: 0, width: markableContainer.frame.width-(view.frame.width*0.025*2), height: markableContainer.frame.height))
      
        textlabel.attributedText = attributedString
    
        textlabel.textAlignment = .center
        textlabel.textColor = .black
        markableContainer.addSubview(textlabel)
        scrollview.addSubview(markableContainer)
        return markableContainer.frame.origin.y+markableContainer.frame.height
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func DiverControllerfunc(_ x:CGFloat){
        
        
        let controller = DiverController()
        controller.view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        
        addChildViewController(controller)
        container.addSubview((controller.view)!)
        controller.didMove(toParentViewController: self)
        Controllers[0] = controller
        
        
    }
    
    func BusinessOwnerControllerfunc(_ x:CGFloat){
        let controller = BusinessOwnerController(SignupInstance: self)
        controller.view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        addChildViewController(controller)
        container.addSubview((controller.view)!)
        controller.didMove(toParentViewController: self)
        
        Controllers[1] = controller
        
        
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
