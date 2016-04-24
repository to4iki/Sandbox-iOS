//
//  ViewController.swift
//  AudioPlayer
//
//  Created by to4iki on 4/23/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {

    @IBOutlet private weak var playerView: AVPlayerView!
}

// MARK: - LifeCycle

extension ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - UI

extension ViewController {

    private func setup() {
        registerGestureRecognizer()

        playerView.player = PlayerFactory.apply()
        playerView.setVideoFillMode(AVLayerVideoGravityResizeAspect)
        playerView.delegate = self
    }
}

// MARK: - GestureRecognizer

extension ViewController {

    private func registerGestureRecognizer() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .onTapView))
    }

    func onTapView(gesture: UITapGestureRecognizer) {
        playerView.player?.pause()
    }
}

// MARK: - AVPlayerViewDelegate

extension ViewController: AVPlayerViewDelegate {

    func tapPlayerView(player: AVPlayer?, status: AVPlayerStatus) {
        guard status == .ReadyToPlay else {
            print("failure ready to play.")
            return
        }

        player?.play()
    }

    func playerItemDidReachEnd(item: AVPlayerItem?) {
        print("player play finish.")
        item?.seekToTime(kCMTimeZero)
    }
}

// MARK: - Selector

private extension Selector {

    static let onTapView = #selector(ViewController.onTapView(_:))
}
