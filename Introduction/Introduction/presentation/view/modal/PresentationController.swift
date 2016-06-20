//
//  PresentationController.swift
//  Introduction
//
//  Created by to4iki on 6/6/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

// MARK: - PresentationControllerDataSource

protocol PresentationControllerDataSource: class {

    func sizeForPresentedContainerView(presentationViewController presentation: PresentationController) -> CGSize

    func frameOfPresentedViewInContainerView(presentationViewController presentation: PresentationController, containerView: UIView) -> CGRect
}

// MARK: - PresentationControllerDelegate

@objc
protocol PresentationControllerDelegate: class {

    optional func onTouchPresentationOverlayView(presentationViewController presentation: PresentationController)
}

// MARK: - PresentationSize

enum PresentationSize {
    case Small
    case Big

    var rateFromPresenting: CGFloat {
        switch self {
        case .Small:
            return PresentationSizeRateFromPresenting.Low.rawValue
        case .Big:
            return PresentationSizeRateFromPresenting.High.rawValue
        }
    }

    var size: CGSize {
        let screenSize = UIScreen.mainScreen().bounds.size
        let rate = rateFromPresenting
        return CGSize(width: screenSize.width * rate, height: screenSize.height * rate)
    }
}

// MARK: - PresentationSizeRateFromPresenting

private enum PresentationSizeRateFromPresenting: CGFloat {
    case Low = 0.25
    case High = 0.85
}

// MARK: - PresentationController

/// presented: callee ViewController
/// presenting: caller ViewController
final class PresentationController: UIPresentationController {

    weak var dataSource: PresentationControllerDataSource?

    weak var presentationDelegate: PresentationControllerDelegate?

    private(set) var presentationType: PresentationType = .Any

    private lazy var overlay: UIView = {
        guard let containerView = self.containerView else {
            fatalError("failure container view nil.")
        }
        return UIView(frame: containerView.bounds)
    }()

    private lazy var gestureRecognizers: [UITapGestureRecognizer] = [
        UITapGestureRecognizer(target: self, action: .overlayDidTouch)
    ]

    convenience init(presentedViewController: UIViewController, presentingViewController: UIViewController, presentationType: PresentationType) {
        self.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        self.presentationType = presentationType
    }

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
        return dataSource?.sizeForPresentedContainerView(presentationViewController: self) ?? CGSize.zero
    }

    /// presented ViewController frame
    override func frameOfPresentedViewInContainerView() -> CGRect {
        guard let containerView = containerView, dataSource = dataSource else {
            return CGRect.zero
        }

        return dataSource.frameOfPresentedViewInContainerView(presentationViewController: self, containerView: containerView)
    }
}

extension PresentationController {

    func overlayDidTouch(sender: AnyObject) {
        presentationDelegate?.onTouchPresentationOverlayView?(presentationViewController: self)
    }

    private func changeOverlayViewTransparency(presented presented: Bool) {
        overlay.alpha = presented ? 0.5 : 0.0
    }
}

// MARK: - Selector

private extension Selector {

    static let overlayDidTouch = #selector(PresentationController.overlayDidTouch(_:))
}
