//
//  IntroductionViewController.swift
//  Introduction
//
//  Created by to4iki on 6/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class IntroductionViewController: UIViewController {

    @IBOutlet private weak var pageControlView: IntroductionPageControlView!

    private var pageViewController: IntroductionPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        pageViewController?.pageDelegate = self
        pageControlView.delegate = self
    }
}

// MARK: - Initializer

extension IntroductionViewController {

    static func instantiate() -> IntroductionViewController {
        let storyboard = UIStoryboard(name: "Introduction", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(IntroductionViewController)) as! IntroductionViewController
    }
}

// MARK: - Segue

extension IntroductionViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let pageViewController = segue.destinationViewController as? IntroductionPageViewController
            where segue.identifier == "IntroductionPageViewControllerSegue" else { fatalError() }

        self.pageViewController = pageViewController
    }
}

// MARK: - IntroductionPageControlViewDelegate

extension IntroductionViewController: IntroductionPageControlViewDelegate {

    func onChangePageControlValue() {
        print("on change pagecontrol value.")
        pageViewController?.scrollToViewController(index: pageControlView.pageControl.currentPage)
    }

    func onTapCloseButton() {
        print("on tap closebutton.")
        dismissViewControllerAnimated(true, completion: nil)
    }

    func onTapNextButton() {
        print("on tap nextbutton.")
        pageViewController?.scrollToNextViewController()
    }
}

// MARK: - IntroductionPageViewControllerDelegate

extension IntroductionViewController: IntroductionPageViewControllerDelegate {

    func introductionPageViewController(introductionPageViewController: IntroductionPageViewController, didUpdatePageCount count: Int) {
        pageControlView.pageControl.numberOfPages = count
    }

    func introductionPageViewController(introductionPageViewController: IntroductionPageViewController, didUpdatePageIndex index: Int) {
        pageControlView.pageControl.currentPage = index
    }
}
