//
//  LiveaBoardsLists.swift
//  DiveHood
//
//  Created by starwallet on 9/24/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit
import MapKit

class LiveaBoardsLists: UIViewController,UITableViewDataSource, UITableViewDelegate,MKMapViewDelegate  {
    var tableview: UITableView!
    var mapView : MKMapView!
    var mapContainer : UIView!
    var TabBarHeight :CGFloat!
    var positionsX :[CGFloat] = [0]
    var Annotaions : [MKAnnotation]!
    var  scrollview :UIScrollView!
    let imags = ["fiji-siren-1","indo-siren-1","palau-siren-5", "indo-siren-1"]
    var beginY : CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupbackgroundGradient()
        TabBarHeight =  self.tabBarController!.tabBar.frame.height
        setupUi()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CustomTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableview.separatorStyle = .none

        // Do any additional setup after loading the view.
    }
    
    
    
    func setupUi(){
        SetupNavigationBar()
        statusBarGradient()
         beginY = setupSegmentedControl()
        setupTableView(beginY)
       
        statusBarGradient()
        
        
    }
  
    
    func statusBarGradient(){
        
        let frame = UIApplication.shared.statusBarFrame
        let view1 = UIView()
        view1.backgroundColor = UIColor(red:56/255, green:44/255, blue:98/255, alpha:1.0)
        view1.frame = frame
        view.addSubview(view1)
        
    }
    
    func SetupNavigationBar(){
        self.title = "LiveaBoard Lists"
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
        var menuimage = UIImage(named: "nb-menu")
        menuimage = menuimage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuimage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        var SearchImage = UIImage(named: "nb-search")
        SearchImage = SearchImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        var FilterImage = UIImage(named: "nb-filter")
        FilterImage = FilterImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        
        let searrchItem = UIBarButtonItem(image: SearchImage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        let filterItem =  UIBarButtonItem(image: FilterImage, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItems = [ filterItem,searrchItem]
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
    
    
    func setupSegmentedControl()->CGFloat{
        let container = UIView(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: view.frame.width, height: view.frame.height*0.07))
        
        
        
        print("navigation height\(self.navigationController!.navigationBar.intrinsicContentSize.height)")
        container.backgroundColor = UIColor(red:56/255, green:44/255, blue:98/255, alpha:1.0)
        let items = ["List", "Map"]
        let segmented = UISegmentedControl(items: items)
        segmented.frame = CGRect(x: view.frame.width*0.04, y: view.frame.height*0.013, width: container.frame.width-(view.frame.width*0.04*2), height: container.frame.height-(view.frame.height*0.013*2))
        segmented.tintColor = Colors().blue
        segmented.selectedSegmentIndex = 0
        container.addSubview(segmented)
        view.addSubview(container)
       segmented.addTarget(self, action: #selector(self.segmentChange), for: .valueChanged )
        
        return container.frame.maxY
    }
    func setupTableView(_ maxy:CGFloat){
        
        tableview = UITableView(frame: CGRect(x: 0, y: maxy+view.frame.height*0.007, width: view.frame.width, height: view.frame.height - (maxy+view.frame.height*0.007)))
        view.addSubview(tableview)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(Single_Page(), animated: true)
    }
    
    //*************************** Tableview Protocols  Functionalities *******************************//
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomTableViewCell
        cell.img.image = UIImage(named: imags[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellimageheight  = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*450/1334
        
        return cellimageheight
    }
    
    
    
    //#############   END OF Tableview Protocols  Functionalities #####################################//
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupmap(_ maxy :CGFloat){
        mapContainer = UIView(frame: CGRect(x: 0, y: maxy, width: view.frame.width, height: view.frame.height-TabBarHeight-maxy))
        view.addSubview(mapContainer)
       
        mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: mapContainer.frame.width, height: mapContainer.frame.height))
         mapView.delegate = self
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
        
        //second annotaion
        CreateAnnotation(long: 39.0099668, lat: 30.6857814)
        CreateAnnotation(long: 37.0099668, lat: 29.6857814)
        CreateAnnotation(long: 35.335813, lat: 27.493442)
        CreateAnnotation(long: 30.350153, lat: 26.460239)
        
        
        
        setsliderContainer()
        
        
        
        
        
    }
    
    func setsliderContainer (){
        
        let Barheight:CGFloat  = self.tabBarController!.tabBar.frame.height
        print(Barheight)
         scrollview  = UIScrollView(frame: CGRect(x: 0, y: mapContainer.frame.height-view.frame.height*440/1334 , width: mapContainer.frame.width, height: view.frame.height*440/1334))
        print(view.frame.height)
        print(self.tabBarController!.tabBar.frame.minY-view.frame.height*440/1334)
         print(view.frame.height-self.tabBarController!.tabBar.frame.height)
        print(view.frame.height*440/1334)
        print(view.frame.height*0.353)
        
        scrollview.backgroundColor = UIColor(red:37/255, green:43/255, blue:87/255, alpha:0.9)
        scrollview.isPagingEnabled = true
        scrollview.contentSize = CGSize(width: mapContainer.frame.width*3, height: mapContainer.frame.height*440/1334)
        scrollview.showsHorizontalScrollIndicator = false
        
        mapContainer.addSubview(scrollview)
       
        var  x =  makeABoxContainer(scrollview , xposition : 0 , yposition : view.frame.height*50/1334 ,img: #imageLiteral(resourceName: "fiji-siren-1") )
        positionsX.append(x)
        x = makeABoxContainer(scrollview , xposition :x , yposition : view.frame.height*50/1334 ,img:#imageLiteral(resourceName: "indo-siren-1"))
        positionsX.append(x)
        x =  makeABoxContainer(scrollview , xposition : x , yposition : view.frame.height*50/1334 ,img:#imageLiteral(resourceName: "palau-siren-5"))
        positionsX.append(x)
        x = makeABoxContainer(scrollview , xposition : x , yposition : view.frame.height*50/1334 ,img:#imageLiteral(resourceName: "indo-siren-1"))
       
        //85 45
        
        let numbersofCabinsFound = UILabel(frame: CGRect(x: 0, y: scrollview.frame.minY - view.frame.height*45/1334, width: view.frame.width*85/750, height: view.frame.height*45/1334))
        numbersofCabinsFound.backgroundColor = UIColor(red: 37/255, green: 43/255, blue: 87/255, alpha: 1.0)
        numbersofCabinsFound.text = "20"
        numbersofCabinsFound.textColor = .white
        numbersofCabinsFound.font = UIFont(name: "OpenSans-Bold", size: view.frame.width*0.0453)
        numbersofCabinsFound.textAlignment = .center
        
        mapContainer.addSubview(numbersofCabinsFound)
        
        //260 45
        
        let LabelsofCabinsFound = UILabel(frame: CGRect(x: numbersofCabinsFound.frame.maxX, y: numbersofCabinsFound.frame.minY , width: view.frame.width*260/750, height: numbersofCabinsFound.frame.height))
        LabelsofCabinsFound.backgroundColor = UIColor(red: 37/255, green: 43/255, blue: 87/255, alpha: 0.95)
        LabelsofCabinsFound.text = "liveaboards Found"
        LabelsofCabinsFound.textColor = .white
        LabelsofCabinsFound.font = UIFont(name: "OpenSans", size: view.frame.width*0.032)
        LabelsofCabinsFound.textAlignment = .center
        mapContainer.addSubview(LabelsofCabinsFound)
        
        
        // makeABoxContainer(scrollview , xposition : view.frame.width*0.5 , yposition : view.frame.height*0.0374 )
        
    }
    func makeABoxContainer(_ scrollview: UIScrollView , xposition : CGFloat , yposition : CGFloat, img: UIImage)->CGFloat{
        let subcontainer = UIView(frame: CGRect(x: xposition, y: yposition, width: view.frame.width*0.5, height: scrollview.frame.height-(view.frame.height*50/1334*2)))
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
        
        
        scrollview.addSubview(subcontainer)
    
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
        
        
        let smallDetail = UILabel(frame: CGRect(x: smallerPrice.frame.minX, y: smallerPrice.frame.maxY, width: subContainer.frame.width, height: subContainer.frame.height*1/3))
        smallDetail.text = "PER TRIP"
        smallDetail.textColor = UIColor(red:173/255, green:155/355, blue:26/255, alpha:1.0)
        smallDetail.font = UIFont(name: "OpenSans-Bold", size: view.frame.width*0.0187)
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
       anView?.image = UIImage(named: "purple-map.png")
        
        return anView
    }
    
    //////when segment Change Map View set up
    
    func segmentChange(sender:UISegmentedControl) {

        switch sender.selectedSegmentIndex{
        case 0:
            mapContainer.removeFromSuperview()
            viewDidLoad()

        case 1:
            tableview.removeFromSuperview()
             setupmap(beginY)
           
        default:
            break
        }

    }
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
       
        scrollview.setContentOffset(CGPoint(x:(positionsX[2]-view.frame.width*4) , y: 0), animated: true)
    }
    
    
    
    
    
}
