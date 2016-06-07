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
    }

    func onTapCloseButton() {
        print("on tap closebutton.")
        dismissViewControllerAnimated(true, completion: nil)
    }

    func onTapNextButton() {
        print("on tap nextbutton.")
    }
}
