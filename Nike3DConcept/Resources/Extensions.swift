//
//  Extensions.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/8/23.
//

import Foundation
import UIKit

extension UIView {
    public func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -1 * paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    var safeAreaHeight: CGFloat {
           if #available(iOS 11, *) {
            return safeAreaLayoutGuide.layoutFrame.size.height
           }
           return bounds.height
      }
}

extension UILabel {
    
   public func withCustomAttributes(text: String, spacing: CGFloat, fontName: String, fontSize: CGFloat, color: UIColor) -> UILabel {
       let l = UILabel()
       let string = NSMutableAttributedString(string: text)
       let range = NSRange(location: 0, length: string.length)
       string.addAttribute(NSAttributedString.Key.kern, value: spacing, range: range)
       string.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
       string.addAttribute(NSAttributedString.Key.font, value: UIFont(name: fontName, size: fontSize), range: range)
       l.attributedText = string
       return l
    }
}

extension UIButton {
    public func withCustomAttributes(text: String, spacing: CGFloat, fontName: String, fontSize: CGFloat, color: UIColor) -> UIButton {
        let b = UIButton()
        let string = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: string.length)
        string.addAttribute(NSAttributedString.Key.kern, value: spacing, range: range)
        string.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        string.addAttribute(NSAttributedString.Key.font, value: UIFont(name: fontName, size: fontSize), range: range)
        b.setAttributedTitle(string, for: .normal)
        return b
    }
}

extension UIColor {
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func appBackgroundGray() -> UIColor {
        return UIColor.rgb(red: 237, green: 241, blue: 244)
    }
    
    static func appCellGray() -> UIColor {
        return UIColor.rgb(red: 24, green: 28, blue: 31)
    }
    
    static func appTextDarkGray() -> UIColor {
        return UIColor.rgb(red: 98, green: 109, blue: 119)
    }
    
    static func appTextLightGray() -> UIColor {
        return UIColor.rgb(red: 148, green: 159, blue: 164)
    }
    
    static func appBlack() -> UIColor {
        return UIColor.rgb(red: 24, green: 28, blue: 31)
    }
    
    static func appOrange() -> UIColor {
        return UIColor(hex: "#CF8004") ?? UIColor.systemPink
    }
}


