//
//  AVPlayerView.swift
//  AudioPlayer
//
//  Created by to4iki on 4/24/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit
import AVFoundation

final class AVPlayerView: UIView {

    weak var delegate: AVPlayerViewDelegate?

    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }

    private var playerStatus: AVPlayerStatus {
        return player?.status ?? .Unknown
    }

    private var playingStatus: PlayingStatus {
        return PlayingStatus(rate: player?.rate ?? 0.0)
    }

    private var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override class func layerClass() -> AnyClass {
        return AVPlayerLayer.self
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

// MARK: - Initializer

extension AVPlayerView {

    func setVideoFillMode(mode: String) {
        playerLayer.videoGravity = mode
    }

    private func commonInit() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: .onTap))

        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: .onPlayerItemDidReachEnd,
            name: AVPlayerItemDidPlayToEndTimeNotification,
            object: nil
        )
    }
}

// MARK: - NSNotificationHandler, UITapGestureRecognizer

extension AVPlayerView {

    func onTap() {
        delegate?.tapPlayerView(player, playerStatus: playerStatus, playingStatus: playingStatus)
    }

    func onPlayerItemDidReachEnd() {
        delegate?.playerItemDidReachEnd(player?.currentItem)
    }
}

// MARK: - Selector

private extension Selector {

    static let onTap = #selector(AVPlayerView.onTap)

    static let onPlayerItemDidReachEnd = #selector(AVPlayerView.onPlayerItemDidReachEnd)
}
