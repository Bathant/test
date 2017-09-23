//
//  Splach.swift
//  DiveHood
//
//  Created by starwallet on 9/19/17.
//  Copyright © 2017 starwallet. All rights reserved.
// 320 480 
// 1/30 >> 16 
//2/30 >> 32
// 1/40 >> 12
//
import UIKit

class Splach: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setbackground()
        print("##############****************################")
        print(UIScreen.main.bounds.width*2)
        print(UIScreen.main.bounds.height*2)
        setUpAll()
    
          Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    func setbackground(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "splashbg")
        self.view.insertSubview(backgroundImage, at: 0)
    }
  
    func setUpAll(){
    
        let Container = UIView(frame: CGRect(x: view.frame.width/2 - (view.frame.width*0.5/2), y: view.frame.midY-(view.frame.width*0.5/2), width: view.frame.width*0.5, height: view.frame.width*0.5))
        //Container.backgroundColor = .red
        view.addSubview(Container)
        SetupContainer(Container)
        
        
        let CopyrightLabel = UILabel()
        CopyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(CopyrightLabel)
        CopyrightLabel.centerXAnchor.isEqual(view.centerXAnchor)
        view.addConstraint(NSLayoutConstraint(item: CopyrightLabel, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 0))
         view.addConstraint(NSLayoutConstraint(item: CopyrightLabel, attribute: .bottom , relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -1*(view.frame.height*0.02) ))
         view.addConstraint(NSLayoutConstraint(item: CopyrightLabel, attribute: .centerX , relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant:0 ))
        CopyrightLabel.text = "Copyright © 2017 Divey Inc. All rights reserved."
        CopyrightLabel.font = UIFont(name: "OpenSans", size: 24)
        CopyrightLabel.textColor = .white
        CopyrightLabel.textAlignment = .center
        CopyrightLabel.adjustsFontSizeToFitWidth = true
        CopyrightLabel.numberOfLines = 1
        CopyrightLabel.baselineAdjustment = .alignCenters
        CopyrightLabel.textAlignment = .center
        
    }
    func SetupContainer(_ contanier:UIView){
        //backImage
        let image = UIImage(named: "radarlogo")
        let LogoImage = UIImageView(frame: CGRect(x: 0  , y: 0, width: contanier.frame.width, height: contanier.frame.height*0.9))
        LogoImage.image = image
        LogoImage.contentMode = .scaleAspectFit
        contanier.addSubview(LogoImage)
        //WaveImage
        let waveimg = #imageLiteral(resourceName: "waves")
        let WaveImage = UIImageView()
        
        let label = UILabel()
        
        
     
        
        label.frame.origin = CGPoint(x: view.frame.width*0.05, y: contanier.frame.origin.y+contanier.frame.height*0.7)
        label.text = "The Best diving Booking Services"
        label.textColor = .white
       
        label.font = UIFont(name: "OpenSans-Bold", size: view.frame.height*0.024)
        
        //label.adjustsFontSizeToFitWidth = true
        
        label.numberOfLines = 1
        label.frame.size.width =  view.frame.width - view.frame.width*0.05*2
        label.frame.size.height = contanier.frame.height*0.2
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .center
        view.addSubview(label)

    
        
        
        //WaveImage.backgroundColor = .black
        WaveImage.frame.origin.y = contanier.frame.height*0.92
        WaveImage.frame.origin.x = contanier.frame.width/2 - waveimg.size.width/2
        WaveImage.frame.size = waveimg.size
        WaveImage.image = #imageLiteral(resourceName: "waves")
        contanier.addSubview(WaveImage)
        
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func splashTimeOut(sender : Timer){
        let loginController = LoginPage()
        AppDelegate.sharedInstance().window?.rootViewController = loginController
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
