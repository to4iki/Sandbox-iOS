//
//  IntroductionPageViewController.swift
//  Introduction
//
//  Created by to4iki on 6/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class IntroductionPageViewController: UIPageViewController {

    private lazy var pageDataSource = IntroductionPageViewControllerDataSource(
        viewControllers: [UIColor.redColor(), UIColor.yellowColor(), UIColor.blueColor()].map {
            PageContentViewController.instantiate($0)
        }
    )

    private var beforeIndex: Int = 0

    private var currentIndex: Int? {
        guard let viewController = viewControllers?.first else {
            return nil
        }

        return pageDataSource.viewControllers.indexOf(viewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = pageDataSource
        delegate = self

        setViewControllers(
            [pageDataSource.viewControllers[beforeIndex]],
            direction: .Forward,
            animated: false,
            completion: nil
        )
    }
}

// MARK: - UIPageViewControllerDelegate

extension IntroductionPageViewController: UIPageViewControllerDelegate {

    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentIndex = currentIndex {
            beforeIndex = currentIndex
        }
    }
}
