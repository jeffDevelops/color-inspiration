//
//  formatInputs.swift
//  ColorInspiration
//
//  Created by Jeffery Reynolds on 3/23/19.
//  Copyright © 2019 Jeff Reynolds. All rights reserved.
//

import Foundation
import UIKit

func formatInputs(inputs: [UITextField]) -> Void {
    for input in inputs {
        // Horrible API for this, but okay: https://developer.apple.com/documentation/uikit/uitextfield/1619597-leftview
        // Essentially indents the text of all inputs that are referenced in the inputs array above
        input.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: input.frame.height))
        input.leftViewMode = UITextField.ViewMode.always
    }
}
