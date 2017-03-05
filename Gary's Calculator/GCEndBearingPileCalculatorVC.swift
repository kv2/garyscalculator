//
//  FirstViewController.swift
//  Gary's Calculator
//
//  Created by john doe on 1/19/17.
//  Copyright © 2017 john doe. All rights reserved.
//

import UIKit


class GCEndBearingPileCalculatorVC:UIViewController,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate{
    

    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //value holders
    
    
    @IBOutlet weak var textFieldBldgHeight: UITextField!
    @IBOutlet weak var textFieldBldgLength: UITextField!
    @IBOutlet weak var textFieldTotalBldgSF: UITextField!
    @IBOutlet weak var textFieldDeadload: UITextField!
    
    
    @IBOutlet weak var textFieldWindspeed: UITextField!
    @IBOutlet weak var textFieldCompressiveStrengthConcrete: UITextField!
    @IBOutlet weak var textFieldfactorOfSafetyMoment: UITextField!
    @IBOutlet weak var textFieldFactorOfSafetyConcreteCompressiveStrength: UITextField!
    @IBOutlet weak var textFieldPileSection: UITextField!
    @IBOutlet weak var labelPileSectionDimension: UILabel!
    @IBOutlet weak var textFieldPileSectionDimension: UITextField!
    @IBOutlet weak var textFieldSoil: UITextField!
    @IBOutlet weak var textFieldLiveLoad: UITextField!
    
    
    @IBOutlet weak var textFieldWindPressure: UITextField!
    @IBOutlet weak var textFieldWindForce: UITextField!
    @IBOutlet weak var textFieldOverturningMoment: UITextField!
    
    @IBOutlet weak var textFieldBldgRestorativeMoment: UITextField!
    @IBOutlet weak var textFieldRestorativeMomentExceededBy: UITextField!
    
    
    @IBOutlet weak var textFieldSoilBearingCapacity: UITextField!
    @IBOutlet weak var textFieldSoilLateralBearingCapacity: UITextField!
    @IBOutlet weak var textFieldLiveLoadOnFloors: UITextField!
    @IBOutlet weak var textFieldTotalLoadOfBuilding: UITextField!
    
    
    @IBOutlet weak var textFieldMinDepthOfPile: UITextField!
    @IBOutlet weak var textFieldNumberOfPilesNeeded: UITextField!
    
    @IBOutlet weak var buttonCalculate: UIButton!
    
    var pickerSoil: UIPickerView!
    var pickerLiveLoad: UIPickerView!
    var pickerPileSection: UIPickerView!
    
 
    
    
    let pickerDataSoil = ["Class 1: Crystalline bedrock",
                          "Class 2: Sedimentary and foliated rock",
                          "Class 3: Sandy gravel and/or gravel GW and GP",
                          "Class 4: Sandy, silty sand, clayey sand, silty gravel and clayey silt CL, ML,  MH, CH",
                          "Class 5: Clay, sandy clay, silty clay, clayey silt, silt and sandy silt CL, ML, MH and CH"]
    
    
    let pickerDataLiveLoad = ["Commercial (Office)",
                              "Residential", "Assembly (Movable Seats)"]
    
    
    let pickerDataPileSection = ["Round","Square"]
    
    
    var pileSectionWord: String = "radius"
    var totalLoadOnBuilding: Float = 0.0
    var momentExceededBy: Float = 0.0
    
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
        

        
        /////
        
        
        pickerPileSection = UIPickerView()
        pickerPileSection.delegate = self
        pickerPileSection.dataSource = self
        
        let toolBarSection = UIToolbar()
        toolBarSection.barStyle = UIBarStyle.default
        toolBarSection.isTranslucent = true
        toolBarSection.sizeToFit()
        
