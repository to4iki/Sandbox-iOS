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
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}
