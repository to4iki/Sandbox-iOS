//
//  IntroductionViewController.swift
//  Introduction
//
//  Created by to4iki on 6/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class IntroductionViewController: UIViewController {

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


// MARK: - Action

extension IntroductionViewController {

    @IBAction func onCloseButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
