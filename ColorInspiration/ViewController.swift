//
//  ViewController.swift
//  ColorInspiration
//
//  Created by Jeffery Reynolds on 3/21/19.
//  Copyright © 2019 Jeff Reynolds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var uiView: UIView!
    @IBOutlet weak var coloredBackground: UIView!
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var rgbInput: UITextField!
    @IBOutlet weak var hslInput: UITextField!
    @IBOutlet weak var hexInput: UITextField!
    
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var underlaySwitch: UISwitch!
    
    var color : Color = Color(r: 1, g: 1, b: 1, a: 1)
    
    @IBAction func switchValueChanged(_ sender: Any) {
        if underlaySwitch.isOn {
            uiView.backgroundColor = Color(r: 0, g: 0, b: 0, a: 1).color
        } else {
            uiView.backgroundColor = Color(r: 255, g: 255, b: 255, a: 1).color
        }
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        color.a = CGFloat(opacitySlider.value)
        setColors(background: coloredBackground, button: button, hslInput: hslInput, rgbInput: rgbInput, hexInput: hexInput, color: color)
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        randomColor()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        randomColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initApp()
    }
    
    func initApp() -> Void {
        // Randomize the chosen background color
        randomColor()
        opacitySlider.value = 1.0
        formatInputs(inputs: [
            self.hslInput,
            self.rgbInput,
            self.hexInput
            // TODO: Additional color representation inputs go here..
        ])
    }
    
    func randomColor() -> Void {
        color = Color(r: CGFloat.random(in: 0...1.0), g: CGFloat.random(in: 0...1.0), b: CGFloat.random(in: 0...1.0), a: color.a)
        setColors(background: coloredBackground, button: button, hslInput: hslInput, rgbInput: rgbInput, hexInput: hexInput, color: color)
    }
}

