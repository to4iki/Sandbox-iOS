//
//  PlayerFactory.swift
//  AudioPlayer
//
//  Created by to4iki on 4/24/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation
import AVFoundation

struct PlayerFactory {

    static func apply() -> AVPlayer {
        let item = PlayerItemFactory.apply()
        return AVPlayer(playerItem: item)
    }
}

// MARK: - PlayerItemFactory

struct PlayerItemFactory {

    private static var resourceURL: NSURL {
        let urlString = "http://www.htmq.com/html5/sample/sample.mp4"
        guard let url = NSURL(string: urlString) else {
            fatalError("failure url.")
        }

        return url
    }

    static func apply() -> AVPlayerItem {
        return AVPlayerItem(URL: resourceURL)
    }
}
