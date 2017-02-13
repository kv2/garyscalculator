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
    
    @IBOutlet weak var textFieldSoil: UITextField!
    @IBOutlet weak var textFieldLiveLoad: UITextField!
    
    var pickerSoil: UIPickerView!
    
    var pickerLiveLoad: UIPickerView!
    
    let pickerDataSoil = ["Class 1: Crystalline bedrock","Class 2: Sedimentary and foliated rock",
                          "Class 2: Sedimentary and foliated rock",
                          "Class 3: Sandy gravel and/or gravel GW and GP",
                          "Class 4: Sandy, silty sand, clayey sand, silty gravel and clayey silt CL, ML,  MH, CH",
                          "Class 5: Clay, sandy clay, silty clay, clayey silt, silt and sandy silt CL, ML, MH and CH"]
    
    
    let pickerDataLiveLoad = ["Commercial (Office)",
                              "Residential"]
    
    
    public var calculatorTag = 0
    
    
    var calculatorNumber = 0

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
      
        setupPickers()
        
        
    }
    
    func setupPickers(){
        
        pickerSoil = UIPickerView()
        pickerSoil.delegate = self
        pickerSoil.dataSource = self
        
        pickerLiveLoad = UIPickerView()
        pickerLiveLoad.delegate = self
        pickerLiveLoad.dataSource = self
        
    
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
//        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()

        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: Selector(cancelEditing())
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: "donePicker")
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        textFieldSoil.inputView = pickerSoil
        textFieldLiveLoad.inputView = pickerLiveLoad
        
        textFieldSoil.inputAccessoryView = toolBar
        textFieldLiveLoad.inputAccessoryView = toolBar

        
    }
    override func viewDidLayoutSubviews() {
        
        self.constraintBottom.constant = 50;
        self.view.layoutIfNeeded()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        
        let viewTemp = self.view.viewWithTag(textField.tag + 1)
        
        if(viewTemp == nil){
            
            textField.resignFirstResponder()
            
        } else if ((viewTemp?.tag)! < 13){
            
            viewTemp?.becomeFirstResponder()
            print("yes");
            scrollView.setContentOffset(CGPoint(x: 0, y: 48 * textField.tag), animated: true)
            
        } else {
            
            
            scrollView.setContentOffset(CGPoint(x: 0, y: 48 * textField.tag), animated: true)
            
        }
        
        return true
    }
    
    
    func donePicker(){
        
        
        
    }
    
    func cancelEditing(){
        
        
        
    }
    
   //MARK: - Delegates and data sources
    
   

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(pickerView == pickerSoil){
            
            return pickerDataSoil.count
            
        }
        
        return pickerDataLiveLoad.count
    }
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        if(pickerView == pickerSoil){
            
            return pickerDataSoil[row]
            
        }
        
        return pickerDataLiveLoad[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
 
        
        if(row == 0){
            
      
            
        } else if(row == 1){
            
           
            
        } else if(row == 2){
            
            
            
        } else if(row == 3){
            
            
            
        } else if(row == 4){
            
            
            
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
    
}

