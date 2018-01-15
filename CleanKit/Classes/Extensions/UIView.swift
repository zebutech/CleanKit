//
//  UIView.swift
//  CleanKit
//
//  Created by Ludovic Riviere on 13/01/2018.
//  Copyright © 2018 ZEBUTECH. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func round() {
        layer.cornerRadius = bounds.width / CGFloat(2)
        layer.masksToBounds = true
    }
    
    public func roundCorners(radius: CGFloat = CGFloat(0)) {
        guard radius >= CGFloat(0) else { return }
        layer.masksToBounds = true
        
        if radius == CGFloat(0) {
            layer.cornerRadius = min(bounds.width, bounds.height) / CGFloat(2)
        } else {
            layer.cornerRadius = radius
        }
    }
    
    /**
     Apply drop shadow to the view using layer.
     
     - parameter cornerRadius: corner radius of the view
     - parameter height: height of drop shadow
     - parameter edge: boolean flag indicates the need to extend bounds to outside using `height` value
     - parameter opacity: shadow opacity
     */
    public func dropShadow(cornerRadius: CGFloat = 0, height: CGFloat = 2, edge: Bool = false, opacity: Float = 0.2) {
        layer.shadowRadius = CGFloat(5)
        layer.shadowOffset = CGSize(width: 0, height: height)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        
        if edge {
            layer.shadowPath = UIBezierPath(roundedRect: bounds.insetBy(dx: -height, dy: -height), cornerRadius: cornerRadius).cgPath
        } else {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        }
    }
    
    public func border(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    public func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        defer { UIGraphicsEndImageContext() }
        
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public func screenshot(of rect: CGRect? = nil) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let wholeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // if no `rect` provided, return image of whole view
        
        guard let image = wholeImage, let rect = rect else { return wholeImage }
        
        // otherwise, grab specified `rect` of image
        
        let scale = image.scale
        let scaledRect = CGRect(x: rect.origin.x * scale, y: rect.origin.y * scale, width: rect.size.width * scale, height: rect.size.height * scale)
        guard let cgImage = image.cgImage?.cropping(to: scaledRect) else { return nil }
        return UIImage(cgImage: cgImage, scale: scale, orientation: .up)
    }
}
