//
//  Color.swift
//  ColorInspiration
//
//  Created by Jeffery Reynolds on 3/21/19.
//  Copyright © 2019 Jeff Reynolds. All rights reserved.
//

import Foundation
import UIKit

extension String: Error {}

struct Color {
    var color: UIColor {
        get {
            return UIColor.init(red: r, green: g, blue: b, alpha: a)
        }
    }
    
    var r: CGFloat
    var g: CGFloat
    var b: CGFloat
    var a: CGFloat
    
    var hsla: String {
        get {
            return HSL.getHSLFromRGB(r: r, g: g, b: b, a: a)
        }
    }
    
    var rgba: String {
        get {
            return "rgb(\(Int((r * 255).rounded())), \(Int((g * 255).rounded())), \(Int((b * 255).rounded())), \(String(format: "%.2f", ceil(a * 100) / 100)))"
        }
    }
    
    var hex: String {
        get {
            return "#\(String(Int((r * 255).rounded()), radix: 16))\(String(Int((g * 255).rounded()), radix: 16))\(String(Int((b * 255).rounded()), radix: 16))"
        }
    }
    
    init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
}

class HSL {
    static func minOf(colorValues: [CGFloat]) -> CGFloat { return colorValues.min()! }
    
    static func maxOf(colorValues: [CGFloat]) -> CGFloat { return colorValues.max()! }
    
    static func calcHue(r: CGFloat, g: CGFloat, b: CGFloat) throws -> CGFloat {
        let values: [CGFloat] = [r, g, b]
        
        if (maxOf(colorValues: values) == minOf(colorValues: values)) { return 0.0 }
        
        switch (maxOf(colorValues: values)) {
            
            // If red is the max value, the formula is (G-B)/(max-min) * 60 degrees
            case r:
                let calc: CGFloat = (g - b) / (maxOf(colorValues: values) - minOf(colorValues: values))
                return calc < 0 ? (calc + 360) : (calc * 60)
            
            // If green is the max value, the formula is 2.0 + (B-R)/(max-min) * 60 degrees
            case g:
                let calc: CGFloat = 2.0 + (b - r) / (maxOf(colorValues: values) - minOf(colorValues: values))
                return calc < 0 ? (calc + 360) : (calc * 60)
            
            // If blue is the max value, the formula is 4.0 + (R-G)/(max-min) * 60 degrees
            case b:
                let calc: CGFloat = 4.0 + (r - g) / (maxOf(colorValues: values) - minOf(colorValues: values))
                return calc < 0 ? (calc + 360) : (calc * 60)
            
            default: throw "Unexpected value for max rgb color value"
        }
    }
    
    static func calcSaturation(r: CGFloat, g: CGFloat, b: CGFloat) -> CGFloat {
        let values: [CGFloat] = [r, g, b]
        
        if (minOf(colorValues: values) == maxOf(colorValues: values)) {
            
            return 0.0
            
        } else {
            
            let luminance: CGFloat = calcLuminance(r: r, g: g, b: b)
            
            if (luminance < 0.5) {
                
                return  ((maxOf(colorValues: values) - minOf(colorValues: values)) /
                        (maxOf(colorValues: values) + minOf(colorValues: values)))
            } else {
                
                return  ((maxOf(colorValues: values) - minOf(colorValues: values)) /
                        (2.0 - maxOf(colorValues: values) - minOf(colorValues: values)))
            }
        }
    }
    
    static func calcLuminance(r: CGFloat, g: CGFloat, b: CGFloat) -> CGFloat {
        let values: [CGFloat] = [r, g, b]
        return ((minOf(colorValues: values) + maxOf(colorValues: values)) / 2)
    }
    
    static func getHSLFromRGB(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> String {
        
        let s: CGFloat = calcSaturation(r: r, g: g, b: b) * 100
    
        var h: CGFloat
        if (s >= CGFloat(0)) {
            
            do {
                h = try calcHue(r: r, g: g, b: b)
            } catch {
                print(error)
                return "Was not able to convert to HSL"
            }
            
        } else {
            h = CGFloat(0)
        }
        
        var l: CGFloat
        if (s >= CGFloat(0)) {
            l = calcLuminance(r: r, g: g, b: b) * 100
        } else {
            l = CGFloat(0)
        }
        
        return "hsla(\(Int(h.rounded()))°, \(Int(s.rounded()))%, \(Int(l.rounded()))%, \(String(format: "%.2f", ceil(a * 100) / 100)))" // round the float to two decimal places before truncating the string
    }
    
    init(r: CGFloat, g: CGFloat, b: CGFloat) {
        
    }
}

