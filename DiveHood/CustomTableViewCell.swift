//
//  CustomTableViewCell.swift
//  DiveHood
//
//  Created by starwallet on 9/24/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var img : UIImageView!
    var ratings : UIView!
    var language : Bool = AppDelegate.sharedInstance().language!
    var Offers: UIView!
    var priceView : UIView!
    var DescriptionView : UIView!
    let viewheight = UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY
    let viewwidth = UIScreen.main.bounds.maxX-UIScreen.main.bounds.minX
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let height = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*450/1334
            frame.size.height = height
            frame.size.width = UIScreen.main.bounds.maxX-UIScreen.main.bounds.minX
            super.frame = frame
            
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupbackgroundGradient()
        //  image
        img = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width , height: viewheight*315/1334))
        img.backgroundColor = .gray
        
        contentView.addSubview(img)
        var x:CGFloat = 0
       
        if language {
            x = viewwidth-#imageLiteral(resourceName: "gold-star").size.width*5-20+1
          
        }
        ratings = UIView(frame: CGRect(x: x, y: viewheight*265/1334, width: #imageLiteral(resourceName: "gold-star").size.width*5+20-1, height: (viewheight*50/1334)-1))
        setupStars()
        ratings.backgroundColor = UIColor(red:0.07, green:0.16, blue:0.30, alpha:0.7)
        contentView.addSubview(ratings)
        var Offersx = ratings.frame.maxX+1
        if language {
         
            Offersx = ratings.frame.minX-contentView.frame.width*0.3-1
        }
        
        Offers = UIView(frame: CGRect(x:Offersx , y: ratings.frame.origin.y, width: contentView.frame.width*0.3, height: viewheight*50/1334))
        setupOffersLbel()
        Offers.backgroundColor = UIColor(red:0.38, green:0.16, blue:0.46, alpha:0.7)
        contentView.addSubview(Offers)
        var priceViewX:CGFloat = 0
        if language{
            priceViewX =  ratings.frame.minX
        }
        priceView = UIView(frame: CGRect(x: priceViewX, y: ratings.frame.maxY+1, width: ratings.frame.width, height: viewheight*125/1334))
        priceView.backgroundColor = UIColor(red:0.07, green:0.16, blue:0.30, alpha:0.9)
        priceViewLabels()
        contentView.addSubview(priceView)
        
        var DescriptionViewX:CGFloat = priceView.frame.maxX
        if language{
            DescriptionViewX =  0
        }
        DescriptionView = UIView(frame: CGRect(x: DescriptionViewX, y: priceView.frame.origin.y, width: contentView.frame.width-(priceView.frame.width), height: (viewheight*125/1334)-1))
        
        DescriptionLabels()
        DescriptionView.backgroundColor = .white
        contentView.addSubview(DescriptionView)
        
        
        
        
    }
    func setupStars(){
        
        let stars1 = UIImageView(frame: CGRect(x: 10, y: ratings.frame.height/4, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars1.image = #imageLiteral(resourceName: "gold-star")
        let stars2 = UIImageView(frame: CGRect(x: stars1.frame.maxX, y: stars1.frame.minY, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars2.image = #imageLiteral(resourceName: "gold-star")
        let stars3 = UIImageView(frame: CGRect(x: stars2.frame.maxX, y: stars2.frame.minY, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars3.image = #imageLiteral(resourceName: "gold-star")
        let stars4 = UIImageView(frame: CGRect(x: stars3.frame.maxX, y: stars3.frame.minY, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars4.image = #imageLiteral(resourceName: "gold-star")
        let stars5 = UIImageView(frame: CGRect(x: stars4.frame.maxX, y: stars4.frame.minY, width: #imageLiteral(resourceName: "gold-star").size.width, height: #imageLiteral(resourceName: "gold-star").size.height))
        stars5.image = #imageLiteral(resourceName: "grey-star")
        ratings.addSubview(stars1)
        ratings.addSubview(stars2)
        ratings.addSubview(stars3)
        ratings.addSubview(stars4)
        ratings.addSubview(stars5)
        
    }
    
    func setupOffersLbel(){
        let offertxt = UILabel()
        offertxt.frame = Offers.bounds
        offertxt.font = UIFont(name: "OpenSans-ExtraBold", size: viewwidth*0.032)
        offertxt.text = "HOT OFFER -25%"
        if language{
            offertxt.text = "خصم بقيمة ٢٥٪"
        }
        
        offertxt.textColor = UIColor(red:0.93, green:0.79, blue:0.05, alpha:1.0)
        //offertxt.sizeToFit()
        offertxt.adjustsFontSizeToFitWidth = true
        offertxt.textAlignment = .center
        Offers.addSubview(offertxt)
        
        
        
    }
    
    func priceViewLabels(){
        let subContainer = UILabel(frame: CGRect(x: viewwidth*0.04, y: priceView.frame.height*0.1, width: priceView.frame.width-(viewwidth*0.04*2), height: priceView.frame.height-(priceView.frame.height*0.1*2)))
        priceView.addSubview(subContainer)
        let BiggerPrice = UILabel(frame: CGRect(x: 0, y: 0, width: subContainer.frame.width, height: subContainer.frame.height*1/3))
        var txt1 = "EGP  "
        var txt2 = "83,132"
        if language{
            txt1 = " جنيه"
            txt2 = " ٨٣,١٣٢"
        }
        let attrs = [NSFontAttributeName:UIFont(name:"OpenSans", size: viewwidth*0.024 )]
        
          let attrs2 = [NSFontAttributeName:UIFont(name:"OpenSans", size: viewwidth*0.032 ), NSStrikethroughStyleAttributeName:NSUnderlineStyle.styleSingle.rawValue] as [String : Any]
        let attributedString = NSMutableAttributedString(string: txt1, attributes: attrs)
        let normalString = NSMutableAttributedString(string: txt2, attributes: attrs2)
      
        if language{
            normalString.append(attributedString)
            BiggerPrice.attributedText = normalString
        }
        else{
            attributedString.append(normalString)
            BiggerPrice.attributedText = attributedString
        }
        
        BiggerPrice.textAlignment = .center
        BiggerPrice.sizeToFit()
        BiggerPrice.baselineAdjustment = .alignBaselines
        BiggerPrice.textColor = .white
        subContainer.addSubview(BiggerPrice)
        let smallerPrice = UILabel(frame: CGRect(x: 0, y: BiggerPrice.frame.maxY, width: subContainer.frame.width, height: subContainer.frame.height))
        smallerPrice.text = "20.783"
        if language{
             smallerPrice.text = "٢٠,٧٨٣"
        }
        smallerPrice.textColor = UIColor(red:0.93, green:0.79, blue:0.05, alpha:1.0)
        smallerPrice.font = UIFont(name: "OpenSans-ExtraBold", size: viewwidth*0.0453)
        smallerPrice.textAlignment = .center
        smallerPrice.sizeToFit()
        subContainer.addSubview(smallerPrice)
        
        
        let smallDetail = UILabel(frame: CGRect(x: smallerPrice.frame.minX, y: smallerPrice.frame.maxY, width: subContainer.frame.width, height: subContainer.frame.height*1/3))
        smallDetail.text = "PER TRIP"
        if language{
            smallDetail.text = "للرحلة"
        }
        smallDetail.textColor = UIColor(red:0.93, green:0.79, blue:0.05, alpha:1.0)
        smallDetail.font = UIFont(name: "OpenSans-Bold", size: viewwidth*0.0187)
        smallDetail.textAlignment = .center
        smallDetail.sizeToFit()
        subContainer.addSubview(smallDetail)
        
        
        
    }
    func setupbackgroundGradient(){
        
        
        let gradientx = CAGradientLayer()
        gradientx.colors = [Colors().gradientColor1.cgColor,Colors().gradientColor2.cgColor]
        
        
        gradientx.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientx.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientx.frame = self.contentView.bounds
        // gradientx.locations = []
        self.contentView.layer.insertSublayer(gradientx, at: 0)
        
        
    }
    func DescriptionLabels(){
        
      
      
        let SubContainer = UIView(frame: CGRect(x: viewwidth*0.047, y: viewheight*16/1334, width: DescriptionView.frame.width-(viewwidth*0.047*2), height: DescriptionView.frame.height-(viewheight*16/1334*2)))
                print(viewheight*0.026)
        DescriptionView.addSubview(SubContainer)
       // SubContainer.backgroundColor = .black
        let Header = UILabel()
       var text =  "Grand Sea Serpent"
        var getwidth = text.widthOfString(usingFont: UIFont(name: "OpenSans-Bold", size: viewwidth*0.0453)!)
        var  HeaderX: CGFloat = 0
        if language{
            HeaderX = SubContainer.frame.maxX-getwidth
            text = "ثعبان البحر الضخم"
        }
        Header.frame.origin = CGPoint(x: HeaderX, y: 0)
        
        
        Header.text = text
        Header.textColor = UIColor(red:0.05, green:0.15, blue:0.24, alpha:1.0)
        Header.font = UIFont(name: "OpenSans-Bold", size: viewwidth*0.0453)
        Header.textAlignment = .center
        Header.sizeToFit()
        SubContainer.addSubview(Header)
        
        //Total distance 59.45 km (36.94 mi)
    
         text =  "Total distance 59.45 km (36.94 mi)"
         getwidth = text.widthOfString(usingFont:  UIFont(name: "OpenSans", size: viewwidth*0.032)!)
        var  subHeaderX: CGFloat = 0
        if language{
            subHeaderX = Header.frame.maxX-getwidth
            text = "المسافة الكلية ٥٩.٩٤ كيلومترات (٣٦.٩٤ متر مكعب)"
        }
        let subHeader = UILabel(frame: CGRect(x: subHeaderX, y: Header.frame.maxY, width: DescriptionView.frame.width, height: DescriptionView.frame.height*1/2))
        //subHeader.backgroundColor = .red
        subHeader.text = text
        subHeader.textColor = UIColor(red:0.34, green:0.34, blue:0.34, alpha:1.0)
        subHeader.font = UIFont(name: "OpenSans", size: viewwidth*0.032)
        subHeader.textAlignment = .center
        subHeader.sizeToFit()
        SubContainer.addSubview(subHeader)
        
        var arrowx = SubContainer.frame.width-#imageLiteral(resourceName: "right-purple-arrow").size.width
        if language{
            arrowx = SubContainer.bounds.minX
            
        }
        let rightarrow = UIImageView(frame: CGRect(x:arrowx , y: SubContainer.frame.height/2-(#imageLiteral(resourceName: "right-purple-arrow").size.height/2), width: #imageLiteral(resourceName: "right-purple-arrow").size.width, height: #imageLiteral(resourceName: "right-purple-arrow").size.height))
        
        rightarrow.image = #imageLiteral(resourceName: "right-purple-arrow")
        if language{
             rightarrow.image = #imageLiteral(resourceName: "left-blue-arrow")
        }
    
        SubContainer.addSubview(rightarrow)
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
