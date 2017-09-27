//
//  Single Page.swift
//  DiveHood
//
//  Created by starwallet on 9/26/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class Single_Page: UIViewController ,UITableViewDataSource ,UITableViewDelegate {
    var scrollView : UIScrollView!
    var scrollViewSlider: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUi()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUi(){
        
        SetupNavigationBar()
        setupbackgroundGradient()
        statusBarGradient()
        var  y = makeScrollBarWithImageHeader()
        y = barAfterImageHeader(y)
        y =  booked240Times(y)
        y = PickCabinandBook(y)
        y = DescriptionField(y)
        y = setTableview(y)
        SimilarLiveaboards(y)
        
       
    }
    
    func SimilarLiveaboards(_ y: CGFloat){
        let container = UIView(frame: CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height*515/1334))
         var  label1 =  makeOneLineLabel(container , x: view.frame.width*25/750 , y:view.frame.height*32/1334, text: "SIMILAR LIVEABOARDS" , textColor: UIColor(red:17/255 , green:42/255, blue:76/255 , alpha : 1.0) , Fontname: "OpenSans-Bold" , FontSize: view.frame.width*34/750)


        let label2 = UILabel(frame: CGRect(x: container.frame.width - view.frame.width*87/750-view.frame.width*25/750, y: label1.frame.minY, width: view.frame.width*87/750, height: view.frame.height*40/1334))
        label2.text = "Egypt"
        label2.textColor = .white
       // label2.adjustsFontSizeToFitWidth = true
        
        label2.layer.borderWidth = 1.0
        label2.layer.cornerRadius = 2.0
        label2.clipsToBounds = true
        
        label2.textAlignment = .center
        
        label2.font = UIFont(name: "OpenSans", size: view.frame.width*24/750)
        label2.backgroundColor = UIColor(red: 17/255, green: 42/255, blue: 76/255, alpha: 1.0)
        container.addSubview(label2)
        scrollView.addSubview(container)
        setsliderContainer(label1.frame.maxY+container.frame.minY)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: container.frame.maxY+(self.tabBarController?.tabBar.frame.height)!+view.frame.height*64*2/1334)
        
    }
    func setsliderContainer (_ y : CGFloat){
        let Barheight:CGFloat  = self.tabBarController!.tabBar.frame.height
        print(Barheight)
        scrollViewSlider  = UIScrollView(frame: CGRect(x: 0, y: y , width: view.frame.width, height: view.frame.height*515/1334))
        scrollViewSlider.isPagingEnabled = true
        scrollViewSlider.contentSize = CGSize(width: view.frame.width*3, height: view.frame.height*515/1334)
        scrollViewSlider.showsHorizontalScrollIndicator = false
        
        scrollView.addSubview(scrollViewSlider)
        
        var  x =  makeABoxContainer(scrollViewSlider , xposition : 0 , yposition : view.frame.height*50/1334 ,img: #imageLiteral(resourceName: "fiji-siren-1") )
        
        x = makeABoxContainer(scrollViewSlider , xposition :x , yposition : view.frame.height*50/1334 ,img:#imageLiteral(resourceName: "indo-siren-1"))
        
        x =  makeABoxContainer(scrollViewSlider , xposition : x , yposition : view.frame.height*50/1334 ,img:#imageLiteral(resourceName: "palau-siren-5"))
       
        x = makeABoxContainer(scrollViewSlider , xposition : x , yposition : view.frame.height*50/1334 ,img:#imageLiteral(resourceName: "indo-siren-1"))
    }
    
    func makeABoxContainer(_ scrollViewSlider: UIScrollView , xposition : CGFloat , yposition : CGFloat, img: UIImage)->CGFloat{
        let subcontainer = UIView(frame: CGRect(x: xposition, y: yposition, width: view.frame.width*0.5, height: scrollViewSlider.frame.height-(view.frame.height*50/1334*2)))
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: subcontainer.frame.width, height: view.frame.height*205/1334))
        image.image = img
        
        subcontainer.addSubview(image)
        let priceView = UIView(frame: CGRect(x: 0, y: view.frame.height*80/1334, width: subcontainer.frame.width/2, height:image.frame.maxY-view.frame.height*80/1334))
        priceView.backgroundColor = UIColor(red:0.07, green:0.16, blue:0.30, alpha:0.9)
        priceViewLabels(priceView)
        subcontainer.addSubview(priceView)
        let whiteBox = UIView(frame: CGRect(x: 0, y: image.frame.maxY, width: subcontainer.frame.width, height: view.frame.height*120/1334))
        whiteBox.backgroundColor = .white
        DescriptionLabels(whiteBox)
        subcontainer.addSubview(whiteBox)
        scrollViewSlider.addSubview(subcontainer)
        
        return subcontainer.frame.maxX+view.frame.width*70/750
    }
    
    
    func priceViewLabels(_ priceView: UIView){
        let subContainer = UILabel(frame: CGRect(x: view.frame.width*0.04, y: priceView.frame.height*0.1, width: priceView.frame.width-(view.frame.width*0.04*2), height: priceView.frame.height-(priceView.frame.height*0.1*2)))
        priceView.addSubview(subContainer)
        let BiggerPrice = UILabel(frame: CGRect(x: 0, y: 0, width: subContainer.frame.width, height: subContainer.frame.height*1/3))
        let txt1 = "EGP  "
        let attrs = [NSFontAttributeName:UIFont(name:"OpenSans", size: view.frame.width*0.024 )]
        let txt2 = "83,132"
    
        let attrs2 = [NSFontAttributeName:UIFont(name:"OpenSans", size: view.frame.width*0.032 ), NSStrikethroughStyleAttributeName:NSUnderlineStyle.styleSingle.rawValue] as [String : Any]
        let attributedString = NSMutableAttributedString(string: txt1, attributes: attrs)
        let normalString = NSMutableAttributedString(string: txt2, attributes: attrs2)
        attributedString.append(normalString)
        BiggerPrice.attributedText = attributedString
        BiggerPrice.textAlignment = .center
        BiggerPrice.sizeToFit()
        BiggerPrice.baselineAdjustment = .alignBaselines
        BiggerPrice.textColor = .white
        subContainer.addSubview(BiggerPrice)
        let smallerPrice = UILabel(frame: CGRect(x: 0, y: BiggerPrice.frame.maxY, width: subContainer.frame.width, height: subContainer.frame.height))
        smallerPrice.text = "20.783"
        smallerPrice.textColor = UIColor(red:0.93, green:0.79, blue:0.05, alpha:1.0)
        smallerPrice.font = UIFont(name: "OpenSans-ExtraBold", size: view.frame.width*0.0453)
        smallerPrice.textAlignment = .center
        smallerPrice.sizeToFit()
        subContainer.addSubview(smallerPrice)
        
        
        let smallDetail = UILabel(frame: CGRect(x: smallerPrice.frame.minX, y: smallerPrice.frame.maxY, width: subContainer.frame.width, height: subContainer.frame.height*0.1))
        smallDetail.text = "PER TRIP"
        smallDetail.textColor = UIColor(red:173/255, green:155/355, blue:26/255, alpha:1.0)
        smallDetail.font = UIFont(name: "OpenSans-Bold", size: view.frame.width*12/750)
        smallDetail.textAlignment = .center
        smallDetail.sizeToFit()
        subContainer.addSubview(smallDetail)
        
        
        
    }
    func DescriptionLabels(_ DescriptionView:UIView ){
        
        let SubContainer = UIView(frame: CGRect(x: view.frame.width*30/750, y: view.frame.height*16/1334, width: DescriptionView.frame.width-(view.frame.width*30/750*2), height: DescriptionView.frame.height-(view.frame.height*16/1334*2)))
        
        DescriptionView.addSubview(SubContainer)
        let Header = UILabel()
        Header.frame.origin = CGPoint(x: 0, y: 0)
        
        Header.text = "Grand Sea Serpent"
        Header.textColor = UIColor(red:0.05, green:0.15, blue:0.24, alpha:1.0)
        Header.font = UIFont(name: "OpenSans-ExtraBold", size: view.frame.width*0.0453)
        Header.textAlignment = .center
        Header.sizeToFit()
        SubContainer.addSubview(Header)
        
        
        
        
        let subHeader = UILabel(frame: CGRect(x: 0, y: Header.frame.maxY, width: SubContainer.frame.width, height: DescriptionView.frame.height*0.2))
        //subHeader.backgroundColor = .red
        subHeader.text = "Total distance 59.45 km (36.94 mi)"
        subHeader.textColor = UIColor(red:0.34, green:0.34, blue:0.34, alpha:1.0)
        subHeader.font = UIFont(name: "OpenSans", size: view.frame.width*0.032)
        subHeader.textAlignment = .center
        //subHeader.sizeToFit()
        // subHeader.adjustsFontSizeToFitWidth = true
        SubContainer.addSubview(subHeader)
        
        
        
    }
    
    
    
    func DescriptionField(_ y : CGFloat)->CGFloat{
        let container = UIView(frame: CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height*360/1334))
        container.backgroundColor = .white
        
        var  label1 =  makeOneLineLabel(container , x: view.frame.width*25/750 , y:view.frame.height*55/1334, text: "Description" , textColor: UIColor(red:17/255 , green:42/255, blue:76/255 , alpha : 1.0) , Fontname: "OpenSans-Bold" , FontSize: view.frame.width*34/750)
        
        var label2 = UILabel(frame: CGRect(x: label1.frame.minX, y: label1.frame.maxY+view.frame.height*20/1334, width: view.frame.width-(label1.frame.minX*2) , height: container.frame.height-(label1.frame.maxY+view.frame.height*20/1334*2)))
       
        label2.text = "Seawolf Dominator, the roomy and comfortable liveaboard, delivers you in style to exotic islands and stunning reefs only found in the Red Sea The Seawolf Dominator leaves no diving luxury unfulfilled.A diver’s dream, the Seawolf opens doors to the wonders of the Red Sea, swarming with marine life; home to amazing reefs, Pelagic fish, Sharks, Dolphins and Sunken Ships. This custom-designed liveaboard allows Dive Adventurers to explore the Red Sea biodiversity while relaxing in comfort and style."
        label2.font = UIFont(name: "OpenSans", size: view.frame.height*24/1334)
        label2.numberOfLines = 0
        label2.textColor = label1.textColor
        container.addSubview(label2)
        
        scrollView.addSubview(container)
       
        
        return container.frame.maxY
    }
    
    
    func PickCabinandBook(_ y :CGFloat)->CGFloat{
        let container1 = UIView(frame: CGRect(x: 0, y: y, width: view.frame.width/2, height: view.frame.height*110/1334))
        container1.backgroundColor = UIColor(red: 17/255, green: 42/255, blue: 76/255, alpha: 1.0)
        //first label
        var  label1 =  makeOneLineLabel(container1 , x: view.frame.width*25/750 , y:0, text: "Prices Starts From" , textColor: .white , Fontname: "OpenSans-Bold" , FontSize: view.frame.width*28/750)
        var  label2 =  makeOneLineLabel(container1 , x: label1.frame.origin.x , y:label1.font.lineHeight, text: "20.783 " , textColor: UIColor(red: 237/255, green: 202/255, blue: 12/255, alpha: 1.0) , Fontname: "OpenSans-Bold" , FontSize: view.frame.width*34/750)
        var  label3 =  makeOneLineLabel(container1 , x: label2.frame.maxX , y:label2.frame.midY, text: "EGP" , textColor: .white , Fontname: "OpenSans-Bold" , FontSize: view.frame.width*14/750)
        var  label4 =  makeOneLineLabel(container1 , x: label1.frame.minX , y:label2.frame.maxY, text: "PER TRIP" , textColor: UIColor(red: 173/255, green: 155/255, blue: 26/255, alpha: 1.0) , Fontname: "OpenSans" , FontSize: view.frame.width*14/750)
        scrollView.addSubview(container1)
        
        
        let conainer2 = UIView(frame: CGRect(x: container1.frame.maxX, y: container1.frame.minY, width: container1.frame.width, height: container1.frame.height))
        conainer2.backgroundColor = UIColor(red: 27/255, green: 21/255, blue: 38/255, alpha: 1.0)
        
        var  label5 =  makeOneLineLabel(conainer2 , x: view.frame.width*15/750 , y:view.frame.width*20/750, text: "25 Cabin Available" , textColor: UIColor(red: 237/255, green: 202/255, blue: 12/255, alpha: 1.0) , Fontname: "OpenSans" , FontSize: view.frame.height*20/1334)
        var  label6 =  makeOneLineLabel(conainer2 , x: label5.frame.origin.x , y:label5.frame.maxY, text: "Select Your Trip" , textColor: .white, Fontname: "OpenSans-Bold" , FontSize: view.frame.height*28/1334)
        
        
        let arrow = UIImageView(frame: CGRect(x: conainer2.frame.width-(#imageLiteral(resourceName: "right-white-arrow").size.width)-view.frame.width*15/750, y: conainer2.frame.height/2-(#imageLiteral(resourceName: "right-white-arrow").size.height/2), width: #imageLiteral(resourceName: "right-white-arrow").size.width, height: #imageLiteral(resourceName: "right-white-arrow").size.height))
        arrow.image = #imageLiteral(resourceName: "right-white-arrow")
        conainer2.addSubview(arrow)
        
        
        let tab = UITapGestureRecognizer(target: self, action: #selector(OpenTimeSlots))
        conainer2.isUserInteractionEnabled = true
        conainer2.addGestureRecognizer(tab)
        
        scrollView.addSubview(conainer2)
        
        
        
        return container1.frame.maxY
        
    }
    func OpenTimeSlots(){
        
        self.navigationController?.pushViewController(TimeSlotsView(), animated: true)
        
    }
    
    
    func booked240Times(_ y:CGFloat)->CGFloat{
        let container = UIView(frame: CGRect(x: 0, y: y+1, width: view.frame.width, height: view.frame.height*315/1334))
        container.backgroundColor = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1.0)
        let labelBookedHeader = UILabel()
        labelBookedHeader.frame.origin = CGPoint(x: view.frame.width*25/750, y:view.frame.width*25/750)
        labelBookedHeader.text = "Booked 240 Times"
        labelBookedHeader.textColor = UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0)
        labelBookedHeader.font = UIFont(name: "OpenSans-Bold", size: view.frame.width*28/750)
        labelBookedHeader.sizeToFit()
        container.addSubview(labelBookedHeader)
        //first label
        var  label1 =  makeOneLineLabel(container , x: labelBookedHeader.frame.minX , y:labelBookedHeader.frame.maxY+view.frame.height*16/1334 , text: "Year built / renovated: " , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans-Semibold" , FontSize: view.frame.width*20/750)
        
        makeOneLineLabel(container , x: label1.frame.maxX , y:label1.frame.origin.y , text: "2007/2017 " , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans" , FontSize: view.frame.width*20/750)
        //second label
        
        var  label2 =  makeOneLineLabel(container , x: label1.frame.minX , y:label1.frame.maxY+view.frame.height*8/1334 , text: "Cabins " , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans-Semibold" , FontSize: view.frame.width*20/750)
        
        makeOneLineLabel(container , x: label2.frame.maxX , y:label2.frame.origin.y , text: "12 " , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans" , FontSize: view.frame.width*20/750)
        
        //Third label  Length / Width: 36m / 9m
        
        var  label3 =  makeOneLineLabel(container , x: label2.frame.minX , y:label2.frame.maxY+view.frame.height*8/1334 , text: "Length / Width:" , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans-Semibold" , FontSize: view.frame.width*20/750)
        
        makeOneLineLabel(container , x: label3.frame.maxX , y:label3.frame.origin.y , text: " 36m / 9m" , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans" , FontSize: view.frame.width*20/750)
        
        //Fourth label  Dive shop: Yes
        
        var  label4 =  makeOneLineLabel(container , x: label3.frame.minX , y:label3.frame.maxY+view.frame.height*8/1334 , text: "Dive shop" , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans-Semibold" , FontSize: view.frame.width*20/750)
        
        makeOneLineLabel(container , x: label4.frame.maxX , y:label4.frame.origin.y , text: ": Yes" , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans" , FontSize: view.frame.width*20/750)
        
        //Fifth label  Wi-fi: Free
        
        var  label5 =  makeOneLineLabel(container , x: label4.frame.minX , y:label4.frame.maxY+view.frame.height*8/1334 , text: "Wi-fi:" , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans-Semibold" , FontSize: view.frame.width*20/750)
        
        makeOneLineLabel(container , x: label5.frame.maxX , y:label5.frame.origin.y , text: " Free" , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans" , FontSize: view.frame.width*20/750)
        
        //six label  Nitrox: Free
        
        var  label6 =  makeOneLineLabel(container , x: label5.frame.minX , y:label5.frame.maxY+view.frame.height*8/1334 , text: "Nitrox:" , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans-Semibold" , FontSize: view.frame.width*20/750)
        
        makeOneLineLabel(container , x: label6.frame.maxX , y:label6.frame.origin.y , text: " Free" , textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0) , Fontname: "OpenSans" , FontSize: view.frame.width*20/750)
        
    
        scrollView.addSubview(container)
        
        // on the other side ratings :::::::::::::::::
        let widthofratings = #imageLiteral(resourceName: "gold-star").size.width*5
        let ratings = UIView(frame: CGRect(x: container.frame.width-widthofratings-view.frame.width*25/750, y:labelBookedHeader.frame.origin.y , width:widthofratings , height: #imageLiteral(resourceName: "gold-star").size.height  ))
        setupStars(ratings)
        container.addSubview(ratings)
      
        makeOneLineLabel(container, x: ratings.frame.minX, y: ratings.frame.maxY+view.frame.height*16/1334, text: "120 Feedback", textColor: UIColor(red: 28/255, green: 59/255, blue: 104/255, alpha: 1.0), Fontname: "OpenSans", FontSize: view.frame.width*20/750)
        
        return container.frame.maxY
        
    }
    func setupStars(_ ratings: UIView){
        
        let stars1 = UIImageView(frame: CGRect(x: 0, y: ratings.frame.height/4, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars1.image = #imageLiteral(resourceName: "gold-star")
        let stars2 = UIImageView(frame: CGRect(x: stars1.frame.maxX, y: stars1.frame.minY, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars2.image = #imageLiteral(resourceName: "gold-star")
        let stars3 = UIImageView(frame: CGRect(x: stars2.frame.maxX, y: stars2.frame.minY, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars3.image = #imageLiteral(resourceName: "gold-star")
        let stars4 = UIImageView(frame: CGRect(x: stars3.frame.maxX, y: stars3.frame.minY, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars4.image = #imageLiteral(resourceName: "gold-star")
        let stars5 = UIImageView(frame: CGRect(x: stars4.frame.maxX, y: stars4.frame.minY, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars5.image = #imageLiteral(resourceName: "gold-star")
        ratings.addSubview(stars1)
        ratings.addSubview(stars2)
        ratings.addSubview(stars3)
        ratings.addSubview(stars4)
        ratings.addSubview(stars5)
        
    }
    
    
    
    func makeOneLineLabel(_ container :UIView, x : CGFloat , y:CGFloat , text :String , textColor: UIColor , Fontname : String , FontSize : CGFloat)->UILabel{
        let label = UILabel()
        label.frame.origin = CGPoint(x: x, y:y)
        label.text = text
        label.textColor = textColor
        label.font = UIFont(name: Fontname, size: FontSize)
        label.sizeToFit()
        container.addSubview(label)
        return label
    }
    
    
    func barAfterImageHeader (_ y : CGFloat)->CGFloat{
        //height of 120
        let container = UIView(frame: CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height*120/1334))
        container.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 240/255)
        scrollView.addSubview(container)
        DescriptionLabels(DescriptionView: container)
        
        return container.frame.maxY
        
    }
    
    func DescriptionLabels(DescriptionView:UIView){
        
        let SubContainer = UIView(frame: CGRect(x: view.frame.width*25/750, y: view.frame.width*25/750, width: DescriptionView.frame.width-(view.frame.width*25/750*2), height: DescriptionView.frame.height-(view.frame.width*25/750*2)))
        
        print(view.frame.height*0.026)
        DescriptionView.addSubview(SubContainer)
        let Header = UILabel()
        Header.frame.origin = CGPoint(x: 0, y: 0)
        
        Header.text = "Grand Sea Serpent"
        Header.textColor = UIColor(red:0.05, green:0.15, blue:0.24, alpha:1.0)
        Header.font = UIFont(name: "OpenSans-Bold", size: view.frame.width*0.0453)
        Header.textAlignment = .center
        Header.sizeToFit()
        SubContainer.addSubview(Header)
        
        //Total distance 59.45 km (36.94 mi)
        
        
        let subHeader = UILabel(frame: CGRect(x: 0, y: Header.frame.maxY, width: DescriptionView.frame.width/2, height: DescriptionView.frame.height*1/2))
        //subHeader.backgroundColor = .red
        subHeader.text = "Total distance 59.45 km (36.94 mi)"
        subHeader.textColor = UIColor(red:0.34, green:0.34, blue:0.34, alpha:1.0)
        subHeader.font = UIFont(name: "OpenSans", size: view.frame.width*0.032)
        subHeader.textAlignment = .center
        subHeader.sizeToFit()
        SubContainer.addSubview(subHeader)
        
        let viewmap = UIImageView(frame:CGRect(x: SubContainer.frame.width-#imageLiteral(resourceName: "view-map").size.width, y: SubContainer.frame.midY-(#imageLiteral(resourceName: "view-map").size.height), width: #imageLiteral(resourceName: "view-map").size.width, height: #imageLiteral(resourceName: "view-map").size.height))
        viewmap.image = #imageLiteral(resourceName: "view-map")
        SubContainer.addSubview(viewmap)
        let callus = UIImageView(frame:CGRect(x: viewmap.frame.minX-view.frame.width*16/750-#imageLiteral(resourceName: "call-us").size.width, y: viewmap.frame.origin.y, width: #imageLiteral(resourceName: "call-us").size.width, height: #imageLiteral(resourceName: "call-us").size.height))
        callus.image = #imageLiteral(resourceName: "call-us")
        SubContainer.addSubview(callus)
        
        
    }
    
    
    func makeScrollBarWithImageHeader ()->CGFloat{
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: view.frame.height))
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        let imageHeader = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*315/1334))
        imageHeader.image = #imageLiteral(resourceName: "fiji-siren-1")
        scrollView.addSubview(imageHeader)
        //255 50
        let y = imageHeader.frame.maxY-view.frame.height*50/1334
        let offersview = UIView(frame: CGRect(x: 0, y:y, width: view.frame.width*255/750, height: view.frame.height*50/1334))
        
        let offers = UILabel(frame: CGRect(x: view.frame.width*32/750, y:view.frame.height*0.008, width: offersview.frame.width-(view.frame.width*32/750*2), height: offersview.frame.height-view.frame.height*0.008*2))
        
        offers.textColor = UIColor(red:0.93, green:0.79, blue:0.05, alpha:1.0)
        offers.text = "HOT OFFER -25%"
        offers.adjustsFontSizeToFitWidth = true
        offersview.backgroundColor = UIColor(red:0.38, green:0.16, blue:0.46, alpha:0.7)
        //offers.textAlignment = .center
        offers.font = UIFont(name: "OpenSans-Bold", size: view.frame.height*24/1334)
        offersview.addSubview(offers)
        
        scrollView.addSubview(offersview)
        
        return imageHeader.frame.maxY
        
    }
    
    
    func statusBarGradient(){
        
        let frame = UIApplication.shared.statusBarFrame
        let view1 = UIView()
        view1.backgroundColor = UIColor(red:56/255, green:44/255, blue:98/255, alpha:1.0)
        view1.frame = frame
        view.addSubview(view1)
        
    }
    
    func SetupNavigationBar(){
        self.title = "Grand Sea Serpent"
        let nav = self.navigationController!
        nav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName :UIColor.white]
        if #available(iOS 11.0, *) {
            nav.navigationBar.prefersLargeTitles = true
            nav.navigationBar.largeTitleTextAttributes = [NSForegroundColorAttributeName :UIColor.white]
            
            print("height is ??? \(nav.navigationBar.intrinsicContentSize.height)")
        } else {
            // Fallback on earlier versions
        }
        
        print(nav.navigationItem == nil)
        
        print("inside background color >>>>>>>>>>>>>>>")
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.backgroundColor = UIColor.clear
        
        
        var cartimage = UIImage(named: "cart")
        cartimage = cartimage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        var shareimage = UIImage(named: "share")
        shareimage = shareimage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        var addfavoriteimage = UIImage(named: "add-favorite")
        addfavoriteimage = addfavoriteimage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let cartItem = UIBarButtonItem(image: cartimage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        let shareItem =  UIBarButtonItem(image: shareimage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        let favItem =  UIBarButtonItem(image: addfavoriteimage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItems = [ favItem,shareItem,cartItem ]
        self.navigationController?.navigationBar.tintColor = .white
    }
    func setupbackgroundGradient(){
        
        
        let gradientx = CAGradientLayer()
        gradientx.colors = [UIColor(red:17/255, green:42/255, blue:76/255, alpha:1.0).cgColor,Colors().gradientColor2.cgColor]
        gradientx.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientx.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientx.locations = [0.3, 0.7]
        gradientx.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientx, at: 0)
        
        
    }
    
      //*************************** Tableview Protocols  Functionalities *******************************//
    func setTableview(_ y:CGFloat  ) ->CGFloat{
        let tableView = UITableView(frame: CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height*113/1334*6))
        scrollView.addSubview(tableView)
        //tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SinglePageTableCell.classForCoder(), forCellReuseIdentifier: "SinglePageCell")
       // tableView.separatorColor = UIColor(red: 77/25, green: 194/255, blue: 230/255, alpha: 1.0)
        tableView.separatorStyle = .none
        return tableView.frame.maxY
        
        
    }
    let Titles = ["Boat Amenities","Diving Services", "Location On Map", "Liveaboard Images", "Liveaboard Videos", "Reviews"]
    let images = [#imageLiteral(resourceName: "amenities"),#imageLiteral(resourceName: "diving"), #imageLiteral(resourceName: "map"), #imageLiteral(resourceName: "image"), #imageLiteral(resourceName: "video"), #imageLiteral(resourceName: "review")]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SinglePageCell", for: indexPath as IndexPath) as! SinglePageTableCell
        cell.selectionStyle = .none
        cell.icon.image = images[indexPath.row]
        cell.Title.text = Titles[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellimageheight  = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*113/1334
        
        return cellimageheight
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //#############   END OF Tableview Protocols  Functionalities #####################################//
    

    
}
