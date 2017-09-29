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
    var language: Bool = AppDelegate.sharedInstance().language!
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
        var title = "* Type the name of your business"
        if language{
            
            title = "*اسم الشركة "
        }
        
        
        let name = CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*MES.HEIGHT_32, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: title  , view: view)
         view.addSubview(name)
        CounteresTextField =    CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*MES.HEIGHT_16+name.frame.maxY, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: " " , view: view)
       
        CounteresTextField.text  = "* Business Country"
        if language{
            CounteresTextField.text = "بلد الشركة"
        }
         view.addSubview(CounteresTextField)
        CounteriesPickerView = UIPickerView(frame: CGRect(x: view.frame.width*0.09, y: CounteresTextField.frame.maxY, width: view.frame.width*0.82, height: CounteresTextField.frame.height*2))
        CounteriesPickerView.isHidden = true
        CounteriesPickerView.backgroundColor = Colors().dropdowncolor
        var x = CounteresTextField.frame.maxX-(#imageLiteral(resourceName: "down_arrow").size.width)
        if language {
            x = view.frame.width*0.09+#imageLiteral(resourceName: "down_arrow").size.width
        }
        let DownArrow = UIImageView(frame: CGRect(x:x , y: CounteresTextField.frame.minY+CounteresTextField.frame.height/2, width: #imageLiteral(resourceName: "down_arrow").size.width, height: #imageLiteral(resourceName: "down_arrow").size.height))
        
        DownArrow.image = #imageLiteral(resourceName: "down_arrow")
        view.addSubview(DownArrow)
        
        CitiesTextField =    CustomizedTextField (frame: CGRect(x: view.frame.width*0.09, y: view.frame.height*MES.HEIGHT_16+CounteresTextField.frame.maxY, width: view.frame.width*0.82, height: view.frame.height*0.07) , PlaceHolder: " " , view: view)
        CitiesTextField.text = "* Business City"
        if language{
            CitiesTextField.text = "مدينة الشركة"
        }
        view.addSubview(CitiesTextField)
        let DownArrow2 = UIImageView(frame: CGRect(x:x, y: CitiesTextField.frame.minY+CitiesTextField.frame.height/2, width: #imageLiteral(resourceName: "down_arrow").size.width, height: #imageLiteral(resourceName: "down_arrow").size.height))
        DownArrow2.image = #imageLiteral(resourceName: "down_arrow")
        view.addSubview(DownArrow2)
        view.insertSubview(CounteriesPickerView, aboveSubview: CitiesTextField)

        CitiesPickerView = UIPickerView(frame: CGRect(x: view.frame.width*0.09, y: CitiesTextField.frame.maxY, width: view.frame.width*0.82, height: CitiesTextField.frame.height*2))
        CitiesPickerView.isHidden = true
        CitiesPickerView.backgroundColor = Colors().dropdowncolor
         view.addSubview(CitiesPickerView)
        
        
        ////////////////////////////////"******************* Business type ********************"//////////////////////////////////////
        let BusinessTypelabel = UILabel()
         x = view.frame.width*0.09+10
        var alignment = NSTextAlignment.left
         BusinessTypelabel.text = "*Business Type"
        var xofcheckbox = view.frame.width*0.15
        
        if language{
            x = 0
            BusinessTypelabel.text = "نوع الشركة"
            alignment = .right
            xofcheckbox = view.frame.maxX-#imageLiteral(resourceName: "Check_Box").size.width-view.frame.width*0.15
            
        }
       
       var str = BusinessTypelabel.text!
        let getheight :CGFloat = str.height(constraintedWidth: view.frame.width, font:  UIFont(name: "OpenSans", size: view.frame.height*0.024)!)
        BusinessTypelabel.frame.origin = CGPoint(x:x , y: CitiesTextField.frame.maxY+view.frame.height*MES.HEIGHT_32)
        BusinessTypelabel.frame.size = CGSize(width: view.frame.width-view.frame.width*0.09, height: getheight)
        BusinessTypelabel.font = UIFont(name: "OpenSans", size: view.frame.height*0.024)
        BusinessTypelabel.textAlignment = alignment
        BusinessTypelabel.textColor = .white
        //BusinessTypelabel.sizeToFit()
        view.addSubview(BusinessTypelabel)
        
       var text = ["Dive Center", "Liveaboard" , "Dive Resort"]
        
        if language{
            text = ["مركز الغوص"," فندق عائم ","منتجع الغوص" ]
        }
        
        
       let tuple1 =  labelwithCheck(X: xofcheckbox, Y: BusinessTypelabel.frame.maxY+view.frame.height*MES.HEIGHT_16, text: text[0], number: 0)
        let tuple2  =  labelwithCheck(X: xofcheckbox, Y: tuple1.2+view.frame.height*MES.HEIGHT_16, text: text[1] , number: 1)
       let tuple3 =   labelwithCheck(X: xofcheckbox, Y: tuple2.2+view.frame.height*MES.HEIGHT_16, text: text[2], number: 2)
        
        let blueLine = UIView(frame: CGRect(x: view.frame.width*0.09, y:tuple3.2+view.frame.height*MES.HEIGHT_16 , width: view.frame.width*0.82, height: 1))
        blueLine.backgroundColor = Colors().BorderColor
        view.addSubview(blueLine)
        
        
       ////////////////////////////////"******************* Verfication CheckBoxes ********************"//////////////////////////////////////
         x = view.frame.width*0.09
        if language{
            x = view.frame.maxX-#imageLiteral(resourceName: "Check_Box").size.width-view.frame.width*0.09
        }
        
        
        let container1 = UIView(frame: CGRect(x: x, y: blueLine.frame.maxY+view.frame.height*MES.HEIGHT_32, width: #imageLiteral(resourceName: "Check_Box").size.width, height: #imageLiteral(resourceName: "Check_Box").size.height))
        title = "تحقق من حسابك عبر الرسائل النصية."
        if !language{
            
            title = "Verfiy your account via text messages."
        }
        let tuple4 =  VerficationCheckBox(container: container1, text:title,adjustToFit:true , number: 3)
        view.addSubview(container1)
        verficationCheckBox = tuple4.1
        
        
        let container2 = UIView(frame: CGRect(x: x, y: container1.frame.maxY+view.frame.height*0.0239, width: #imageLiteral(resourceName: "Check_Box").size.width, height: view.frame.height*0.05))
        title = "أوافق علي الشروط وأؤكد انني قرأت الشروط المستوفاة'"
        if !language{
            
            title = "Agree to our terms and confirms that you have read our policy"
        }
        
        
        let tuple  = VerficationCheckBox(container: container2, text: title, adjustToFit : false , number : 1 )
        
         var boldText = "أوافق علي الشروط وأؤكد انني قرأت"
        if !language{
            
            boldText = "Agree to our terms and confirms that you have "
        }
        let attrs = [NSForegroundColorAttributeName:Colors().blue ]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
       
        
        var normalText = "  الشروط المستوفاة"
        if !language{
            
            normalText = " read our policy"
        }
        
        
        
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
        
        var  arrowx:CGFloat = 0
        var img = #imageLiteral(resourceName: "left-blue-arrow")
        if language{
            arrowx = Lastcontainer.bounds.maxX - #imageLiteral(resourceName: "left-blue-arrow").size.width
            img = #imageLiteral(resourceName: "right-blue-arrow")
        }
            let Backarrow = UIImageView(frame: CGRect(x: arrowx , y: Lastcontainer.frame.height/2-(#imageLiteral(resourceName: "left-blue-arrow").size.height/2), width: #imageLiteral(resourceName: "left-blue-arrow").size.width, height: #imageLiteral(resourceName: "left-blue-arrow").size.height))
            Backarrow.image = img
            Backarrow.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(BackStep))
        Backarrow.addGestureRecognizer(tap)
            Lastcontainer.addSubview(Backarrow)
        var labelx = Backarrow.frame.maxX+view.frame.width*0.15
         str = "Step 1"
        alignment = .left
        if language{
            
            labelx = 0
            str = "الخطوة الأولي"
            alignment = .right
        }
        
        
        let Step1 = UILabel()
        Step1.frame.origin = CGPoint(x:labelx , y: Lastcontainer.frame.minY+#imageLiteral(resourceName: "left-blue-arrow").size.height/2)
        let getHeight = str.height(constraintedWidth: view.frame.width, font:  UIFont(name: "OpenSans", size: 28*view.frame.width/750)!)
        Step1.frame.size = CGSize(width: view.frame.width-view.frame.width*0.15, height: getheight)
        Step1.font = UIFont(name: "OpenSans", size: 28*view.frame.width/750)
        Step1.text = str
        Step1.textAlignment = alignment
        Step1.textColor = Colors().blue
      //  Step1.baselineAdjustment = .alignCenters
       // Step1.sizeToFit()
        view.addSubview(Step1)
        
        
        title = "VERFIY YOUR ACCOUNT"
        x = Lastcontainer.frame.width-Lastcontainer.frame.width*0.65
        if language{
            
            title = "تحقق من حسابك"
            x = 0
        }
        
        let  signupBtn = ButtonWithGradient(frame: CGRect(x: x , y: 0, width: Lastcontainer.frame.width*0.65 , height: Lastcontainer.frame.height), title: title, view: self.view)
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
        
        var x = checkbox.frame.maxX+view.frame.width*0.05
        var alignment = NSTextAlignment.left
        var width = view.frame.width*0.82-(checkbox.frame.maxX+view.frame.width*0.0426*2)
        
        if language{
            x = 0
            alignment = .right
            width = view.frame.width-checkbox.frame.width-view.frame.width*0.17
           
        }

        
        
        let label = UILabel()
        label.frame.origin = CGPoint(x:x, y: Y)
        let getheight = text.height(constraintedWidth: width, font: UIFont(name: "OpenSans", size: 24*view.frame.width/750)!)
        label.frame.size = CGSize(width: width,height: getheight )
        label.font = UIFont(name: "OpenSans", size: 24*view.frame.width/750)
        label.text = text
        label.textColor = Colors().blue
        label.textAlignment = alignment
       // label.sizeToFit()
        view.addSubview(label)
        let Y = checkbox.frame.maxY
        return (label , checkbox , Y)
        
    }
    
    func VerficationCheckBox(container : UIView , text: String ,adjustToFit: Bool , number :Int)->(UILabel,UIImageView){

        let img = #imageLiteral(resourceName: "Check_Box")
        
        let checkbox = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        checkbox.image = #imageLiteral(resourceName: "Check_Box")
        
        checkbox.tag = number
        var x = checkbox.frame.maxX+view.frame.width*0.12
        var alignment = NSTextAlignment.left
        var width = view.frame.width*0.82-(checkbox.frame.maxX+view.frame.width*0.0426*2)
        var y = container.frame.minY
        if language{
            x = 0
            alignment = .right
            width = view.frame.width-checkbox.frame.width-view.frame.width*0.12
            y = container.frame.minY
        }
        
        checkbox.isUserInteractionEnabled = true
        container.addSubview(checkbox)
        let height = text.height(constraintedWidth: width, font: UIFont(name: "OpenSans", size: view.frame.width*24/750)!)
        let frame = CGRect(x: x, y:y , width: width, height: height)
        let title = CustomeLabel(frame: frame, text: text, adjustTofit: adjustToFit, size: view.frame.width*24/750, fontName: "OpenSans")
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textAlignment = alignment
        title.textColor = Colors().blue
        //title.sizeToFit()
        view.addSubview(title)
        
        
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
