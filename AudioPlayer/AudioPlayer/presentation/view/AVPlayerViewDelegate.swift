//
//  AVPlayerViewDelegate.swift
//  AudioPlayer
//
//  Created by to4iki on 4/24/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation
import AVFoundation

protocol AVPlayerViewDelegate: class {

    func tapPlayerView(player: AVPlayer?, playerStatus: AVPlayerStatus, playingStatus: PlayingStatus)

    func playerItemDidReachEnd(item: AVPlayerItem?)
}
