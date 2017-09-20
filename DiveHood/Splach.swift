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
         SetupUi()
        
        
          Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    func SetupUi(){
    let image = UIImage(named: "radarlogo")
    
    let LogoImage = UIImageView(frame: CGRect(x: (view.frame.width/2 - ((view.frame.width*0.50)/2)) , y: (view.frame.height/2-((view.frame.width*0.50)/2)), width: (view.frame.width*0.50), height: (view.frame.width*0.50)))
    //LogoImage.backgroundColor = .gray
    let label = UILabel(frame: CGRect(x: view.frame.width*0.05, y: view.bounds.midY+view.frame.height*2/25, width: view.frame.width - view.frame.width*0.05*2, height: view.frame.height*1/30))
    label.text = "The Best diving Booking Services"
    label.textColor = .white
    label.textAlignment = .center
    label.font = UIFont(name: "OpenSans-Bold", size: view.frame.height*1/40)
    label.baselineAdjustment = .alignCenters
    view.addSubview(label)
    //label.backgroundColor = .black
    let waveimg = #imageLiteral(resourceName: "waves")
    
    let WaveImage = UIImageView(frame: CGRect(x: (view.frame.width/2 - ((LogoImage.frame.width*0.50)/2)) , y: label.frame.origin.y+label.frame.height + view.frame.height*1/40 , width: (LogoImage.frame.width*0.50), height:waveimg.size.height))
    WaveImage.image = #imageLiteral(resourceName: "waves")
    view.addSubview(WaveImage)
    
    LogoImage.image = image
    LogoImage.contentMode = .scaleAspectFit
    view.addSubview(LogoImage)
    let FooterLabel = UILabel(frame: CGRect(x: view.frame.width*0.10, y: view.bounds.height-view.frame.height*1/40-20, width: view.frame.width - view.frame.width*0.1*2, height: view.frame.height*1/30))
    FooterLabel.text = "Copyright © 2017 Divey Inc. All rights reserved."
    FooterLabel.textColor = .white
    FooterLabel.textAlignment = .center
    
    FooterLabel.font = UIFont(name: "OpenSans", size: view.frame.height*1/50)
    FooterLabel.baselineAdjustment = .alignCenters
    view.addSubview(FooterLabel)
    
    
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
