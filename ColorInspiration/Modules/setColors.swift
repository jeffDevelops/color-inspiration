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
    background: UIView,
    button: UIButton,
    hslInput: UITextField,
    rgbInput: UITextField,
    hexInput: UITextField,
    color: Color
) -> Void {
    // Set the chosen color as the background color of view elements
    background.backgroundColor = color.color
    
    // Adjust the opacity to 1 for the button color
    let buttonColor = Color(r: color.r, g: color.g, b: color.b, a: 1.0);
    button.setTitleColor(buttonColor.color, for: .normal)
    // Set the input color values
    hslInput.text = color.hsla
    rgbInput.text = color.rgba
    hexInput.text = color.hex
}
