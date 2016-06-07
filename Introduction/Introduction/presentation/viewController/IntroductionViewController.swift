//
//  IntroductionViewController.swift
//  Introduction
//
//  Created by to4iki on 2016/06/07.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class IntroductionViewController: UIViewController {

    private var pageViewController: IntroductionPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

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