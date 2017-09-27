//
//  LocationOnMap.swift
//  DiveHood
//
//  Created by starwallet on 9/27/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit
import MapKit
class LocationOnMap: UIViewController ,MKMapViewDelegate{
    var mapView: MKMapView!
    var  actionSheet : UIAlertController!
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUi()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SetupUi(){
        self.setupnavigation(viewController: self, Title: "View On Map")
        self.SetupGradient(viewx: self.view)
        self.SetupStautsBar(viewx: self.view)
        setupmap()
        
    }
    
    
    
    
    func setupmap(){
        
        let  mapContainer = UIView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.width, height: view.frame.height-(self.navigationController?.navigationBar.frame.maxY)!))
        view.addSubview(mapContainer)
        
        mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: mapContainer.frame.width, height: mapContainer.frame.height))
        mapView.delegate = self as! MKMapViewDelegate
        mapView.showsUserLocation = true
        mapContainer.addSubview(mapView)
        let firstCoardinat =  CLLocationCoordinate2DMake(40.9922868, 32.6672701)
        let firstAnnotaion = MKPointAnnotation()
        
        let region = MKCoordinateRegion(center: firstCoardinat, span: .init(latitudeDelta: mapView.region.span.latitudeDelta , longitudeDelta: mapView.region.span.longitudeDelta))
        mapView.setRegion(region, animated: true)
        
        firstAnnotaion.coordinate = firstCoardinat
        firstAnnotaion.title = "Grand Sea Serpent"
        firstAnnotaion.subtitle = "Liveaboard"
        
        //firstAnnotaion.im
        mapView.addAnnotation(firstAnnotaion)
        
    }
    func CreateAnnotation(long : CLLocationDegrees , lat : CLLocationDegrees){
        
        
        let Coardinat =  CLLocationCoordinate2DMake(long, lat)
        let Annotaion = MKPointAnnotation()
        Annotaion.coordinate = Coardinat
        Annotaion.title = "Grand Sea Serpent"
        Annotaion.subtitle = "Liveaboard"
        mapView.addAnnotation(Annotaion)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        let reuseId = "Location"
        
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = true
        }
        else {
            anView!.annotation = annotation
        }
        
        anView?.image = UIImage(named: "map-focus-bg.png")
        
        
        return anView
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
       
        let actionSheet = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
       
        
        var str = "Grand Sea Serpent"
        let width = actionSheet.view.frame.width
        let height = actionSheet.view.frame.height
        var getHight = str.height(constraintedWidth: width, font: UIFont(name: "OpenSans-Bold", size: 20)!)
        let TitleView = UILabel(frame: CGRect(x: width*35/750, y: width*35/750, width: actionSheet.view.frame.width, height: getHight))
        TitleView.font = UIFont(name: "OpenSans-Bold", size: 20)
        TitleView.text = "Grand Sea Serpent"
        TitleView.textColor = UIColor(red: 68/255, green: 59/255, blue: 87/255, alpha: 1.0)
        actionSheet.view.addSubview(TitleView)
        
        
      
        str = "Total distance 59.45 km (36.94 mi)"
        getHight = str.height(constraintedWidth: width, font: UIFont(name: "OpenSans", size: 14)!)
        let sub_title = UILabel(frame: CGRect(x: width*35/750, y: TitleView.frame.maxY, width: actionSheet.view.frame.width, height: getHight))
        sub_title.font = UIFont(name: "OpenSans", size: 14)
        sub_title.text = str
        sub_title.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        actionSheet.view.addSubview(sub_title)
        
        
        let widthofratings = #imageLiteral(resourceName: "gold-star").size.width*5
        let ratings = UIView(frame: CGRect(x: width*35/750, y:sub_title.frame.maxY , width:widthofratings , height: #imageLiteral(resourceName: "gold-star").size.height ))
        setupStars(ratings)
        actionSheet.view.addSubview(ratings)
       
        let Button1 = makeButton(actionSheet: actionSheet, y: ratings.frame.maxY + height*16/750, x: width*16/750, text1: "Direction", text2: "36.94 M", textcolor :UIColor(red: 62/255, green: 59/255, blue: 87/255, alpha: 1.0) )
        let Button2 = makeButton(actionSheet: actionSheet, y: Button1.frame.minY, x: Button1.frame.maxX+width*16/750, text1: "Book Now", text2: "12 Cabins Available", textcolor: UIColor(red: 238/255, green: 207/255, blue:0, alpha: 1.0))
        Button2.backgroundColor = UIColor(red: 62/255, green: 59/255, blue: 87/255, alpha: 1.0)
        self.present(actionSheet, animated: true, completion: nil)
        let closeButton = UIImageView(frame: CGRect(x: Button2.frame.maxX-#imageLiteral(resourceName: "clear-btn").size.width, y: TitleView.frame.minY, width: #imageLiteral(resourceName: "clear-btn").size.width, height: #imageLiteral(resourceName: "clear-btn").size.height ))
        closeButton.image = #imageLiteral(resourceName: "clear-btn")
        actionSheet.view.addSubview(closeButton)
        let tab = UITapGestureRecognizer(target: self, action: #selector(dismessactionSheet))
        closeButton.isUserInteractionEnabled = true
        closeButton.addGestureRecognizer(tab)
        print(height)
        print(width)
        print(self.view.frame.width)
        print(self.view.frame.height)
    }
    
    func dismessactionSheet(){
    
       self.dismiss(animated: true, completion: nil)
    
    }
    func makeButton(actionSheet:UIAlertController  , y : CGFloat , x : CGFloat , text1: String , text2: String , textcolor: UIColor)->UIView{
        let width = actionSheet.view.frame.width
        let height = actionSheet.view.frame.height
        let DirectionView = UIView(frame: CGRect(x: x, y: y, width: width*330/750, height:  height*90/1334))
        DirectionView.layer.borderWidth = 2
        
        DirectionView.layer.borderColor = UIColor(red: 68/255, green: 59/255, blue: 87/255, alpha: 1.0).cgColor
        var str = text1
        var getHight = str.height(constraintedWidth: width, font: UIFont(name: "OpenSans-Semibold", size: 14)!)
        var str2 = text2
        var getHight2 = str.height(constraintedWidth: width, font: UIFont(name: "OpenSans", size: 12)!)
        let Direction = UILabel(frame: CGRect(x: 0  , y: DirectionView.frame.height/2-(getHight+getHight2)/2  , width: DirectionView.frame.width, height: getHight))
        Direction.font = UIFont(name: "OpenSans-Semibold", size: 14)
        Direction.text = str
        Direction.baselineAdjustment = .alignBaselines
        Direction.textAlignment = .center
        //Direction.backgroundColor = .black
        Direction.textColor = textcolor
        DirectionView.addSubview(Direction)
        
        
        
        
        let Direction_sub = UILabel(frame: CGRect(x: 0  , y: Direction.frame.maxY, width: DirectionView.frame.width, height: getHight2))
        Direction_sub.font = UIFont(name: "OpenSans", size: 12)
        Direction_sub.text = str2
        // Direction_sub.backgroundColor = .black
        Direction_sub.textAlignment = .center
        Direction_sub.textColor  = textcolor
        DirectionView.addSubview(Direction_sub)
        
        
        actionSheet.view.addSubview(DirectionView)
        return DirectionView
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
    
    
    
    
}
