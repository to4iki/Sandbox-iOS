//
//  PageViewController.swift
//  Introduction
//
//  Created by to4iki on 6/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class PageViewController: UIPageViewController {

    private lazy var pageDataSource = PageViewControllerDataSource(
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

extension PageViewController: UIPageViewControllerDelegate {

    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentIndex = currentIndex {
            beforeIndex = currentIndex
        }
    }
}

// MARK: - Initializer

extension PageViewController {

    static func instantiate() -> PageViewController {
        let storyboard = UIStoryboard(name: "Page", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(String(PageViewController)) as! PageViewController
    }
}
