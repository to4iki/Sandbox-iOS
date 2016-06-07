//
//  PresentationController.swift
//  Introduction
//
//  Created by to4iki on 6/6/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

/// presented: callee ViewController
/// presenting: caller ViewController
final class PresentationController: UIPresentationController {

    private lazy var overlay: UIView = {
        guard let containerView = self.containerView else {
            fatalError("failure container view nil.")
        }
        return UIView(frame: containerView.bounds)
    }()

    private lazy var gestureRecognizers: [UITapGestureRecognizer] = [
        UITapGestureRecognizer(target: self, action: .overlayDidTouch)
    ]

    override func presentationTransitionWillBegin() {
        overlay.gestureRecognizers = gestureRecognizers
        overlay.backgroundColor = UIColor.blackColor()
        changeOverlayViewTransparency(presented: false)
        containerView?.insertSubview(overlay, atIndex: 0)

        presentedViewController.transitionCoordinator()?.animateAlongsideTransition(
            { [unowned self] _ in self.changeOverlayViewTransparency(presented: true) },
            completion: nil
        )
    }

    override func presentationTransitionDidEnd(completed: Bool) {

    }

    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator()?.animateAlongsideTransition(
            { [unowned self] _ in self.changeOverlayViewTransparency(presented: false) },
            completion: nil
        )
    }

    override func dismissalTransitionDidEnd(completed: Bool) {
        if completed {
            overlay.removeFromSuperview()
        }
    }

    override func containerViewWillLayoutSubviews() {
        overlay.frame = containerView!.bounds
        presentedView()?.frame = frameOfPresentedViewInContainerView()
    }

    override func containerViewDidLayoutSubviews() {

    }
}

extension PresentationController {

    /// child = presented container view
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width * 0.8, height: parentSize.height * 0.8)
    }

    /// presented ViewController frame
    override func frameOfPresentedViewInContainerView() -> CGRect {
        guard let containerBounds = containerView?.bounds else {
            return CGRect.zero
        }

        let size = sizeForChildContentContainer(presentedViewController, withParentContainerSize: containerBounds.size)
        let point = CGPoint(x: containerBounds.width * 0.1, y: containerBounds.height * 0.1)

        return CGRect(origin: point, size: size)
    }
}

extension PresentationController {

    func overlayDidTouch(sender: AnyObject) {
        print("on touch overlay.")
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }

    private func changeOverlayViewTransparency(presented presented: Bool) {
        overlay.alpha = presented ? 0.5 : 0.0
    }
}

// MARK: - Selector

private extension Selector {

    static let overlayDidTouch = #selector(PresentationController.overlayDidTouch(_:))
}
