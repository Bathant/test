//
//  TimeSlotsCell.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit
class TimeSlotsCell: UITableViewCell {
     var heightView:CGFloat!
     var WidthView:CGFloat!
    var language : Bool = AppDelegate.sharedInstance().language!
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
            let height = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*272/1334
            
            frame.size.height = height
            frame.size.width = UIScreen.main.bounds.maxX-UIScreen.main.bounds.minX
            super.frame = frame
            
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCell(){

        heightView = UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY
        WidthView = UIScreen.main.bounds.maxX-UIScreen.main.bounds.minX
        let date  = SetFirstPart()
        let lastView = UIView(frame: CGRect(x: 0, y: date.frame.maxY, width: contentView.frame.width, height: heightView*100/1334))
        lastView.backgroundColor = UIColor(red: 17/255,green:  42/255,blue: 76/255, alpha:1.0 )
        var str = "PRICES STARTS FROM"
        if language{
            str = " الأسعار تبدأ من "
        }
        let height = str.height(constraintedWidth: lastView.frame.width*0.5, font:  UIFont(name: "OpenSans-Bold", size: WidthView*28/750)!)
        let label4 =  HorizontalyLabels(str, font: UIFont(name: "OpenSans-Bold", size: WidthView*28/750)!, textcolor: .white, y: lastView.frame.height/2-height/2, container: lastView, Width: lastView.frame.width)
        
        
        var x = contentView.frame.maxX-WidthView*56/750-WidthView*160/750
        if language{
            x = WidthView*56/750
        }
        let RightContainer = UIView(frame: CGRect(x: x, y: 0, width: WidthView*150/750, height: lastView.frame.height))
        let arrow = UIImageView(frame: CGRect(x: lastView.frame.width-#imageLiteral(resourceName: "right-white-arrow").size.width-WidthView*25/750, y: lastView.bounds.midY-#imageLiteral(resourceName: "right-white-arrow").size.height/2, width: #imageLiteral(resourceName: "right-white-arrow").size.width, height: #imageLiteral(resourceName: "right-white-arrow").size.height))
            arrow.image = #imageLiteral(resourceName: "right-white-arrow")
        if language{
            arrow.image = #imageLiteral(resourceName: "Left-White-Arrow")
            arrow.frame.origin.x = WidthView*25/750
        }
        var texts = ["PER TRIP", "EGP"]
        if language{
            texts = ["سعر الرحلة", "جنيه"]
        }
        lastView.addSubview(arrow)
        //RightContainer.backgroundColor = .black
        let x1  =   HorizontalyLabels(texts[0], font: UIFont(name: "OpenSans", size: WidthView*24/750)!, textcolor: UIColor(red: 173/255, green: 155/255, blue: 26/255, alpha: 1), y: 0, container: RightContainer, Width: RightContainer.frame.width-(WidthView*25/750))
        x1.frame.size.width = RightContainer.frame.width
        x1.frame.origin.x = 0
        x1.textAlignment = .left
        
        let x2  =   HorizontalyLabels("20.783", font: UIFont(name: "OpenSans-SemiBold", size: WidthView*34/750)!, textcolor: UIColor(red: 237/255, green: 202/255, blue: 12/255, alpha: 1), y: x1.frame.maxY, container: RightContainer, Width: RightContainer.frame.width-(WidthView*25/750))
        if language{
            x2.text = "٢٠.٧٨٣"
        }
         x2.sizeToFit()
        
        let x1_1  =   HorizontalyLabels(texts[1], font: UIFont(name: "OpenSans", size: WidthView*24/750)!, textcolor: .white, y: x1.frame.minY, container: RightContainer, Width: RightContainer.frame.width-(WidthView*25/750))
        x1_1.frame.size.width = RightContainer.frame.width
        x1_1.frame.origin.x = 0
        x1_1.textAlignment = .right

        let sumheights = x1.frame.height+x2.frame.height
      
        let beginy = RightContainer.frame.height/2-sumheights/2
        x1.frame.origin.y = beginy
        x2.frame.origin.y = x1.frame.maxY
        x1_1.frame.origin.y = beginy
        lastView.addSubview(RightContainer)
        contentView.addSubview(lastView)
 
        
        
        
        
     
        
        
    }
    
    func SetFirstPart( )->UIView{
      
        
        
        
        var date = UIView(frame: CGRect(x: 0, y: 0, width: WidthView*96/750, height: heightView*140/1334))
        if language{
            date.frame.origin.x = contentView.frame.width-WidthView*96/750
        }
        date.backgroundColor = UIColor(red : 177/255,green: 177/255,blue: 177/255, alpha: 1.0)
        var texts = ["IN","8","July"]
        if language{
            texts = ["من","٨","يوليو"]
        }
        verticallyLabels(date, texts[0], texts[1], texts[2])
        let outDate = UIView(frame: CGRect(x: date.frame.width+1 , y: 0, width: WidthView*96/750, height: heightView*140/1334))
        outDate.backgroundColor = UIColor(red : 207/255,green: 207/255,blue: 209/255, alpha: 1.0)
         texts = ["OUT","12","July"]
        if language{
            texts = ["إلي","١٢","يوليو"]
        }
        verticallyLabels(outDate,texts[0], texts[1], texts[2])
        let ticketDescription = UIView(frame: CGRect(x: outDate.frame.maxX, y: 0, width: contentView.frame.width-outDate.frame.maxX, height: outDate.frame.height))
        ticketDescription.backgroundColor = UIColor(red: 230/255,green:  230/255,blue: 230/255, alpha:1.0 )
        
        var title = ["Brothers, Daedalus and Elphinstone", "5 Days / 6 Nights (Approximately 17 dives)","4 spaces Left"]
        if language{
            title = ["الأخوة، ديدالوس وإلفينستون","5 أيام / 6 ليال (حوالي 17 غطس)","٤ أماكن متبقية"]
        }
        
        let getlabel = HorizontalyLabels(title[0], font: UIFont(name: "OpenSans-SemiBold", size: WidthView*28/750)!, textcolor: UIColor(red: 12/255, green: 37/255, blue: 60/255, alpha: 1), y: 0, container: ticketDescription, Width: ticketDescription.frame.width-(WidthView*25/750))
        
        let label2  =   HorizontalyLabels(title[1], font: UIFont(name: "OpenSans", size: WidthView*24/750)!, textcolor: UIColor(red: 12/255, green: 37/255, blue: 60/255, alpha: 1), y: getlabel.frame.maxY, container: ticketDescription, Width: ticketDescription.frame.width-(WidthView*25/750))
        
        
        
        
        let label3 =  HorizontalyLabels(title[2], font: UIFont(name: "OpenSans", size: WidthView*24/750)!, textcolor: UIColor(red: 38/255, green: 38/255, blue: 38/255, alpha: 1), y: label2.frame.maxY+heightView*8/1334, container: ticketDescription, Width:(WidthView*174/750))
        label3.backgroundColor = UIColor(red: 207/255,green:  207/255,blue: 209/255, alpha:1.0 )
        label3.textAlignment = .center
        label3.sizeToFit()
        if language{
            ticketDescription.frame.origin.x = 0
            outDate.frame.origin.x=ticketDescription.frame.maxX
            label3.frame.origin.x = ticketDescription.bounds.maxX-label3.frame.width-WidthView*25/750*2
        }
           contentView.addSubview(ticketDescription)
        return date
    }
    
    
    func HorizontalyLabels(_ text :String , font : UIFont , textcolor : UIColor , y: CGFloat , container: UIView , Width : CGFloat)->UILabel{
        
        let text2 = text
        let getHeight2 = text.height(constraintedWidth: Width, font:  font)
        let firstlabel2 = UILabel(frame: CGRect(x: WidthView*25/750, y:y, width: Width-WidthView*25/750*2, height: getHeight2))
        firstlabel2.font = font
        firstlabel2.text = text2
        firstlabel2.textAlignment = .left
        if language{
             firstlabel2.textAlignment = .right
        }
        
        firstlabel2.textColor = textcolor
        container.addSubview(firstlabel2)
        return firstlabel2
        
    }
    func verticallyLabels(_ date : UIView, _ str1 : String , _ str2: String , _ str3: String){
        
        
        let Inlabel = UILabel()
        Inlabel.frame.origin = CGPoint(x: 0, y:heightView*8/1334)
        var string = str1
        var height = string.height(constraintedWidth:date.frame.width , font: UIFont(name: "OpenSans-Bold", size: WidthView*22/750)!)
        Inlabel.text = str1
        Inlabel.textAlignment = .center
        Inlabel.textColor = .black
        Inlabel.font = UIFont(name: "OpenSans-Bold", size: WidthView*22/750)
        Inlabel.frame.size = CGSize(width: date.frame.width, height: height)
        date.addSubview(Inlabel)
        contentView.addSubview(date)
        
        
        
        let numberlabel = UILabel()
        numberlabel.frame.origin = CGPoint(x:0, y:Inlabel.frame.maxY)
        numberlabel.text = str2
        string = str2
        height = string.height(constraintedWidth:date.frame.width , font: UIFont(name: "OpenSans-Bold", size: WidthView*34/750)!)
        numberlabel.textAlignment = .center
        numberlabel.textColor = .black
        numberlabel.font = UIFont(name: "OpenSans-Bold", size: WidthView*34/750)
        numberlabel.frame.size = CGSize(width: date.frame.width, height: height)
        date.addSubview(numberlabel)
        contentView.addSubview(date)
        
        
        let label = UILabel()
        label.frame.origin = CGPoint(x:0 , y:numberlabel.frame.maxY)
        label.text = str3
        string = str3
        height = string.height(constraintedWidth:date.frame.width , font: UIFont(name: "OpenSans", size: WidthView*24/750)!)
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "OpenSans", size: WidthView*24/750)
        label.frame.size = CGSize(width: date.frame.width, height: height)
        date.addSubview(label)
        contentView.addSubview(date)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
