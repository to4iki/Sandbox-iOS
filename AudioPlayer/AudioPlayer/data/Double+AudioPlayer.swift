//
//  Double+AudioPlayer.swift
//  AudioPlayer
//
//  Created by to4iki on 4/25/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation

extension Double {

    func formatString() -> String {
        let s = Int(self % 60)
        let m = Int((self - Double(s)) / 60 % 60)
        let h = Int((self - Double(m) - Double(s)) / 3600 % 3600)
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
}
