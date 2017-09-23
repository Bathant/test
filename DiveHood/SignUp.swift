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
       override func viewDidLoad() {
        super.viewDidLoad()
        Controllers = [DiverController() , BusinessOwnerController()]
        
        scrollview = UIScrollView(frame: CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        //scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 3000)
        view.addSubview(scrollview)
        
        setbackground()
        let height = markableLabel()
        var frame = CGRect(x: scrollview.frame.width/2-(view.frame.width*0.625/2), y: view.frame.height*0.06+height, width: view.frame.width*0.625, height: view.frame.height*0.06)
        let welcomelabel = CustomeLabel(frame: frame, text: "Welcome!", adjustTofit: true, size: view.frame.height*0.04, fontName: "OpenSans-Bold")
        scrollview.addSubview(welcomelabel)
        frame = CGRect(x: welcomelabel.frame.minX, y: welcomelabel.frame.maxY, width: welcomelabel.frame.width, height: welcomelabel.frame.height/2)
        let secondlabel = CustomeLabel(frame: frame, text: "Become A Divehoodian", adjustTofit: true, size: view.frame.height*0.025, fontName: "OpenSans-Bold")
        
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
        
        
        let items = ["Diver", "Business Owner"]
        let segment  = UISegmentedControl(items: items)
        segment.frame = CGRect(x: view.frame.width*0.05, y: y, width: view.frame.width-(view.frame.width*0.05*2), height: view.frame.height*0.0445)
        segment.selectedSegmentIndex = 0
        segment.tintColor = Colors().blue
        scrollview.addSubview(segment)
        
        
        container = UIView(frame: CGRect(x: 0, y: view.frame.height*0.048+segment.frame.maxY, width: view.frame.width, height: view.frame.height*0.7))
        //container.backgroundColor = .red
        scrollview.addSubview(container)
        DiverControllerfunc(0)
        BusinessOwnerControllerfunc(container.frame.width)
        
        segment.addTarget(self, action: #selector(segmentChange), for: .valueChanged)
      
        
        
        
        var img = #imageLiteral(resourceName: "Check_Box")
        let x = view.frame.width*0.0426+img.size.width+view.frame.width*0.09
        let AccountLabel = UIView(frame: CGRect(x: x, y: container.frame.maxY+view.frame.height*0.0479, width: view.frame.width-(x*2), height: view.frame.height*0.025))
        
       
        let firsttext = UILabel(frame: CGRect(x: 0, y: 0, width: AccountLabel.frame.width, height: AccountLabel.frame.height))
        firsttext.font = UIFont(name: "OpenSans-SemiboldItalic", size: view.frame.width*0.032)
        firsttext.textAlignment = .left
        firsttext.baselineAdjustment = .alignCenters
        firsttext.textColor = .white
        let boldText  = "Already Have A DiveHood Account?"
        let attrs = [NSForegroundColorAttributeName:UIColor.white ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        let normalText = "Sign In"
        let attrs2 = [NSForegroundColorAttributeName:Colors().blue]
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        firsttext.attributedText = attributedString
        firsttext.adjustsFontSizeToFitWidth = true
        let tab = UITapGestureRecognizer(target: self, action: #selector( SignIn_Pressed))
        firsttext.isUserInteractionEnabled = true
        firsttext.addGestureRecognizer(tab)
        AccountLabel.addSubview(firsttext)
        
      scrollview.addSubview(AccountLabel)
    
        
        
         img = #imageLiteral(resourceName: "or")
        let orimage = UIImageView(frame: CGRect(x: view.frame.width/2-(img.size.width/2), y: AccountLabel.frame.maxY+view.frame.height*0.0239, width: img.size.width, height: img.size.height))
        orimage.image = img
        scrollview.addSubview(orimage)
        
        
        img = #imageLiteral(resourceName: "Login-Facebook")
        let facebookimg = UIImageView(frame: CGRect(x: view.frame.width/2-(img.size.width/2), y: orimage.frame.maxY+view.frame.height*0.0426, width: img.size.width, height: img.size.height))
        facebookimg.image = img
        scrollview.addSubview(facebookimg)
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: facebookimg.frame.maxY+view.frame.height*0.0426)
        
        
    }
    func Verfication_Pressed(){
        let controller = Controllers[0] as! DiverController
        if controller.verficationChecked {
                present(VerficationViaPhone(), animated: true, completion: nil)
        }
        else{
        present(VerficationViaMail(), animated: true, completion: nil)
        
        }
    
    
    }
    
    func segmentChange(sender:UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            setupControllers(0, 0)
            setupControllers(1, container.frame.width)
        case 1:
            setupControllers(0, container.frame.width)
            setupControllers(1, 0)
            
        default:
            break
            
            
        }
        
        
        
    }
    func setupControllers(_ Index:Int, _ x:CGFloat){
        
        
        Controllers[Index].view.frame = CGRect(x: x, y:  0 , width: container.frame.width, height: container.frame.height)
        
    }
    
    
    
    
    func markableLabel () -> CGFloat{
        
        
        let markableContainer = UIView(frame: CGRect(x: 0, y: view.frame.height*0.086, width: view.frame.width*0.45, height: view.frame.height*0.04))
        markableContainer.backgroundColor = Colors().gray
        let textlabel = UILabel(frame: CGRect(x: view.frame.width*0.025, y: 0, width: markableContainer.frame.width-(view.frame.width*0.025*2), height: markableContainer.frame.height))
        textlabel.font = UIFont(name: "OpenSans-Bold", size: 66)
        
        let boldText  = "CREATE "
        let attrs = [NSFontAttributeName :  UIFont(name: "OpenSans-Bold", size: 66) ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        let normalText = "a Divehood Account"
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
        let controller = BusinessOwnerController()
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
