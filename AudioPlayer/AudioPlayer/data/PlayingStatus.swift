//
//  PlayingStatus.swift
//  AudioPlayer
//
//  Created by to4iki on 4/27/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation

enum PlayingStatus {
    case Playing, Paused

    init(rate: Float) {
        self = rate == 0.0 ? .Paused : .Playing
    }
}
