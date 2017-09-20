//
//  RaderAnimation.swift
//  trialnav
//
//  Created by starwallet on 9/19/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class RaderAnimation: UIBezierPath {
    var path : UIBezierPath!
    var view : UIView!
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    init(CirclePath :UIBezierPath ,smallCircleWidthandHeight : CGFloat , view:UIView,animationDuration :CFTimeInterval , StrockColor : CGColor , StrockWidth : CGFloat , CircleFillColor : CGColor) {
        super.init()
        self.path = CirclePath
        self.view = view
        //configure
        let circlelayerwithanimation =  ConfigureAnimationForPath(animationDuration: animationDuration, StrockColor: StrockColor ,StrockWidth: StrockWidth,CircleFillColor: CircleFillColor )
        view.layer.addSublayer(circlelayerwithanimation)
        
        MovableCircle(MovableCircle_width: smallCircleWidthandHeight,animationDuration :animationDuration )
        
        //views
        
    }
    
    func StrockAnimation(){
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 10
        circleLayer.fillColor = UIColor.clear.cgColor
        
        
    }
    
    
    
    func MovableCircle(MovableCircle_width: CGFloat,animationDuration :CFTimeInterval  ) {
        let animation = CAKeyframeAnimation(keyPath: "position");
        animation.duration = animationDuration
        animation.repeatCount = MAXFLOAT
        animation.path = path.cgPath
        
        let smallcircle = UIView(frame: CGRect(x: 100, y: 100, width: MovableCircle_width, height: MovableCircle_width))
        let pluses  = UIView(frame: CGRect(x: 0, y: 0, width: MovableCircle_width*3, height: MovableCircle_width*3))
        smallcircle.layer.cornerRadius = smallcircle.frame.width/2
        
        pluses.layer.cornerRadius = pluses.frame.width/2
        smallcircle.backgroundColor = UIColor.blue
        pluses.backgroundColor = UIColor.blue
        view.addSubview(smallcircle)
        view.addSubview(pluses)
        
        smallcircle.layer.add(animation, forKey: nil)
        let animationGroup = setUpAnimationGroup()
        pluses.layer.add(animationGroup, forKey: nil)
        pluses.layer.add(animation, forKey: nil)
    }
    
    
    
    func ConfigureAnimationForPath(animationDuration :CFTimeInterval , StrockColor : CGColor , StrockWidth : CGFloat , CircleFillColor : CGColor)-> CAShapeLayer{
        
        
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.strokeColor = StrockColor
        circleLayer.lineWidth = StrockWidth
        circleLayer.fillColor =  CircleFillColor
        
        
        
        let strockAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strockAnimation.fromValue = 0
        strockAnimation.toValue = 1
        strockAnimation.duration = animationDuration
        circleLayer.add(strockAnimation, forKey: nil)
        
        return circleLayer
    }
    func scaleAnimation() -> CABasicAnimation{
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = NSNumber(value: 0)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = 1.5
        
        
        
        return scaleAnimation
    }
    
    func OpacityAnimation ()-> CAKeyframeAnimation{
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = 1.5
        opacityAnimation.values = [0.4, 0.8, 0]
        opacityAnimation.keyTimes = [0, 0.2 , 1]
        return opacityAnimation
        
        
        
    }
    
    func setUpAnimationGroup ()-> CAAnimationGroup{
        let AnimationGroup = CAAnimationGroup()
        AnimationGroup.duration = 1.5
        AnimationGroup.repeatCount = MAXFLOAT
        let defualtCurve  = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        AnimationGroup.timingFunction = defualtCurve
        AnimationGroup.animations = [scaleAnimation() , OpacityAnimation()]
        
        
        return AnimationGroup
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
