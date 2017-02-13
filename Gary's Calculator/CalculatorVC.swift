//
//  FirstViewController.swift
//  Gary's Calculator
//
//  Created by john doe on 1/19/17.
//  Copyright © 2017 john doe. All rights reserved.
//

import UIKit


class CalculatorVC:UIViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate{
    

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
    @IBOutlet weak var textFieldSoil: UITextField!
    @IBOutlet weak var textFieldLiveLoad: UITextField!
    
    
    
    
    @IBOutlet weak var textFieldNumberOfFloors: UITextField!
    @IBOutlet weak var textFieldSoilBearingCapacity: UITextField!
    @IBOutlet weak var textFieldLiveLoadOnFloor: UITextField!
    @IBOutlet weak var textFieldTotalLoadOnFloor: UITextField!
    
    
    
    @IBOutlet weak var textFieldCalcSOGWidthIn: UITextField!
    @IBOutlet weak var textFieldCalcSOGCodeWidthIn: UITextField!
    @IBOutlet weak var textFieldCalcSOGCodeHeightIn: UITextField!
    
    @IBOutlet weak var buttonCalculate: UIButton!
    
    var pickerSoil: UIPickerView!
    var pickerLiveLoad: UIPickerView!
    var pickerNumberOfFloors: UIPickerView!
    
    let pickerDataSoil = ["Class 1: Crystalline bedrock",
                          "Class 2: Sedimentary and foliated rock",
                          "Class 3: Sandy gravel and/or gravel GW and GP",
                          "Class 4: Sandy, silty sand, clayey sand, silty gravel and clayey silt CL, ML,  MH, CH",
                          "Class 5: Clay, sandy clay, silty clay, clayey silt, silt and sandy silt CL, ML, MH and CH"]
    
    
    let pickerDataLiveLoad = ["Commercial (Office)",
                              "Residential"]
    
    
    let pickerDataNumberOfFloors = ["0", "1" , "2"]
    
    
    
    public var calculatorTag = 0
    
    
    var calculatorNumber = 0

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
        
        print("did select")
        
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
    
    
    
    
    
    
    @IBAction func calculateValues(){
        
        
    
        
        let deadloadOfWall: Int = Int(textFieldDLWallPerSF.text!)!
        let deadLoadOfFloor: Int = Int(textFieldDLFloorPerSF.text!)!
        let deadLoadOfRoof: Int = Int(textFieldDLRoofPerSF.text!)!
        let liveLoadOfRoof: Int = Int(textFieldLLRoofPerSF.text!)!
        
        let tribHeightOfEachWall: Int = Int(textFieldHeightEachWallFT.text!)!
        let tribDepthOfFloor: Int = Int(textFieldDepthOfFloorFT.text!)!
        let tribDepthOfRoof: Int = Int(textFieldDepthOfRoofFT.text!)!
        
        
        let factorOfSafety: Int = Int(textFieldFactorOfSafety.text!)!
        let numOfFloors: Int = Int(textFieldDLWallPerSF.text!)!
        let soilBearingCapacity: Int = Int(textFieldSoilBearingCapacity.text!)!
        let liveLoadOnFloor: Int = Int(textFieldLiveLoadOnFloor.text!)!
        
        
        /////
        
        
        let totalLoadOnFooting =    (numOfFloors * deadloadOfWall * tribHeightOfEachWall) +
                                    (numOfFloors * tribDepthOfFloor * (deadLoadOfFloor + liveLoadOnFloor)) +
                                    (tribDepthOfRoof * (deadLoadOfRoof + liveLoadOfRoof))
        
        

        let resultantWidthOfFooting = factorOfSafety * totalLoadOnFooting / soilBearingCapacity * 12
        
        var resultantHeightOfFooting  = 0
        
        var resultantMinWidthOfFootingByCode = 0
        
        
        if(numOfFloors == 0){
            
            resultantHeightOfFooting = 6
            resultantMinWidthOfFootingByCode = 12
            
        } else if(numOfFloors == 1){
            
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
    
}

