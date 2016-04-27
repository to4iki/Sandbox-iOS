//
//  PlayerPlayingStatus.swift
//  AudioPlayer
//
//  Created by to4iki on 4/27/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation

enum PlayerPlayingStatus {
    case Playing, Pause

    init(rate: Float) {
        self = rate == 0.0 ? .Pause : .Playing
    }
}
