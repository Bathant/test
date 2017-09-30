//
//  SinglePageTableCell.swift
//  DiveHood
//
//  Created by starwallet on 9/26/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class SinglePageTableCell: UITableViewCell {
    let heightview: CGFloat = UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY
    let Widthview:CGFloat = UIScreen.main.bounds.maxX-UIScreen.main.bounds.minX
    var icon : UIImageView!
    var language : Bool = AppDelegate.sharedInstance().language!
    var Title : UILabel!
    var arrow: UIImageView!
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let height = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*113/1334
            
            frame.size.height = height
            frame.size.width = UIScreen.main.bounds.maxX-UIScreen.main.bounds.minX
            super.frame = frame
            
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let bigContainer = UIView(frame: CGRect(x: 0, y: 0, width: Widthview, height: heightview*88/1334))
        bigContainer.backgroundColor =  UIColor(red: 52/255, green: 42/255, blue: 72/255, alpha: 1.0)
        contentView.addSubview(bigContainer)
        let container = UIView(frame: CGRect(x: Widthview*25/750, y: 0, width: contentView.frame.width-(Widthview*25/750*2), height: heightview*88/1334))
        
        container.backgroundColor = UIColor(red: 52/255, green: 42/255, blue: 72/255, alpha: 1.0)
      //  container.backgroundColor  = .black
        
        var x : CGFloat = 0
        if language{
            
            x = container.bounds.maxX-#imageLiteral(resourceName: "purple-map").size.width
        }
        
        icon = UIImageView(frame: CGRect(x: x, y:Widthview*25/750 , width: #imageLiteral(resourceName: "purple-map").size.width,height: #imageLiteral(resourceName: "purple-map").size.height))
        
        container.addSubview(icon)
        
         x  = icon.frame.maxX+Widthview*30/750
        if language{
            
            x = container.bounds.minX
           
        }
        
       Title =  makeOneLineLabel(container , x: x , y:0, text: "Boat Amenities" , textColor: .white , Fontname: "OpenSans" , FontSize: heightview*30/1334)
        if language{
        Title.frame.size.width = container.frame.width-#imageLiteral(resourceName: "purple-map").size.width
        Title.textAlignment = .right
        }
        x = container.frame.maxX*0.78
        var text = "Details"
        if language {
            x = #imageLiteral(resourceName: "left-blue-arrow").size.width+10
            text = "التفاصيل "
        }
        let anotherlabel =  makeOneLineLabel(container , x: x , y:0, text: text , textColor: UIColor(red:77/255 , green: 194/255, blue :230/255, alpha: 1.0) , Fontname: "OpenSans" , FontSize: heightview*30/1334)
        x =  container.frame.width-#imageLiteral(resourceName: "right-blue-arrow").size.width
        if language {
            x =  0
        }
        
        let rightarrow = UIImageView(frame: CGRect(x: x, y: container.frame.height/2-(#imageLiteral(resourceName: "right-blue-arrow").size.height/2), width: #imageLiteral(resourceName: "right-blue-arrow").size.width, height: #imageLiteral(resourceName: "right-blue-arrow").size.height))
         rightarrow.image = #imageLiteral(resourceName: "right-blue-arrow")
        if language{
             rightarrow.image = #imageLiteral(resourceName: "left-blue-arrow")
        }
       
        
        container.addSubview(rightarrow)
        
        container.addSubview(Title)
         container.addSubview(anotherlabel)
        contentView.addSubview(container)
        
    }
    func makeOneLineLabel(_ container :UIView, x : CGFloat , y:CGFloat , text :String , textColor: UIColor , Fontname : String , FontSize : CGFloat)->UILabel{
        let label = UILabel()
        label.frame.origin = CGPoint(x: x, y:y)
       // label.adjustsFontSizeToFitWidth = true
        label.text = text
        label.textAlignment = .left
        label.textColor = textColor
        label.font = UIFont(name: Fontname, size: FontSize)
       label.frame.size.width = container.frame.width
        label.frame.size.height = container.frame.height
        //label.sizeToFit()
        container.addSubview(label)
        return label
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
