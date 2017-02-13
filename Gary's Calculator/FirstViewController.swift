//
//  FirstViewController.swift
//  Gary's Calculator
//
//  Created by john doe on 1/19/17.
//  Copyright © 2017 john doe. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonCalc: UIButton!
    
    let pickerData = ["Slab on Grade","Linear Spread Footing","Column Pad Footing","End Bearing Deep Foundation","Side Friction Deep Foundation"]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.image = UIImage(named: "imgSog")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        buttonCalc .setTitle("Calculate SOG", for: .normal)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        

        
        return pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        buttonCalc.tag = row;
        
        if(row == 0){
            
            imageView.image = UIImage(named:"imgSog")
            buttonCalc .setTitle("Calculate SOG", for: .normal)
            
        } else if(row == 1){
            
            imageView.image = UIImage(named:"imgSpread")
            buttonCalc .setTitle("Calculate Spread Footing", for: .normal)
            
        } else if(row == 2){
            
            imageView.image = UIImage(named:"imgCol")
            buttonCalc .setTitle("Calculate Column Footings", for: .normal)
            
        } else if(row == 3){
            
            imageView.image = UIImage(named:"imgEndBearing")
            buttonCalc .setTitle("Calculate End Bearing", for: .normal)
            
        } else if(row == 4){
            
            imageView.image = UIImage(named:"imgSideFriction")
            buttonCalc .setTitle("Calculate Side Friction", for: .normal)
        
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
    

    @IBAction func calculateButtonPressed(sender: UIButton!) {
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CalculatorVC") as! CalculatorVC
        controller.calculatorNumber = sender.tag
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//       
//        if(row == 1){
//            
//            imageView.image = UIImage(named:"imgSog")
//            
//        } else if(row == 2){
//            
//            imageView.image = UIImage(named:"imgSpread")
//            
//        } else if(row == 3){
//            
//            imageView.image = UIImage(named:"imgCol")
//            
//        } else if(row == 4){
//            
//            imageView.image = UIImage(named:"imgEndBearing")
//            
//        } else if(row == 5){
//            
//            imageView.image = UIImage(named:"imgSideFriction")
//            
//        }
//        
//        let screenSize: CGRect = UIScreen.main.bounds
//        
//        let screenWidth = screenSize.width
//        
//        let rect = CGRect(x: 0, y:0,width: screenWidth, height:50)
//        let view = UIView(frame: rect)
//        return view
//    }

    
    
    
    
    

}

