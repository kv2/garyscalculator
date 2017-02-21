//
//  FirstViewController.swift
//  Gary's Calculator
//
//  Created by john doe on 1/19/17.
//  Copyright © 2017 john doe. All rights reserved.
//

import UIKit


class GCLinearSpreadFootingVC:UIViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate{
    

    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //value holders
    
    @IBOutlet weak var textFieldDLWallPerSF: UITextField!
    @IBOutlet weak var textFieldDLFloorPerSF: UITextField!
    @IBOutlet weak var textFieldDLRoofPerSF: UITextField!
    @IBOutlet weak var textFieldLLRoofPerSF: UITextField!
    @IBOutlet weak var textFieldHeightEachWallFT: UITextField!
    @IBOutlet weak var textFieldDepthOfFloorFT: UITextField!
    @IBOutlet weak var textFieldDepthOfRoofFT: UITextField!

    @IBOutlet weak var textFieldFactorOfSafety: UITextField!
    @IBOutlet weak var textFieldNumberOfFloors: UITextField!
    @IBOutlet weak var textFieldSoil: UITextField!
    @IBOutlet weak var textFieldLiveLoad: UITextField!
    
    
    
    
    
    @IBOutlet weak var textFieldSoilBearingCapacity: UITextField!
    @IBOutlet weak var textFieldLiveLoadOnFloor: UITextField!
    @IBOutlet weak var textFieldTotalLoadOnFooting: UITextField!
    
    
    
    @IBOutlet weak var textFieldCalcSOGWidthIn: UITextField!
    @IBOutlet weak var textFieldCalcSOGCodeWidthIn: UITextField!
    @IBOutlet weak var textFieldCalcSOGCodeHeightIn: UITextField!
    
    @IBOutlet weak var buttonCalculate: UIButton!
    
    var pickerSoil: UIPickerView!
    var pickerLiveLoad: UIPickerView!
    var pickerNumberOfFloors: UIPickerView!
    
    var totalLoadOnFooting: Float = 0
    
    
    let pickerDataSoil = ["Class 1: Crystalline bedrock",
                          "Class 2: Sedimentary and foliated rock",
                          "Class 3: Sandy gravel and/or gravel GW and GP",
                          "Class 4: Sandy, silty sand, clayey sand, silty gravel and clayey silt CL, ML,  MH, CH",
                          "Class 5: Clay, sandy clay, silty clay, clayey silt, silt and sandy silt CL, ML, MH and CH"]
    
    
    let pickerDataLiveLoad = ["Commercial (Office)",
                              "Residential"]
    
    
    let pickerDataNumberOfFloors = ["0", "1" , "2", "3"]
    
    
    
    public var calculatorTag = 0
    
    


    var numberTranslateTextfield = 50
    var numberTranslatePicker = 150
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
      
