//
//  CartViewController.swift
//  DiveHood
//
//  Created by starwallet on 9/28/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    var WidthOfScreen :CGFloat!
    var HeightOfScreen : CGFloat!
    var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupnavigation(viewController: self, Title: "Check Out")
        self.SetupStautsBar(viewx: self.view)
        self.SetupGradient(viewx: view)
        scrollview = UIScrollView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: view.frame.height))
        setupui()
        
        // Do any additional setup after loading the view.
    }
    
    
    func  setupui(){
        WidthOfScreen = view.frame.width
        HeightOfScreen = view.frame.height
        
        view.addSubview(scrollview)
       // scrollview.backgroundColor =  UIColor(red: 48/255, green: 37/255, blue: 67/255, alpha: 1.0)
        let viewx = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height:  HeightOfScreen*130/1334))
      viewx.backgroundColor =  UIColor(red: 48/255, green: 37/255, blue: 67/255, alpha: 1.0)
     
        let container = UIView(frame: CGRect(x: WidthOfScreen*25/750, y:0, width: WidthOfScreen-((WidthOfScreen*25/750)*2), height: HeightOfScreen*130/1334))
        let firstlabel = makeSecondPartLabels(text: "PACKGE TYPE", textalignment: .left, container: container ,y: WidthOfScreen*25/750, .white , "OpenSans-Bold", WidthOfScreen*24/750)
        let secondLabel =   makeSecondPartLabels(text: "PRICE / PERSON", textalignment: .center, container: container, y: WidthOfScreen*25/750 ,.white,"OpenSans-Bold",WidthOfScreen*24/750)
        let thirdLabel =  makeSecondPartLabels(text: "GUSETS", textalignment: .right, container: container ,y: WidthOfScreen*25/750, .white,"OpenSans-Bold", WidthOfScreen*24/750)
        let Fourthlabel =  makeSecondPartLabels(text: "For Diver", textalignment: .left, container: container, y: firstlabel.frame.maxY+HeightOfScreen*16/1334, UIColor(red: 237/255, green: 202/255, blue: 12/255, alpha: 1.0), "OpenSans-Bold",WidthOfScreen*24/750)
        Fourthlabel.frame.origin.x = 10*WidthOfScreen/750
        makeSecondPartLabels(text: "20.783 EGP", textalignment: .center, container: container, y: secondLabel.frame.maxY+HeightOfScreen*16/1334,UIColor(
            red: 237/255, green: 202/255, blue: 12/255, alpha: 1.0),  "OpenSans-Bold",WidthOfScreen*24/750)
       
        viewx.addSubview(container)
           scrollview.addSubview(viewx)
        
        
        
        //490
        let BigMidContainer = UIView(frame: CGRect(x: 0, y: viewx.frame.maxY, width: WidthOfScreen, height: HeightOfScreen*490/1334))
        let Midcontainer = UIView(frame: CGRect(x:  WidthOfScreen*25/750, y: 0, width: WidthOfScreen-(WidthOfScreen*25/750*2), height: HeightOfScreen*490/1334))
        
       
        let Midcontainer_label1 = makeSecondPartLabels(text: "Brothers, Daedalus and Elphinstone ( 8-18 July )", textalignment: .left, container: Midcontainer ,y: WidthOfScreen*25/750, UIColor(red: 213/255,green:  183/255,blue: 23/255, alpha:1.0 ) , "OpenSans-SemiBold", WidthOfScreen*24/750)
        let Midcontainer_label2 = makeSecondPartLabels(text: "Cabin: 1 Twin Cabin Lower Deck", textalignment: .left, container: Midcontainer ,y: Midcontainer_label1.frame.maxY+HeightOfScreen*25/1334, .white , "OpenSans", WidthOfScreen*22/750 )
        let Midcontainer_label3 = makeSecondPartLabels(text: "Occupancy: Shared ", textalignment: .left, container: Midcontainer ,y: Midcontainer_label2.frame.maxY, .white , "OpenSans", WidthOfScreen*22/750 )
           let Midcontainer_label4 = makeSecondPartLabels(text: "Package: 1 х Diver", textalignment: .left, container: Midcontainer ,y: Midcontainer_label3.frame.maxY, .white , "OpenSans", WidthOfScreen*22/750 )
        
        let seprator = UIView(frame: CGRect(x: view.frame.origin.x, y: Midcontainer_label4.frame.maxY+HeightOfScreen*25/1334, width: WidthOfScreen, height: 1))
        seprator.backgroundColor = UIColor(red: 65/255, green: 56/255, blue: 83/255, alpha: 1.0)
        BigMidContainer.addSubview(seprator)
        
        
        
        let Midcontainer_label5 = makeSecondPartLabels(text: "Cabin: 2 Quad stateroom ", textalignment: .left, container: Midcontainer ,y: seprator.frame.maxY+HeightOfScreen*25/1334, .white , "OpenSans", WidthOfScreen*22/750 )
        let Midcontainer_label6 = makeSecondPartLabels(text: "Occupancy: Shared", textalignment: .left, container: Midcontainer ,y: Midcontainer_label5.frame.maxY, .white , "OpenSans", WidthOfScreen*22/750 )
        let Midcontainer_label7 = makeSecondPartLabels(text: "Package: 1 х Diver", textalignment: .left, container: Midcontainer ,y: Midcontainer_label6.frame.maxY, .white , "OpenSans", WidthOfScreen*22/750 )
        
        let seprator2 = UIView(frame: CGRect(x: 0, y: Midcontainer_label7.frame.maxY+HeightOfScreen*25/1334, width: WidthOfScreen, height: 1))
        seprator2.backgroundColor = UIColor(red: 65/255, green: 56/255, blue: 83/255, alpha: 1.0)
        BigMidContainer.addSubview(seprator2)
        
        let Midcontainer_label8 = makeSecondPartLabels(text: "ToTAL", textalignment: .left, container: Midcontainer ,y: seprator2.frame.maxY+HeightOfScreen*25/1334, UIColor(red: 173/255,green:  155/255,blue: 26/255, alpha:1.0 ) , "OpenSans-Bold", WidthOfScreen*22/750 )
        let Midcontainer_label9 = makeSecondPartLabels(text: "120.783", textalignment: .left, container: Midcontainer ,y: Midcontainer_label8.frame.maxY, UIColor(
            red: 237/255, green: 202/255, blue: 12/255, alpha: 1.0) , "OpenSans-Bold", WidthOfScreen*34/750 )
        Midcontainer_label9.sizeToFit()
        let Midcontainer_label10 = makeSecondPartLabels(text: "EGP", textalignment: .left, container: Midcontainer ,y:Midcontainer_label9.frame.minY+Midcontainer_label9.frame.height/6, .white , "OpenSans", WidthOfScreen*22/750 )
        Midcontainer_label10.frame.origin.x = Midcontainer_label9.frame.maxX
        
    
        
        let seprator3 = UIView(frame: CGRect(x: 0, y: Midcontainer_label9.frame.maxY+HeightOfScreen*25/1334, width: WidthOfScreen, height: 1))
        seprator3.backgroundColor = UIColor(red: 65/255, green: 56/255, blue: 83/255, alpha: 1.0)
        BigMidContainer.addSubview(seprator3)
        
        ////////////////////// Radio Buttons /////////////////////////////////////////
        
        //*********************RadioButton1**********************************
        let BiglastContainer = UIView(frame: CGRect(x: 0, y: BigMidContainer.frame.maxY, width: view.frame.width, height: view.frame.height*630/1334))
        BiglastContainer.backgroundColor = UIColor(red: 48/255, green: 37/255, blue: 67/255, alpha: 1.0)
         let lastcontainer = UIView(frame: CGRect(x:  WidthOfScreen*25/750, y: 0, width: WidthOfScreen-(WidthOfScreen*25/750*2), height: HeightOfScreen*565/1334))
            let radio1 = DLRadioButton()
            radio1.frame.origin = CGPoint(x: 0, y: WidthOfScreen*25/750)
            radio1.frame.size = radio1.intrinsicContentSize
        lastcontainer.addSubview(radio1)
        
         let Radio1_label1 = makeSecondPartLabels(text: "Pay Now", textalignment: .left, container: lastcontainer ,y:radio1.frame.midY-radio1.frame.height/3, .white , "OpenSans", WidthOfScreen*24/750 )
        Radio1_label1.frame.origin.x = radio1.frame.maxX+16*WidthOfScreen/750
        
        //Non refundable
        let Radio1_label2 = makeSecondPartLabels(text: "Non refundable", textalignment: .left, container: lastcontainer ,y:Radio1_label1.frame.maxY, UIColor(red:213/255 , green: 183/255, blue: 23/255, alpha: 1.0) , "OpenSans", WidthOfScreen*22/750 )
        Radio1_label2.frame.origin.x = radio1.frame.maxX+16*WidthOfScreen/750
       
        
        let seprator4 = UIView(frame: CGRect(x: 0, y: Radio1_label2.frame.maxY+HeightOfScreen*25/1334, width: WidthOfScreen, height: 1))
        seprator4.backgroundColor = UIColor(red: 65/255, green: 56/255, blue: 83/255, alpha: 1.0)
        BiglastContainer.addSubview(seprator4)
        
         //*********************RadioButton2**********************************
       let y =  RadiobuttonWithLabelsSection(BeginY: seprator4.frame.maxY+WidthOfScreen*25/750, text1: "Pay later", text2: "Pay before the trip by 1 week max", Container: lastcontainer)
        let Radio1_label3 = makeSecondPartLabels(text: "Non refundable- Free Cancelation Before 15 september 2017", textalignment: .left, container: lastcontainer ,y:y, UIColor(red:213/255 , green: 183/255, blue: 23/255, alpha: 1.0) , "OpenSans", WidthOfScreen*22/750 )
        Radio1_label3.frame.origin.x = radio1.frame.maxX+16*WidthOfScreen/750
        let seprator5 = UIView(frame: CGRect(x: 0, y: Radio1_label3.frame.maxY+HeightOfScreen*25/1334, width: WidthOfScreen, height: 1))
        seprator5.backgroundColor = UIColor(red: 65/255, green: 56/255, blue: 83/255, alpha: 1.0)
        BiglastContainer.addSubview(seprator5)
        
         //*********************RadioButton3**********************************
        
        let y1 =  RadiobuttonWithLabelsSection(BeginY: seprator5.frame.maxY+WidthOfScreen*25/750, text1: "Pay on arrival", text2: "No Payment Needed – pay at the property", Container: lastcontainer)
        let seprator6 = UIView(frame: CGRect(x: 0, y: y1+HeightOfScreen*25/1334, width: WidthOfScreen, height: 1))
        seprator6.backgroundColor = UIColor(red: 65/255, green: 56/255, blue: 83/255, alpha: 1.0)
        BiglastContainer.addSubview(seprator6)
        
    
        
        
         let Wallet_label1 = makeSecondPartLabels(text: "My wallet Balance", textalignment: .left, container: lastcontainer ,y:seprator6.frame.maxY+WidthOfScreen*25/750, .white , "OpenSans-Bold", WidthOfScreen*24/750 )
        
        let WalletMoney_label1 = makeSecondPartLabels(text: "20.783 EGP", textalignment: .right, container: lastcontainer ,y:seprator6.frame.maxY+WidthOfScreen*25/750, UIColor(red: 237/255,green:202/255,blue: 12/255, alpha: 1.0) , "OpenSans-Semibold", WidthOfScreen*24/750)
     
        
        let RefindBigView = UIView(frame: CGRect(x: 0, y:WalletMoney_label1.frame.maxY+WidthOfScreen*25/750 , width: view.frame.width, height: HeightOfScreen*65/1334))
        RefindBigView.backgroundColor = UIColor(red: 44/255, green: 34/255, blue: 61/255, alpha: 1.0)
        
        let checkimage = UIImageView()
        checkimage.frame.origin = CGPoint(x: WidthOfScreen*25/750, y: RefindBigView.frame.height/2-#imageLiteral(resourceName: "Check_Box").size.height/2)
        checkimage.image = #imageLiteral(resourceName: "Check_Box")
        checkimage.sizeToFit()
        RefindBigView.addSubview(checkimage)
        
         let Refind_label1 = makeSecondPartLabels(text: "Refunded money from my wallet", textalignment: .left, container: RefindBigView ,y: checkimage.frame.midY-checkimage.frame.height/3, UIColor(red: 77/255,green:194/255,blue: 230/255, alpha: 1.0) , "OpenSans-Semibold", WidthOfScreen*24/750)
        Refind_label1.frame.origin.x =  checkimage.frame.maxX+16*WidthOfScreen/750
        
        
        
        
        BiglastContainer.addSubview(RefindBigView)
        
        BiglastContainer.addSubview(lastcontainer)
        
        
        
        BigMidContainer.backgroundColor =  UIColor(red: 44/255, green: 34/255, blue: 61/255, alpha: 1.0)
        BigMidContainer.addSubview(Midcontainer)
        scrollview.addSubview(BigMidContainer)
        
        
        
        scrollview.addSubview(BiglastContainer)
        
        //let rbtn = DLRadioButton(frame: CGRect()
       
        
     let button =    ButtonWithGradient(frame: CGRect(x:0 , y:BiglastContainer.frame.maxY, width: view.frame.width, height : view.frame.height*88/1334 ), title: "CONFIRM YOUR ORDER", view: view)
        
        scrollview.addSubview(button)
        
        scrollview.contentSize = CGSize(width: view.frame.width, height:button.frame.origin.y+button.frame.height+(self.navigationController?.navigationBar.frame.maxY)! )
      
        
        
        
    }
    func RadiobuttonWithLabelsSection(BeginY: CGFloat, text1: String , text2: String ,Container : UIView )->CGFloat{
        
        let radio1 = DLRadioButton()
        radio1.frame.origin = CGPoint(x: 0, y: BeginY)
        radio1.frame.size = radio1.intrinsicContentSize
        Container.addSubview(radio1)
        let Radio1_label1 = makeSecondPartLabels(text: text1, textalignment: .left, container: Container ,y:radio1.frame.midY-radio1.frame.height/3, .white , "OpenSans", WidthOfScreen*24/750 )
        Radio1_label1.frame.origin.x = radio1.frame.maxX+16*WidthOfScreen/750
     
        //Non refundable
        let Radio1_label2 = makeSecondPartLabels(text: text2, textalignment: .left, container: Container ,y:Radio1_label1.frame.maxY, UIColor(red:213/255 , green: 183/255, blue: 23/255, alpha: 1.0) , "OpenSans", WidthOfScreen*22/750 )
        Radio1_label2.frame.origin.x = radio1.frame.maxX+16*WidthOfScreen/750
        
        
     return Radio1_label2.frame.maxY
        
    }
    
    func makeSecondPartLabels(text: String ,textalignment : NSTextAlignment , container : UIView , y: CGFloat, _ color : UIColor , _ fontname: String, _ fontSize: CGFloat)-> UILabel{
        let text4 = text
        let getHeight4 = text4.height(constraintedWidth: container.frame.width, font:  UIFont(name: "OpenSans", size:WidthOfScreen*24/750)!)
        let firstlabel4 = UILabel(frame: CGRect(x:0 , y:y, width: container.frame.width, height: getHeight4))
        firstlabel4.font = UIFont(name: fontname, size:fontSize)!
        firstlabel4.text = text
        firstlabel4.textColor = color
        firstlabel4.textAlignment = textalignment
        container.addSubview(firstlabel4)
        return firstlabel4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
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
