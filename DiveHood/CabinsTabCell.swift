//
//  CabinsTabCell.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class CabinsTabCell: UITableViewCell {
    var HeightOfScreen: CGFloat!
    var WidthOfScreen : CGFloat!
    var imageview :UIImageView!
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let height = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*562/1334
            
            frame.size.height = height
            frame.size.width = UIScreen.main.bounds.maxX-UIScreen.main.bounds.minX
            super.frame = frame
            
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor =  UIColor(red: 17/255, green: 42/255, blue: 76/255, alpha: 1.0)
        setCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(){
        HeightOfScreen = UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY
        WidthOfScreen = UIScreen.main.bounds.maxX-UIScreen.main.bounds.minX
        //88
        let Firstcontainer = UIView(frame: CGRect(x: WidthOfScreen*16/750, y: WidthOfScreen*16/750, width: WidthOfScreen-(WidthOfScreen*16/750*2), height: HeightOfScreen*80/1334))
        
        
        let text2 = "DELUXE STATEROOM"
        let getHeight2 = text2.height(constraintedWidth: Firstcontainer.frame.width/2, font:  UIFont(name: "OpenSans-SemiboldItalic", size:WidthOfScreen*28/750)!)
        let firstlabel2 = UILabel(frame: CGRect(x:0 , y:Firstcontainer.frame.height/2-getHeight2/2, width: Firstcontainer.frame.width/2, height: getHeight2))
        firstlabel2.font = UIFont(name: "OpenSans-SemiboldItalic", size:WidthOfScreen*28/750)!
        firstlabel2.text = text2
        firstlabel2.textColor = .white
        Firstcontainer.addSubview(firstlabel2)
        
        
        
        
        var  whiteSeprator = UIView(frame: CGRect(x: 0, y: Firstcontainer.frame.maxY-1, width: Firstcontainer.frame.width, height: 1))
        whiteSeprator.backgroundColor = .white
        Firstcontainer.addSubview(whiteSeprator)
        contentView.addSubview(Firstcontainer)
        
        
        
        let RightContainer = UIView(frame: CGRect(x: Firstcontainer.frame.maxX-WidthOfScreen*120/750 , y: 0, width: WidthOfScreen*120/750, height: Firstcontainer.frame.height))
        contentView.addSubview(RightContainer)
        let x1  =   HorizontalyLabels("PER TRIP", font: UIFont(name: "OpenSans", size: WidthOfScreen*16/750)!, textcolor: UIColor(red: 237/255, green: 202/255, blue: 12/255, alpha: 1), y: HeightOfScreen*20/1334, container: RightContainer, Width: RightContainer.frame.width-(WidthOfScreen*25/750))
        x1.sizeToFit()
        
        let x2  =   HorizontalyLabels("20.783", font: UIFont(name: "OpenSans-ExtraBold", size: WidthOfScreen*34/750)!, textcolor: UIColor(red: 237/255, green: 202/255, blue: 12/255, alpha: 1), y: x1.frame.maxY, container: RightContainer, Width: RightContainer.frame.width-(WidthOfScreen*25/750))
        x2.sizeToFit()
        
        let x1_1  =   HorizontalyLabels("EGP", font: UIFont(name: "OpenSans", size: WidthOfScreen*16/750)!, textcolor: .white, y: x1.frame.minY, container: RightContainer, Width: RightContainer.frame.width-(WidthOfScreen*25/750))
        x1_1.frame.origin.x = x2.frame.maxX-x1_1.frame.width
        
        x1_1.textAlignment = .right
        
        
        /////////////////////////////////////////////////////////////////////////////
        ///********************* Second Part ****************************
         let Seconcontainer = UIView(frame: CGRect(x:WidthOfScreen*32/750, y: Firstcontainer.frame.maxY+WidthOfScreen*25/750, width: WidthOfScreen-(WidthOfScreen*32/750*2), height: HeightOfScreen*240/1334))
        let firstlabel = makeSecondPartLabels(text: "Package type", textalignment: .left, container: Seconcontainer ,y: WidthOfScreen*25/750, .white )
        let secondLabel =   makeSecondPartLabels(text: "Price / person", textalignment: .center, container: Seconcontainer, y: WidthOfScreen*25/750 ,.white)
        let thirdLabel =  makeSecondPartLabels(text: "Sharable", textalignment: .right, container: Seconcontainer ,y: WidthOfScreen*25/750, .white)
       
        
       
        
       let Fourthlabel =  makeSecondPartLabels(text: "For Diver", textalignment: .left, container: Seconcontainer, y: firstlabel.frame.maxY+HeightOfScreen*16/1334, UIColor(red: 77/255, green: 194/255, blue: 230/255, alpha: 1.0))
        Fourthlabel.frame.origin.x = 10*WidthOfScreen/750
        makeSecondPartLabels(text: "20.783 EGP", textalignment: .center, container: Seconcontainer, y: secondLabel.frame.maxY+HeightOfScreen*16/1334,UIColor(red: 77/255, green: 194/255, blue: 230/255, alpha: 1.0))
         imageview = UIImageView()
        imageview.frame.origin = CGPoint(x: Seconcontainer.bounds.maxX-64*WidthOfScreen/750, y: thirdLabel.frame.maxY+HeightOfScreen*16/1334)
        imageview.frame.size = #imageLiteral(resourceName: "yes").size
        Seconcontainer.addSubview(imageview)
        
        
          ///********************* Second Part ****************************
        let stepper = UIStepper()
         let ThirdContainer = UIView(frame: CGRect(x:0, y: Seconcontainer.bounds.maxY-HeightOfScreen*32/1334-stepper.intrinsicContentSize.height, width:Seconcontainer.frame.width , height: stepper.intrinsicContentSize.height))
       // ThirdContainer.backgroundColor = .gray
         let ThirdContainer_label1 =  makeSecondPartLabels(text: "1", textalignment: .left, container: ThirdContainer, y:0, UIColor(red: 17/255, green: 42/255, blue: 76/255, alpha: 1.0))
        ThirdContainer_label1.frame.size.height = ThirdContainer.frame.height
        ThirdContainer_label1.frame.size.width = ThirdContainer_label1.frame.height
       ThirdContainer_label1.layer.borderWidth = 1
        ThirdContainer_label1.clipsToBounds = true
        ThirdContainer_label1.textAlignment = .center
        ThirdContainer_label1.layer.cornerRadius = ThirdContainer_label1.frame.height/2
            ThirdContainer_label1.backgroundColor = UIColor(red: 77/255, green: 194/255, blue: 230/255, alpha: 1.0)
            ThirdContainer.addSubview(ThirdContainer_label1)
        
        
        let lab = UILabel(frame: CGRect(x: ThirdContainer_label1.frame.maxX+16*WidthOfScreen/750, y:0, width: ThirdContainer.frame.width, height: ThirdContainer.frame.height))
        lab.font = UIFont(name: "OpenSans", size:WidthOfScreen*24/750)!
        lab.text = "Guests"
        lab.textColor = .white
        lab.textAlignment = .left
        ThirdContainer.addSubview(lab)
        
        Seconcontainer.addSubview(ThirdContainer)
       // Seconcontainer.backgroundColor = .black
        
        
        stepper.frame.origin = CGPoint(x: ThirdContainer.frame.maxX-stepper.intrinsicContentSize.width, y: 0)
        stepper.tintColor =  UIColor(red: 77/255, green: 194/255, blue: 230/255, alpha: 1.0)
        ThirdContainer.addSubview(stepper)
        
        whiteSeprator = UIView(frame: CGRect(x: 0, y: Seconcontainer.bounds.maxY-1, width: Seconcontainer.frame.width, height: 1))
        whiteSeprator.backgroundColor = .white
        Seconcontainer.addSubview(whiteSeprator)
         contentView.addSubview(Seconcontainer)
       // last part ******************** cabins images with slider
         let FourthContainer = UIView(frame: CGRect(x:Seconcontainer.frame.minX, y: Seconcontainer.frame.maxY, width:WidthOfScreen , height: HeightOfScreen*200/1334))
        setsliderContainer(container: FourthContainer)

        contentView.addSubview(FourthContainer)
        whiteSeprator = UIView(frame: CGRect(x: 0, y: FourthContainer.bounds.maxY-1, width: FourthContainer.frame.width, height: 1))
        whiteSeprator.backgroundColor = .white
        FourthContainer.addSubview(whiteSeprator)
        
        
    }
    
    func setsliderContainer (container : UIView){
      
      let scrollview  = UIScrollView(frame: CGRect(x: 0, y: 0 , width: container.frame.width, height: container.frame.height))
      
        //scrollview.backgroundColor = UIColor(red:37/255, green:43/255, blue:87/255, alpha:0.9)
        scrollview.isPagingEnabled = true
        scrollview.contentSize = CGSize(width: container.frame.width*3, height: container.frame.height)
        scrollview.showsHorizontalScrollIndicator = false
        
        container.addSubview(scrollview)
        
        var  x =  makeABoxContainer(scrollview , xposition : 0 , yposition : HeightOfScreen*25/1334 ,img: #imageLiteral(resourceName: "Untitled") )
        
        x = makeABoxContainer(scrollview , xposition :x , yposition : HeightOfScreen*25/1334 ,img:#imageLiteral(resourceName: "Untitled"))
        
        x =  makeABoxContainer(scrollview , xposition : x , yposition :HeightOfScreen*25/1334 ,img:#imageLiteral(resourceName: "Untitled"))
        
        x = makeABoxContainer(scrollview , xposition : x , yposition :HeightOfScreen*25/1334 ,img:#imageLiteral(resourceName: "Untitled"))
      
        
    }
    
    func makeABoxContainer(_ scrollview: UIScrollView , xposition : CGFloat , yposition : CGFloat, img: UIImage)->CGFloat{
        let subcontainer = UIView(frame: CGRect(x: xposition, y: yposition, width: #imageLiteral(resourceName: "Untitled").size.width, height: scrollview.frame.height-(HeightOfScreen*25/1334*2)))
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: subcontainer.frame.width,height: subcontainer.frame.height))
        
        image.image = img
        subcontainer.addSubview(image)
   
        
        scrollview.addSubview(subcontainer)
        
        return subcontainer.frame.maxX+WidthOfScreen*16/750
    }
    
    func makeSecondPartLabels(text: String ,textalignment : NSTextAlignment , container : UIView , y: CGFloat, _ color : UIColor)-> UILabel{
        let text4 = text
        let getHeight4 = text4.height(constraintedWidth: container.frame.width, font:  UIFont(name: "OpenSans", size:WidthOfScreen*24/750)!)
        let firstlabel4 = UILabel(frame: CGRect(x:0 , y:y, width: container.frame.width, height: getHeight4))
        firstlabel4.font = UIFont(name: "OpenSans-Semibold", size:WidthOfScreen*24/750)!
        firstlabel4.text = text
        firstlabel4.textColor = color
        firstlabel4.textAlignment = textalignment
        container.addSubview(firstlabel4)
        return firstlabel4
    }
    
    
    
    
    func HorizontalyLabels(_ text :String , font : UIFont , textcolor : UIColor , y: CGFloat , container: UIView , Width : CGFloat)->UILabel{
        
        let text2 = text
        let getHeight2 = text.height(constraintedWidth: Width, font:  font)
        let firstlabel2 = UILabel(frame: CGRect(x: 0, y:y, width: Width, height: getHeight2))
        firstlabel2.font = font
        firstlabel2.text = text2
        firstlabel2.textAlignment = .left
        firstlabel2.textColor = textcolor
        container.addSubview(firstlabel2)
        return firstlabel2
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
