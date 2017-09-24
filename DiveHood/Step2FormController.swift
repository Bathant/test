//
//  Step2FormController.swift
//  DiveHood
//
//  Created by starwallet on 9/23/17.
//  Copyright © 2017 starwallet. All rights reserved.
//

import UIKit

class Step2FormController: UIViewController,UIPickerViewDelegate ,UIPickerViewDataSource,UITextFieldDelegate {
 var BusinessOwner  = BusinessOwnerController()
    
    let MES = Measurements()
    var verficationChecked: Bool = true
    var verficationCheckBox:UIImageView!
    var ReadPolicyCheckBox : UIImageView!
    let Counteries = ["Egypt" ,"Korea" , "Japan ", "China" ,"India" ]
    let City = ["Cairo","Alex", "Shobra"]
    var CounteresTextField : UITextField!
    var CitiesTextField : UITextField!
    var CounteriesPickerView : UIPickerView!
    var CitiesPickerView : UIPickerView!
    var Containerheight: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        Containerheight = form()
        CounteriesPickerView.dataSource =  self
        CounteriesPickerView.delegate = self
        CitiesPickerView.dataSource =  self
        CitiesPickerView.delegate = self
        CounteresTextField.delegate = self
        CitiesTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func intializeControllers(Bowner : BusinessOwnerController){
        self.BusinessOwner = Bowner
        
    }
    func form ()-> CGFloat{
        let name = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*MES.HEIGHT_32, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: "* Type the name of your business" , view: view)
         view.addSubview(name)
        CounteresTextField =    CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*MES.HEIGHT_16+name.frame.maxY, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: " " , view: view)
        CounteresTextField.text  = "* Business Country"
         view.addSubview(CounteresTextField)
        CounteriesPickerView = UIPickerView(frame: CGRect(x: view.frame.width*0.09, y: CounteresTextField.frame.maxY, width: view.frame.width*0.82, height: CounteresTextField.frame.height*2))
        CounteriesPickerView.isHidden = true
        CounteriesPickerView.backgroundColor = Colors().dropdowncolor
        
        let DownArrow = UIImageView(frame: CGRect(x: CounteresTextField.frame.maxX-(#imageLiteral(resourceName: "down_arrow").size.width), y: CounteresTextField.frame.minY+CounteresTextField.frame.height/2, width: #imageLiteral(resourceName: "down_arrow").size.width, height: #imageLiteral(resourceName: "down_arrow").size.height))
        
        DownArrow.image = #imageLiteral(resourceName: "down_arrow")
        view.addSubview(DownArrow)
        
        CitiesTextField =    CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*MES.HEIGHT_16+CounteresTextField.frame.maxY, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: " " , view: view)
        CitiesTextField.text = "* Business City"
        view.addSubview(CitiesTextField)
        let DownArrow2 = UIImageView(frame: CGRect(x: CitiesTextField.frame.maxX-(#imageLiteral(resourceName: "down_arrow").size.width), y: CitiesTextField.frame.minY+CitiesTextField.frame.height/2, width: #imageLiteral(resourceName: "down_arrow").size.width, height: #imageLiteral(resourceName: "down_arrow").size.height))
        DownArrow2.image = #imageLiteral(resourceName: "down_arrow")
        view.addSubview(DownArrow2)
        view.insertSubview(CounteriesPickerView, aboveSubview: CitiesTextField)

        CitiesPickerView = UIPickerView(frame: CGRect(x: view.frame.width*0.09, y: CitiesTextField.frame.maxY, width: view.frame.width*0.82, height: CitiesTextField.frame.height*2))
        CitiesPickerView.isHidden = true
        CitiesPickerView.backgroundColor = Colors().dropdowncolor
         view.addSubview(CitiesPickerView)
        
        
        ////////////////////////////////"******************* Business type ********************"//////////////////////////////////////
        let BusinessTypelabel = UILabel()
        BusinessTypelabel.frame.origin = CGPoint(x: view.frame.width*0.09+10, y: CitiesTextField.frame.maxY+view.frame.height*MES.HEIGHT_32)
        BusinessTypelabel.font = UIFont(name: "OpenSans", size: view.frame.height*0.024)
        BusinessTypelabel.text = "*Business Type"
        BusinessTypelabel.textColor = .white
        BusinessTypelabel.sizeToFit()
        view.addSubview(BusinessTypelabel)
        
       
        
       let tuple1 =  labelwithCheck(X: BusinessTypelabel.frame.minX, Y: BusinessTypelabel.frame.maxY+view.frame.height*MES.HEIGHT_16, text: "Dive Center", number: 0)
        let tuple2  =  labelwithCheck(X: BusinessTypelabel.frame.minX, Y: tuple1.2+view.frame.height*MES.HEIGHT_16, text: "Liveboard", number: 1)
       let tuple3 =   labelwithCheck(X: BusinessTypelabel.frame.minX, Y: tuple2.2+view.frame.height*MES.HEIGHT_16, text: "Dive Resort", number: 2)
        
        let blueLine = UIView(frame: CGRect(x: view.frame.width*0.09, y:tuple3.2+view.frame.height*MES.HEIGHT_16 , width: view.frame.width*0.82, height: 1))
        blueLine.backgroundColor = Colors().BorderColor
        view.addSubview(blueLine)
        
        
       ////////////////////////////////"******************* Verfication CheckBoxes ********************"//////////////////////////////////////
        
        let container1 = UIView(frame: CGRect(x: view.frame.width*0.09, y: blueLine.frame.maxY+view.frame.height*MES.HEIGHT_32, width: #imageLiteral(resourceName: "Check_Box").size.width, height: #imageLiteral(resourceName: "Check_Box").size.height))
        let tuple4 =  VerficationCheckBox(container: container1, text:"Verfiy your account via text messages.",adjustToFit:true , number: 3)
        view.addSubview(container1)
        verficationCheckBox = tuple4.1
        
        
        let container2 = UIView(frame: CGRect(x: view.frame.width*0.09, y: container1.frame.maxY+view.frame.height*0.0239, width: #imageLiteral(resourceName: "Check_Box").size.width, height: view.frame.height*0.05))
        let tuple  = VerficationCheckBox(container: container2, text: "Agree to our terms and confirms that you have read our policy", adjustToFit : false , number : 1 )
        let boldText  = "Agree to our terms and confirms that you have "
        let attrs = [NSForegroundColorAttributeName:Colors().blue ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        let normalText = "read our policy"
        let attrs2 = [NSForegroundColorAttributeName:UIColor.white]
        let normalString = NSMutableAttributedString(string:normalText, attributes: attrs2)
        attributedString.append(normalString)
        tuple.0.attributedText = attributedString
        ReadPolicyCheckBox = tuple.1
        view.addSubview(container2)
        
        ////////////////////////////////"******************* Verfication Button with BackButton ********************"//////////////////////////////////////
        
        
        
        let Lastcontainer = UIView(frame: CGRect(x: view.frame.width*0.09, y: container2.frame.maxY+view.frame.height*MES.HEIGHT_32, width: view.frame.width*0.82, height: view.frame.height*0.06))
        //Lastcontainer.backgroundColor = .gray
        view.addSubview(Lastcontainer)
            let Backarrow = UIImageView(frame: CGRect(x: 0 , y: Lastcontainer.frame.height/2-(#imageLiteral(resourceName: "left-blue-arrow").size.height/2), width: #imageLiteral(resourceName: "left-blue-arrow").size.width, height: #imageLiteral(resourceName: "left-blue-arrow").size.height))
            Backarrow.image = #imageLiteral(resourceName: "left-blue-arrow")
            Backarrow.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(BackStep))
        Backarrow.addGestureRecognizer(tap)
            Lastcontainer.addSubview(Backarrow)
        
        let Step1 = UILabel()
        Step1.frame.origin = CGPoint(x: Backarrow.frame.maxX+view.frame.width*MES.WIDTH_16, y: Lastcontainer.frame.height/4)
        Step1.font = UIFont(name: "OpenSans", size: view.frame.height*0.024)
        Step1.text = "Step 1"
        Step1.textColor = Colors().blue
        Step1.baselineAdjustment = .alignCenters
        Step1.sizeToFit()
        Lastcontainer.addSubview(Step1)
        
        let  signupBtn = ButtonWithGradient(frame: CGRect(x: Lastcontainer.frame.width-Lastcontainer.frame.width*0.65  , y: 0, width: Lastcontainer.frame.width*0.65 , height: Lastcontainer.frame.height), title: "VERFIY YOUR ACCOUNT", view: self.view)
        signupBtn.addTarget(self, action: #selector(Verfication_Pressed), for: .touchUpInside)
        
        Lastcontainer.addSubview(signupBtn)
        
         return Lastcontainer.frame.maxY
        
    }
    
    func Verfication_Pressed(){
        
        if verficationChecked{
            present(VerficationViaPhone(), animated: true, completion: nil)
        }
        else{
            present(VerficationViaMail(), animated: true, completion: nil)
            
        }
        
        
    }
    
    //Picker View Delegates 
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == CounteriesPickerView{
       return Counteries.count
        }
        else{
        return City.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == CounteriesPickerView{
       return Counteries[row]
        }
        else{
        return City[row]
        
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == CounteriesPickerView{
            CounteresTextField.text = Counteries[row]
            CounteriesPickerView.isHidden = true
        }
        else{
            CitiesTextField.text = City[row]
            CitiesPickerView.isHidden = true
        }
        
    }

    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        // self.pickerView(dropdownmenu, didSelectRow: row, inComponent: 1)
        let content :[String]
        if pickerView == CounteriesPickerView{
            content = Counteries
        }
        else{
        content = City
        }
        
        
        
        var label: UILabel
        if let view = view as? UILabel { label = view }
        else { label = UILabel() }
        
       label.text = content[row]
        label.textColor = .white
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        
        return label
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == CounteresTextField{
        
           CounteriesPickerView.isHidden = false
          
            textField.endEditing(true)
        
        }
        else{
        
            CitiesPickerView.isHidden = false
                       textField.endEditing(true)
        }
    }
    func labelwithCheck(X :CGFloat, Y:CGFloat , text: String, number :Int)->(UILabel,UIImageView , CGFloat){
    
        let checkbox = UIImageView(frame: CGRect(x: X, y: Y, width: #imageLiteral(resourceName: "Check_Box").size.width, height: #imageLiteral(resourceName: "Check_Box").size.height))
        checkbox.image = #imageLiteral(resourceName: "Empty_Check_Box")
        checkbox.tag = number
        checkbox.isUserInteractionEnabled = true
        view.addSubview(checkbox)
        let label = UILabel()
        label.frame.origin = CGPoint(x:checkbox.frame.maxX+view.frame.width*MES.WIDTH_16, y: Y)
        label.font = UIFont(name: "OpenSans", size: view.frame.height*0.017)
        label.text = text
        label.textColor = Colors().blue
        label.sizeToFit()
        view.addSubview(label)
        let Y = checkbox.frame.maxY
        return (label , checkbox , Y)
        
    }
    
    func VerficationCheckBox(container : UIView , text: String ,adjustToFit: Bool , number :Int)->(UILabel,UIImageView){
       
        let checkbox = UIImageView(frame: CGRect(x: 0, y: 0, width: #imageLiteral(resourceName: "Check_Box").size.width, height: #imageLiteral(resourceName: "Check_Box").size.height))
        checkbox.image = #imageLiteral(resourceName: "Check_Box")
        checkbox.tag = number
        checkbox.isUserInteractionEnabled = true
        container.addSubview(checkbox)
        let frame = CGRect(x: checkbox.frame.maxX+view.frame.width*MES.WIDTH_16 , y: 0, width: view.frame.width*0.82-(checkbox.frame.maxX+view.frame.width*0.0426*2), height: container.frame.height)
        let title = CustomeLabel(frame: frame, text: text, adjustTofit: adjustToFit, size: view.frame.height*0.017, fontName: "OpenSans")
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textAlignment = .left
        title.textColor = Colors().blue
        title.sizeToFit()
        container.addSubview(title)
        
        
        if number == 3 {
            let tap = UITapGestureRecognizer(target: self, action: #selector(verfiy))
            checkbox.addGestureRecognizer(tap)
        }
        else if number == 4 {
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(ReadPolicy))
            checkbox.addGestureRecognizer(tap)
            
        }
        
        return (title , checkbox)
        
    }
    func verfiy(_ sender:UITapGestureRecognizer){
        
        if verficationCheckBox.image == #imageLiteral(resourceName: "Empty_Check_Box"){
            verficationCheckBox.image = #imageLiteral(resourceName: "Check_Box")
            verficationChecked = true
        }
        else{
            verficationCheckBox.image = #imageLiteral(resourceName: "Empty_Check_Box")
            verficationChecked = false
        }
    }
    
    
    func ReadPolicy(_ sender:UITapGestureRecognizer){
        
        
        
        if ReadPolicyCheckBox.image == #imageLiteral(resourceName: "Empty_Check_Box"){
            ReadPolicyCheckBox.image = #imageLiteral(resourceName: "Check_Box")
            
        }
        else{
            ReadPolicyCheckBox.image = #imageLiteral(resourceName: "Empty_Check_Box")
            
        }
        
        
        
        
    }
    
    func getinstance(Bowner : BusinessOwnerController){
        self.BusinessOwner = Bowner
        
    }
    func BackStep(){
        UIView.animate(withDuration: 0.5) {
            
        }
       // UIView.animate(withDuration: 0.5, animations: {
            self.BusinessOwner.setupControllers(0, 0)
            self.BusinessOwner.setupControllers(1, self.view.frame.width)
        //}) { (true) in
            self.BusinessOwner.setFooter()
        //}
    }
   
 
}
