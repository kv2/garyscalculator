//
//  FirstViewController.swift
//  Gary's Calculator
//
//  Created by john doe on 1/19/17.
//  Copyright © 2017 john doe. All rights reserved.
//

import UIKit


class CalculatorVC:UIViewController,UITextFieldDelegate{
    

    @IBOutlet weak var constraintBottom: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
   
    public var calculatorTag = 0
    
    
    var calculatorNumber = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
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
            
        } else {
            
            viewTemp?.becomeFirstResponder()
            scrollView.setContentOffset(CGPoint(x: 0, y: 48 * textField.tag), animated: true)
        }
        
        return true
    }
}

