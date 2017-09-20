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
        
        setUpAll()
    
        //  Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
  
    func setUpAll(){
    
        let Container = UIView(frame: CGRect(x: view.frame.width/2 - (view.frame.width*0.5/2), y: view.frame.midY-(view.frame.width*0.5/2), width: view.frame.width*0.5, height: view.frame.width*0.5))
        //Container.backgroundColor = .red
        view.addSubview(Container)
        SetupContainer(Container)
        let FooterLabel = UILabel(frame: CGRect(x: view.frame.width*0.10, y: view.bounds.height-view.frame.height*1/40-20, width: view.frame.width - view.frame.width*0.1*2, height: view.frame.height*1/30))
        FooterLabel.text = "Copyright © 2017 Divey Inc. All rights reserved."
          FooterLabel.font = UIFont(name: "OpenSans", size: 24)
        FooterLabel.textColor = .white
        FooterLabel.textAlignment = .center
        FooterLabel.adjustsFontSizeToFitWidth = true
        FooterLabel.minimumScaleFactor = 0.5
        FooterLabel.numberOfLines = 1
        FooterLabel.baselineAdjustment = .alignCenters
        FooterLabel.textAlignment = .center
        view.addSubview(FooterLabel)
        
    
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
       
        label.font = UIFont(name: "OpenSans-Bold", size: 34)
        
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
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
