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
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var rgbInput: UITextField!
    @IBOutlet weak var hslInput: UITextField!
    @IBOutlet weak var hexInput: UITextField!
    
    @IBAction func sliderMoved(_ sender: Any) {
        print(sender)
        
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        setColors(
            uiView: self.uiView,
            button: self.button,
            hslInput: self.hslInput,
            rgbInput: self.rgbInput,
            hexInput: self.hexInput
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initApp()
    }
    
    func initApp() -> Void {
        setColors(
            uiView: self.uiView,
            button: self.button,
            hslInput: self.hslInput,
            rgbInput: self.rgbInput,
            hexInput: self.hexInput
        )
        formatInputs(inputs: [
            self.hslInput,
            self.rgbInput,
            self.hexInput
            // TODO: Additional color representation inputs go here...
        ])
    }
    
}

