//
//  setColors.swift
//  ColorInspiration
//
//  Created by Jeffery Reynolds on 3/23/19.
//  Copyright © 2019 Jeff Reynolds. All rights reserved.
//

import Foundation
import UIKit

func setColors(
    uiView: UIView,
    button: UIButton,
    hslInput: UITextField,
    rgbInput: UITextField,
    hexInput: UITextField
) -> Color {
    
    // Randomize the chosen background color
    let primaryColor = Color(r: CGFloat.random(in: 0...1.0), g: CGFloat.random(in: 0...1.0), b: CGFloat.random(in: 0...1.0), a: 1)
    
    // Set the chosen color as the background color of view elements
    uiView.backgroundColor = primaryColor.color
    button.setTitleColor(primaryColor.color, for: .normal)
    // Set the input color values
    hslInput.text = primaryColor.hsl
    rgbInput.text = primaryColor.rgb
    hexInput.text = primaryColor.hex
    
    return primaryColor
}