        let doneButtonSection = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePickerPileSection))
        let spaceButtonSection = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButtonSection = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelEditing))
        
        toolBarSection.setItems([cancelButtonSection, spaceButtonSection, doneButtonSection], animated: false)
        toolBarSection.isUserInteractionEnabled = true
        
        textFieldPileSection.inputView = pickerPileSection
        textFieldPileSection.inputAccessoryView = toolBarSection
        
        
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
            
        } else if (textField === self.textFieldPileSection){
            
             pickerPileSection.delegate?.pickerView!(pickerPileSection, didSelectRow: 0, inComponent: 0)
            
        }
        
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        
        let viewTemp = self.view.viewWithTag(textField.tag + 1)
        
        if(viewTemp == nil){
            
            cancelEditing()
            
        } else if (textField.tag <= 11){
            
            viewTemp?.becomeFirstResponder()
            scrollView.setContentOffset(CGPoint(x: 0, y: numberTranslateTextfield * textField.tag), animated: true)
            
        } else {
            
            cancelEditing()
            
        }
        
        _ = calculateDeducedValues()
        
        return true
    }
    
    
    func donePickerPileSection(){
        
        
        textFieldPileSectionDimension.becomeFirstResponder()
        
        let translationNumber = 7 * numberTranslateTextfield
        scrollView.setContentOffset(CGPoint(x: 0, y: translationNumber), animated: true)
        
        
    }
    
    

    func donePickerSoil(){
        
        textFieldLiveLoad.becomeFirstResponder()
        let translationNumber = 10 * numberTranslateTextfield
        scrollView.setContentOffset(CGPoint(x: 0, y: translationNumber), animated: true)
        
    }
    

    
    func donePickerLiveLoad(){
    
        cancelEditing()
        let translationNumber = 11 * numberTranslateTextfield
        scrollView.setContentOffset(CGPoint(x: 0, y: translationNumber), animated: true)
        
        
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
            
            return pickerDataPileSection.count
        }
        
        
    }
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        if(pickerView == pickerSoil){
            
            return pickerDataSoil[row]
            
        } else if(pickerView == pickerLiveLoad){
            
            return pickerDataLiveLoad[row]
            
        } else {//if (pickerView == pickerNumberOfFloors){
            
           return pickerDataPileSection[row]
            
        }
        
    
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    
        
        if(pickerView === pickerSoil){
            
             textFieldSoil.text = pickerDataSoil[row]
            
            if(row == 0){
                
                textFieldSoilBearingCapacity.text = "12000"
                textFieldSoilLateralBearingCapacity.text = "1200"
                
            } else if(row == 1){
                
                textFieldSoilBearingCapacity.text = "4000"
                textFieldSoilLateralBearingCapacity.text = "400"
                
            } else if(row == 2){
                
                textFieldSoilBearingCapacity.text = "3000"
                textFieldSoilLateralBearingCapacity.text = "200"
                
            } else if(row == 3){
                
                textFieldSoilBearingCapacity.text = "2000"
                textFieldSoilLateralBearingCapacity.text = "150"
                
            } else if(row == 4){
                
                textFieldSoilBearingCapacity.text = "1500"
                textFieldSoilLateralBearingCapacity.text = "100"
                
            }

            
        } else if(pickerView === pickerLiveLoad){
            
            textFieldLiveLoad.text = pickerDataLiveLoad[row]
            
            if(row == 0){
                
                textFieldLiveLoadOnFloors.text = "50"
                
            } else if(row == 1){
                
                textFieldLiveLoadOnFloors.text = "40"
                
            } else if(row == 2){
                
                textFieldLiveLoadOnFloors.text = "100"
                
            }
            
            
        } else if(pickerView === pickerPileSection){
            
            
            textFieldPileSection.text = pickerDataPileSection[row]
            
            
            pileSectionWord = "radius"
            
            if(row == 0){
                
                pileSectionWord = "radius"
                
            } else {
                
                pileSectionWord = "width"
            }
            
            
            labelPileSectionDimension.text = String(format: "Pile %@%", pileSectionWord)
        }

        
        _ = calculateDeducedValues()
        
        
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
    
        
        let bldgHeight = Float(textFieldBldgHeight.text!)
        let bldgLength = Float(textFieldBldgLength.text!)
        let bldgSquareFootage = Float(textFieldTotalBldgSF.text!)
        let bldgDeadLoad = Float(textFieldDeadload.text!)
        
        let windSpeed = Float(textFieldWindspeed.text!)
        let compressiveStrengthConcrete = Float(textFieldCompressiveStrengthConcrete.text!)
        let factorOfSafetyMoment = Float(textFieldfactorOfSafetyMoment.text!)
        let factorOfSafetyConcrete = Float(textFieldFactorOfSafetyConcreteCompressiveStrength.text!)
        let pileSection = textFieldPileSection.text!
        let pileDimension = Float(textFieldPileSectionDimension.text!)
        
        let soilBearingCapacity = Float(textFieldSoilBearingCapacity.text!)
        let soilLatealBearingCapacity = Float(textFieldSoilLateralBearingCapacity.text!)
        let liveloadDeduced = Float(textFieldLiveLoadOnFloors.text!)
        
        
        
        if(     (bldgHeight != nil) &&
                (bldgLength != nil) &&
                (bldgSquareFootage != nil) &&
                (bldgDeadLoad != nil) &&
                
                (windSpeed != nil) &&
                (compressiveStrengthConcrete != nil) &&
                (factorOfSafetyMoment != nil) &&
                (factorOfSafetyConcrete != nil) &&
                //(pileSection == "") &&
                (pileDimension != nil) &&
                
                (soilBearingCapacity != nil) &&
                (soilLatealBearingCapacity != nil) &&
                (liveloadDeduced != nil)
          )
        
        {
                
                return true
        }

        
        return false
    }
    
    func calculateDeducedValues() -> Bool{
    
        
        if(!checkIfLoadValuesAreSet()){
            
            print ("null values")
            return false
        }
        


//        
        let bldgHeight = Float(textFieldBldgHeight.text!)!
        let bldgLength = Float(textFieldBldgLength.text!)!
        let bldgSquareFootage = Float(textFieldTotalBldgSF.text!)!
        let bldgDeadLoad = Float(textFieldDeadload.text!)!
        
        let windSpeed = Float(textFieldWindspeed.text!)!
        //let compressiveStrengthConcrete = Float(textFieldCompressiveStrengthConcrete.text!)!
        let factorOfSafetyMoment = Float(textFieldfactorOfSafetyMoment.text!)!
        //let factorOfSafetyConcrete = Float(textFieldFactorOfSafetyConcreteCompressiveStrength.text!)!
        //let pileSection = textFieldPileSection.text!
        //let pileDimension = Float(textFieldPileSectionDimension.text!)!
        
        //let soilBearingCapacity = Float(textFieldSoilBearingCapacity.text!)!
        let liveloadDeduced = Float(textFieldLiveLoadOnFloors.text!)!
        
        
    
        
        totalLoadOnBuilding = bldgSquareFootage * (liveloadDeduced + bldgDeadLoad)
        textFieldTotalLoadOfBuilding.text = String.localizedStringWithFormat("%.0f", totalLoadOnBuilding)
        
        let windPressure = 0.00256*windSpeed*windSpeed
        textFieldWindPressure.text = String.localizedStringWithFormat("%.2f", windPressure)
        
        let windForceOnBuilding = windPressure * bldgHeight * bldgLength * 0.5
        textFieldWindForce.text = String.localizedStringWithFormat("%.0f", windForceOnBuilding)
        
        let momentOverturning = 1.0/3.0 * bldgHeight * windForceOnBuilding
        textFieldOverturningMoment.text = String.localizedStringWithFormat("%.0f", momentOverturning)
        
        let momentRestorativeInnate = bldgLength/2.0 * totalLoadOnBuilding
        textFieldBldgRestorativeMoment.text = String.localizedStringWithFormat("%.0f", momentRestorativeInnate)

        momentExceededBy = momentOverturning * factorOfSafetyMoment  - momentRestorativeInnate
        
   
        
        
        if(momentExceededBy > 0){
            
            textFieldRestorativeMomentExceededBy.text = String.localizedStringWithFormat("%.0f", momentExceededBy)
            
        } else {
            
            textFieldRestorativeMomentExceededBy.text = "0"
            
        }
        
        
        
  
        
        return true

    
    }
    
    
    @IBAction func calculateValues(){
        
        
        cancelEditing()
        
        if(!calculateDeducedValues()){
            
            print("null vals2")
            showAlert(titleStr: "Error", messageStr: "Please make sure all fields are filled and try again")
            return
        }
        
        
        
//        let bldgHeight = Float(textFieldBldgHeight.text!)!
//        let bldgLength = Float(textFieldBldgLength.text!)!
//        let bldgSquareFootage = Float(textFieldTotalBldgSF.text!)!
//        let bldgDeadLoad = Float(textFieldDeadload.text!)!
        
//        let windSpeed = Float(textFieldWindspeed.text!)!
        let compressiveStrengthConcrete = Float(textFieldCompressiveStrengthConcrete.text!)!
//        let factorOfSafetyMoment = Float(textFieldDeadload.text!)!
        let factorOfSafetyConcrete = Float(textFieldFactorOfSafetyConcreteCompressiveStrength.text!)!
        let pileSection = textFieldPileSection.text!
        let pileDimension = Float(textFieldPileSectionDimension.text!)!
        
        let soilBearingCapacity = Float(textFieldSoilBearingCapacity.text!)!
        let soilLateralBearingCapacity = Float(textFieldSoilLateralBearingCapacity.text!)!
//        let liveloadDeduced = Float(textFieldLiveLoadOnFloors.text!)!
        
        
     
       
        
        var deducedPileAreaSF: Float = 0
        
        var deducedPileCrossSectionalWidthInches: Float = 0
        
        if(pileSection == "Round"){
            
            deducedPileAreaSF = Float.pi*pileDimension*pileDimension/144.0
            deducedPileCrossSectionalWidthInches = pileDimension * 2.0
            
        } else {
            
            deducedPileAreaSF = pileDimension*pileDimension/144.0
            deducedPileCrossSectionalWidthInches = pileDimension
        }
    
        
        var governingStrengthSoilOrConcrete = soilBearingCapacity
        let concreteCompressiveStrengthPSFAdjusted = compressiveStrengthConcrete*144 / factorOfSafetyConcrete
        
        
        if (soilBearingCapacity>concreteCompressiveStrengthPSFAdjusted){
            
            governingStrengthSoilOrConcrete = concreteCompressiveStrengthPSFAdjusted
            
        }
        
        let numberOfPilesRequired: Float = totalLoadOnBuilding / (deducedPileAreaSF * governingStrengthSoilOrConcrete)
        textFieldNumberOfPilesNeeded.text = String.localizedStringWithFormat("%d", Int(ceil(numberOfPilesRequired)))
        
        
        
        
        if(momentExceededBy > 0){
        
            let depthOfPilesRequired = sqrt(2*Float.abs(momentExceededBy)/(soilLateralBearingCapacity * (deducedPileCrossSectionalWidthInches / 12.0) * numberOfPilesRequired))
            textFieldMinDepthOfPile.text = String.localizedStringWithFormat("%.2f", depthOfPilesRequired)
            
            
        } else {
            
            textFieldMinDepthOfPile.text = "None"
        }

     
        
        
    }
    
    func showAlert(titleStr:String,messageStr:String ) {
        
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}

