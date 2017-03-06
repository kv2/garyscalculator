//
//  GCEulaVC.swift
//  Gary's Calculator
//
//  Created by john doe on 3/5/17.
//  Copyright © 2017 john doe. All rights reserved.
//

import Foundation

import UIKit


class GCEulaVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated:true);
        self.tabBarController?.tabBar.isHidden = true
        print("yes")
    }
    
    
     @IBAction func agreeButtonDidTouchup(){
        
  
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "EULAAGREED")
     
        self.navigationItem.setHidesBackButton(false, animated:true);
        self.tabBarController?.tabBar.isHidden = false
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
