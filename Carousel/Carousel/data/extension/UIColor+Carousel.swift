//
//  UIColor+Carousel.swift
//  Carousel
//
//  Created by to4iki on 4/22/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

extension UIColor {

    static func hexColor(hex: Int, alpha: Float = 1.0) -> UIColor {
        let r = Float((hex >> 16) & 0xFF) / 255.0
        let g = Float((hex >> 8) & 0xFF) / 255.0
        let b = Float((hex) & 0xFF) / 255.0
        return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(alpha))
    }
}
