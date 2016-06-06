//
//  ViewController.swift
//  Introduction
//
//  Created by to4iki on 5/28/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private let pageViewController = PageViewController.instantiate()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        showPageViewController()
    }

    private func showPageViewController() {
        pageViewController.modalPresentationStyle = .Custom
        pageViewController.transitioningDelegate = self
        presentViewController(pageViewController, animated: true) {
            print("complete present")
        }
    }
}

// MARK: - Action

extension ViewController {

    @IBAction func onModalButton(sender: UIButton) {
        showPageViewController()
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension ViewController: UIViewControllerTransitioningDelegate {

    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}
