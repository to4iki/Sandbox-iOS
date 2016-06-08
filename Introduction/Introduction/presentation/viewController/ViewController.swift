//
//  ViewController.swift
//  Introduction
//
//  Created by to4iki on 5/28/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private let introductionViewController = IntroductionViewController.instantiate()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        showIntroductionViewController()
    }

    private func showIntroductionViewController() {
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
}

// MARK: - PresentationControllerDataSource

extension ViewController: PresentationControllerDataSource {

    func sizeForPresentedContainerView(presentedViewController presented: UIViewController) -> CGSize {
        return CGSize(width: view.frame.width * 0.8, height: view.frame.height * 0.8)
    }

    func frameOfPresentedViewInContainerView(presentedViewController presented: UIViewController, containerView: UIView) -> CGRect {
        let size = sizeForPresentedContainerView(presentedViewController: presented)
        let point = CGPoint(x: containerView.bounds.width * 0.1, y: containerView.bounds.height * 0.1)

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