        setupPickers()
        
        
    }
    
    func setupPickers(){
        
        pickerSoil = UIPickerView()
        pickerSoil.delegate = self
        pickerSoil.dataSource = self
        
        let toolBarSoil = UIToolbar()
        toolBarSoil.barStyle = UIBarStyle.default
        toolBarSoil.isTranslucent = true
        //        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBarSoil.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePickerSoil))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelEditing))
        
        toolBarSoil.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBarSoil.isUserInteractionEnabled = true
    
        textFieldSoil.inputView = pickerSoil
        textFieldSoil.inputAccessoryView = toolBarSoil
        
        
        ////////
        
        
        
        pickerLiveLoad = UIPickerView()
        pickerLiveLoad.delegate = self
        pickerLiveLoad.dataSource = self
        
        let toolBarLiveLoad = UIToolbar()
        toolBarLiveLoad.barStyle = UIBarStyle.default
        toolBarLiveLoad.isTranslucent = true
        toolBarLiveLoad.sizeToFit()
        
        let doneButtonSoil = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePickerLiveLoad))
        let spaceButtonSoil = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButtonSoil = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelEditing))
        
        toolBarLiveLoad.setItems([cancelButtonSoil, spaceButtonSoil, doneButtonSoil], animated: false)
        toolBarLiveLoad.isUserInteractionEnabled = true
     
        textFieldLiveLoad.inputView = pickerLiveLoad
        textFieldLiveLoad.inputAccessoryView = toolBarLiveLoad
        
        ///////
        
        
        pickerNumberOfFloors = UIPickerView()
        pickerNumberOfFloors.delegate = self
        pickerNumberOfFloors.dataSource = self

        let toolBarFloors = UIToolbar()
        toolBarFloors.barStyle = UIBarStyle.default
        toolBarFloors.isTranslucent = true
        toolBarFloors.sizeToFit()
        
        let doneButtonFloors = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePickerFloors))
        let spaceButtonFloors = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButtonFloors = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelEditing))
        
        toolBarFloors.setItems([cancelButtonFloors, spaceButtonFloors, doneButtonFloors], animated: false)
        toolBarFloors.isUserInteractionEnabled = true
        
        textFieldNumberOfFloors.inputView = pickerNumberOfFloors
        textFieldNumberOfFloors.inputAccessoryView = toolBarFloors

        
        
        
    }
    override func viewDidLayoutSubviews() {
        
        self.constraintBottom.constant = 150;
        self.view.layoutIfNeeded()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
       
        
        if(textField === self.textFieldSoil ){
            
            pickerSoil.delegate?.pickerView!(pickerSoil, didSelectRow: 0, inComponent: 0)
            
        
        } else if (textField === self.textFieldLiveLoad ){
            
             pickerLiveLoad.delegate?.pickerView!(pickerLiveLoad, didSelectRow: 0, inComponent: 0)
            
        } else if (textField === self.textFieldNumberOfFloors){
            
             pickerNumberOfFloors.delegate?.pickerView!(pickerNumberOfFloors, didSelectRow: 0, inComponent: 0)
            
        }
        
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        
        let viewTemp = self.view.viewWithTag(textField.tag + 1)
        
        if(viewTemp == nil){
            
            cancelEditing()
            
        } else if (textField.tag <= 7){
            
            viewTemp?.becomeFirstResponder()
            scrollView.setContentOffset(CGPoint(x: 0, y: numberTranslateTextfield * textField.tag), animated: true)
            
        } else {
            
            cancelEditing()
            
        }
        
        _ = calculateTotalLoad()
        
        return true
    }
    
    
    func donePickerFloors(){
        
        textFieldSoil.becomeFirstResponder()
        let translationNumber = 8 * numberTranslateTextfield
        scrollView.setContentOffset(CGPoint(x: 0, y: translationNumber), animated: true)
        
    }
    
    func donePickerSoil(){
    
        textFieldLiveLoad.becomeFirstResponder()
        let translationNumber = 8 * numberTranslateTextfield
        scrollView.setContentOffset(CGPoint(x: 0, y: translationNumber), animated: true)
        
    }
    
    
    func donePickerLiveLoad(){
    
        cancelEditing()
//        let translationNumber = 9 * numberTranslateTextfield
//        scrollView.setContentOffset(CGPoint(x: 0, y: translationNumber), animated: true)
    }
    
    
    func cancelEditing(){
        
//        for textField in self.view.subviews where textField is UITextField {
//            textField.resignFirstResponder()
//        }
        
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil);
        
    }
    
   //MARK: - Delegates and data sources
    
   

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(pickerView == pickerSoil){
            
            return pickerDataSoil.count
            
        }else if(pickerView == pickerLiveLoad){
            
            return pickerDataLiveLoad.count
            
        } else {
            
            return pickerDataNumberOfFloors.count
        }
        
        
    }
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        if(pickerView == pickerSoil){
            
            return pickerDataSoil[row]
            
        } else if(pickerView == pickerLiveLoad){
            
            return pickerDataLiveLoad[row]
            
        } else {//if (pickerView == pickerNumberOfFloors){
            
           return pickerDataNumberOfFloors[row]
            
        }
        
    
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    
        
        if(pickerView === pickerSoil){
            
             textFieldSoil.text = pickerDataSoil[row]
            
            if(row == 0){
                
                textFieldSoilBearingCapacity.text = "12000"
                
            } else if(row == 1){
                
                textFieldSoilBearingCapacity.text = "4000"
                
            } else if(row == 2){
                
                textFieldSoilBearingCapacity.text = "3000"
                
            } else if(row == 3){
                
                textFieldSoilBearingCapacity.text = "2000"
                
            } else if(row == 4){
                
                textFieldSoilBearingCapacity.text = "1500"
                
            }

            
        } else if(pickerView === pickerLiveLoad){
            
            textFieldLiveLoad.text = pickerDataLiveLoad[row]
            
            if(row == 0){
                
                textFieldLiveLoadOnFloor.text = "50"
                
            } else if(row == 1){
                
                textFieldLiveLoadOnFloor.text = "40"
                
            }
            
            
        } else if(pickerView === pickerNumberOfFloors){
            
            textFieldNumberOfFloors.text = pickerDataNumberOfFloors[row]
            
            
        }

        
        _ = calculateTotalLoad()
        
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    // for best use with multitasking , dont use a constant here.
    //this is for demonstration purposes only.
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        let screenWidth = screenSize.width
        
        return screenWidth
    }
    
    
    func checkIfLoadValuesAreSet() -> Bool{
    
        let deadloadOfWall = Float(textFieldDLWallPerSF.text!)
        let deadLoadOfFloor = Float(textFieldDLFloorPerSF.text!)
        
        
        let deadLoadOfRoof = Float(textFieldDLRoofPerSF.text!)
        let liveLoadOfRoof = Float(textFieldLLRoofPerSF.text!)
        
        
        let tribHeightOfEachWall = Float(textFieldHeightEachWallFT.text!)
        let tribDepthOfFloor = Float(textFieldDepthOfFloorFT.text!)
        
        
        let tribDepthOfRoof = Float(textFieldDepthOfRoofFT.text!)
        

        let liveLoadOnFloor = Float(textFieldLiveLoadOnFloor.text!)
        
            
        if( (deadloadOfWall != nil) &&
            (deadLoadOfFloor != nil) &&
            (deadLoadOfRoof != nil)  &&
            (liveLoadOfRoof != nil) &&
            (tribHeightOfEachWall != nil)  &&
            (tribDepthOfFloor != nil) &&
            (tribDepthOfRoof != nil) &&
            (liveLoadOnFloor != nil)){
            
            return true
        }
        
        
        return false
    }
    
    func calculateTotalLoad() -> Bool{
    
        
        if(!checkIfLoadValuesAreSet()){
            
            print ("null values")
            return false
        }
        
        
        let deadloadOfWall: Float = Float(textFieldDLWallPerSF.text!)!
        let deadLoadOfFloor: Float = Float(textFieldDLFloorPerSF.text!)!
        
        
        let deadLoadOfRoof: Float = Float(textFieldDLRoofPerSF.text!)!
        let liveLoadOfRoof: Float = Float(textFieldLLRoofPerSF.text!)!
        
        
        let tribHeightOfEachWall: Float = Float(textFieldHeightEachWallFT.text!)!
        let tribDepthOfFloor: Float = Float(textFieldDepthOfFloorFT.text!)!
        
        
        let tribDepthOfRoof: Float = Float(textFieldDepthOfRoofFT.text!)!
        
  
        
        let numOfFloors: Float = Float(textFieldNumberOfFloors.text!)!

        let liveLoadOnFloor: Float = Float(textFieldLiveLoadOnFloor.text!)!
        
        

        
        
        totalLoadOnFooting =    Float((numOfFloors * deadloadOfWall * tribHeightOfEachWall) +
            (numOfFloors * tribDepthOfFloor * (deadLoadOfFloor + liveLoadOnFloor)) +
            (tribDepthOfRoof * (deadLoadOfRoof + liveLoadOfRoof)))
        
        
        textFieldTotalLoadOnFooting.text = String.localizedStringWithFormat("%.2f", totalLoadOnFooting)
       
     
        
        return true

    
    }
    
    
    @IBAction func calculateValues(){
        
        
        cancelEditing()
        
        if(!calculateTotalLoad()){
            
            print("null vals2")
            showAlert(titleStr: "Error", messageStr: "Please make sure all fields are filled and try again")
            return
        }

        
        let numOfFloors: Float = Float(textFieldNumberOfFloors.text!)!
        
        print(textFieldTotalLoadOnFooting.text ?? 0)
      
        let factorOfSafety: Float = Float(textFieldFactorOfSafety.text!)!
     
        let soilBearingCapacity: Float = Float(textFieldSoilBearingCapacity.text!)!
     
        
        let resultantWidthOfFooting = factorOfSafety * totalLoadOnFooting / soilBearingCapacity * 12
        
        var resultantHeightOfFooting: Float  = 0
        var resultantMinWidthOfFootingByCode: Float = 0
        
   
        
        if(numOfFloors == 0 || numOfFloors == 1){
            
   
            resultantHeightOfFooting = 6
            resultantMinWidthOfFootingByCode = 12
            
        } else if(numOfFloors == 2){
            
            resultantHeightOfFooting = 6
            resultantMinWidthOfFootingByCode = 15
            
        } else { //num of floors =
            
            resultantHeightOfFooting = 8
            resultantMinWidthOfFootingByCode = 18
            
        }
    
        
        textFieldCalcSOGWidthIn.text = String.localizedStringWithFormat("%.2f", resultantWidthOfFooting)
        textFieldCalcSOGCodeWidthIn.text = String.localizedStringWithFormat("%.2f", resultantMinWidthOfFootingByCode)
        textFieldCalcSOGCodeHeightIn.text = String.localizedStringWithFormat("%.2f", resultantHeightOfFooting)
        
    }
    
    func showAlert(titleStr:String,messageStr:String ) {
        
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}

