//
//  GCScrollView.swift
//  Gary's Calculator
//
//  Created by john doe on 2/12/17.
//  Copyright © 2017 john doe. All rights reserved.
//

import Foundation
import UIKit


class GCScrollView: UIScrollView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        super.touchesBegan(touches, with: event)
        
        
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil);
        
        
    }


}

