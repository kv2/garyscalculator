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
    
    let pickerData = ["Slab on Grade","Linear Spread Footing","Column Pad Footing","End Bearing Deep Foundation","Side Friction Deep Foundation"]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.image = UIImage(named: "imgSog")
        
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
        
        if(row == 0){
            
            imageView.image = UIImage(named:"imgSog")
            
        } else if(row == 1){
            
            imageView.image = UIImage(named:"imgSpread")
            
        } else if(row == 2){
            
            imageView.image = UIImage(named:"imgCol")
            
        } else if(row == 3){
            
            imageView.image = UIImage(named:"imgEndBearing")
            
        } else if(row == 4){
            
            imageView.image = UIImage(named:"imgSideFriction")
            
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

