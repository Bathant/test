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
         scrollView.contentSize = CGSize(width: view.frame.width, height: y+1000)
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
        var  label6 =  makeOneLineLabel(conainer2 , x: label5.frame.origin.x , y:label5.frame.maxY, text: "Pick Cabin & book" , textColor: .white, Fontname: "OpenSans-Bold" , FontSize: view.frame.height*28/1334)
        
        
        
        
        scrollView.addSubview(conainer2)
        
        
        
        return container1.frame.maxY
        
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
        
        return container.frame.maxY
        
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
        
        
        let subHeader = UILabel(frame: CGRect(x: 0, y: Header.frame.maxY, width: DescriptionView.frame.width, height: DescriptionView.frame.height*1/2))
        //subHeader.backgroundColor = .red
        subHeader.text = "Total distance 59.45 km (36.94 mi)"
        subHeader.textColor = UIColor(red:0.34, green:0.34, blue:0.34, alpha:1.0)
        subHeader.font = UIFont(name: "OpenSans", size: view.frame.width*0.032)
        subHeader.textAlignment = .center
        subHeader.sizeToFit()
        SubContainer.addSubview(subHeader)
        
        
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
      //*************************** Tableview Protocols  Functionalities *******************************//
    func setTableview(_ y:CGFloat  ) ->CGFloat{
        let tableView = UITableView(frame: CGRect(x: 0, y: y, width: view.frame.width, height: view.frame.height*113/1334*6))
        scrollView.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SinglePageTableCell.classForCoder(), forCellReuseIdentifier: "SinglePageCell")
        return tableView.frame.maxY
        
        
    }
    let Titles = ["Boat Amenities","Diving Services", "Location On Map", "Liveaboard Images", "Liveaboard Videos", "Reviews"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SinglePageCell", for: indexPath as IndexPath) as! SinglePageTableCell
        cell.selectionStyle = .none
        cell.icon.image = #imageLiteral(resourceName: "purple-map")
        cell.Title.text = Titles[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellimageheight  = (UIScreen.main.bounds.maxY-UIScreen.main.bounds.minY)*113/1334
        
        return cellimageheight
    }
    
    
    
    //#############   END OF Tableview Protocols  Functionalities #####################################//
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
