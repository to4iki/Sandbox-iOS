//
//  PageContentViewController.swift
//  Introduction
//
//  Created by to4iki on 6/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

/// Sample
final class PageContentViewController: UIViewController {

    var backgroundColor: UIColor = UIColor.whiteColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
    }
}

// MARK: - Initializer

extension PageContentViewController {

    static func instantiate(color: UIColor) -> PageContentViewController {
        let viewController = PageContentViewController()
        viewController.backgroundColor = color
        return viewController
    }
}
