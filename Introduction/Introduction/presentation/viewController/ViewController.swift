//
//  ViewController.swift
//  Introduction
//
//  Created by to4iki on 5/28/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private var presentedSizeRateFromPresenting: CGFloat {
        return 0.85
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        showIntroductionViewController()
    }

    private func showIntroductionViewController() {
        let introductionViewController = IntroductionViewController.instantiate()
        introductionViewController.modalPresentationStyle = .Custom
        introductionViewController.transitioningDelegate = self
        presentViewController(introductionViewController, animated: true) {
            print("complete present")
        }
    }
}

// MARK: - Action

extension ViewController {

    @IBAction func onModalButton(sender: UIButton) {
        showIntroductionViewController()
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension ViewController: UIViewControllerTransitioningDelegate {

    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let controller = PresentationController(presentedViewController: presented, presentingViewController: presenting)
        controller.dataSource = self
        controller.presentationDelegate = self
        return controller
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeAnimatedTransitioning(isPresent: true, fadeSpeed: .Slow)
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeAnimatedTransitioning(isPresent: false, fadeSpeed: .Slow)
    }
}

// MARK: - PresentationControllerDataSource

extension ViewController: PresentationControllerDataSource {

    func sizeForPresentedContainerView(presentedViewController presented: UIViewController) -> CGSize {
        let screenSize = UIScreen.mainScreen().bounds.size
        return CGSize(width: screenSize.width * presentedSizeRateFromPresenting, height: screenSize.height * presentedSizeRateFromPresenting)
    }

    func frameOfPresentedViewInContainerView(presentedViewController presented: UIViewController, containerView: UIView) -> CGRect {
        let size = sizeForPresentedContainerView(presentedViewController: presented)
        let rate = (1.0 - presentedSizeRateFromPresenting) / 2.0
        let point = CGPoint(x: containerView.bounds.width * rate, y: containerView.bounds.height * rate)

        return CGRect(origin: point, size: size)
    }
}

// MARK: - PresentationControllerDelegate

extension ViewController: PresentationControllerDelegate {

    func onTouchPresentationOverlayView(presentedViewController presented: UIViewController) {
        print("on touch overlay.")
        presented.dismissViewControllerAnimated(true, completion: nil)
    }
}
