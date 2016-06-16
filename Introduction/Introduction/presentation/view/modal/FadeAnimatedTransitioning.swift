//
//  FadeAnimatedTransitioning.swift
//  Introduction
//
//  Created by to4iki on 6/17/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

enum FadeSpeed: NSTimeInterval {
    case Fast = 0.2
    case Normal = 0.5
    case Slow = 1.0
}

/// presented: callee(to) ViewController
/// presenting: caller(from) ViewController
final class FadeAnimatedTransitioning: NSObject {

    private let isPresent: Bool

    private let fadeSpeed: FadeSpeed

    init(isPresent: Bool, fadeSpeed: FadeSpeed = .Normal) {
        self.isPresent = isPresent
        self.fadeSpeed = fadeSpeed
    }
}

// MARK: - UIViewControllerAnimatedTransitioning

extension FadeAnimatedTransitioning: UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return fadeSpeed.rawValue
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            animatePresentTransition(transitionContext)
        } else {
            animateDissmissalTransition(transitionContext)
        }
    }

    private func animatePresentTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let
            containerView = transitionContext.containerView(),
            presentedController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
            else { return }

        presentedController.view.alpha = 0.0
        containerView.addSubview(presentedController.view)

        let animations: () -> Void = { presentedController.view.alpha = 1.0 }

        UIView.animateWithDuration(transitionDuration(transitionContext), animations: animations) { _ in
            transitionContext.completeTransition(true)
        }
    }

    private func animateDissmissalTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let presentingController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) else {
            return
        }

        let animations: () -> Void = { presentingController.view.alpha = 0.0 }

        UIView.animateWithDuration(transitionDuration(transitionContext), animations: animations) { _ in
            transitionContext.completeTransition(true)
        }
    }
}