//
//  ViewController.swift
//  Introduction
//
//  Created by to4iki on 5/28/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

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
        let controller = PresentationController(
            presentedViewController: presented,
            presentingViewController: presenting,
            presentationType: .Introduction
        )
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

    func sizeForPresentedContainerView(presentationViewController presentation: PresentationController) -> CGSize {
        switch presentation.presentationType {
        case .Introduction:
            return PresentationSize.Big.size
        default:
            return CGSize.zero
        }
    }

    func frameOfPresentedViewInContainerView(presentationViewController presentation: PresentationController, containerView: UIView) -> CGRect {
        switch presentation.presentationType {
        case .Introduction:
            let size = sizeForPresentedContainerView(presentationViewController: presentation)
            let rate = (1.0 - PresentationSize.Big.rateFromPresenting) / 2.0
            let point = CGPoint(x: containerView.bounds.width * rate, y: containerView.bounds.height * rate)
            return CGRect(origin: point, size: size)
        default:
            return CGRect.zero
        }
    }
}

// MARK: - PresentationControllerDelegate

extension ViewController: PresentationControllerDelegate {

    func onTouchPresentationOverlayView(presentationViewController presentation: PresentationController) {
        print("on touch overlay.")
        presentation.presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
