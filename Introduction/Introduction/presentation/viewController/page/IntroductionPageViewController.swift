//
//  IntroductionPageViewController.swift
//  Introduction
//
//  Created by to4iki on 6/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

// MARK: - IntroductionPageViewControllerDelegate

protocol IntroductionPageViewControllerDelegate: class {

    func introductionPageViewController(introductionPageViewController: IntroductionPageViewController, didUpdatePageCount count: Int)

    func introductionPageViewController(introductionPageViewController: IntroductionPageViewController, didUpdatePageIndex index: Int)
}

// MARK: - IntroductionPageViewController

final class IntroductionPageViewController: UIPageViewController {

    weak var pageDelegate: IntroductionPageViewControllerDelegate?

    private lazy var pageDataSource = IntroductionPageViewControllerDataSource(
        viewControllers: [UIColor.greenColor(), UIColor.yellowColor(), UIColor.blueColor()].map {
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

        if let initialViewController = pageDataSource.viewControllers.first {
            scrollToViewController(initialViewController, animated: false)
        }

        pageDelegate?.introductionPageViewController(self, didUpdatePageCount: pageDataSource.viewControllers.count)
    }

    func scrollToNextViewController() {
        if let
            visibleViewController = viewControllers?.first,
            nextViewController = pageDataSource.pageViewController(self, viewControllerAfterViewController: visibleViewController)
        {
            scrollToViewController(nextViewController)
        }
    }

    func scrollToViewController(index newIndex: Int) {
        if let currentIndex = currentIndex {
            let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .Forward : .Reverse
            let nextViewController = pageDataSource.viewControllers[newIndex]
            scrollToViewController(nextViewController, direction: direction)
        }
    }

    private func scrollToViewController(viewController: UIViewController, direction: UIPageViewControllerNavigationDirection = .Forward, animated: Bool = true) {
        setViewControllers(
            [viewController],
            direction: direction,
            animated: animated,
            completion: { _ in self.notifyTutorialDelegateOfNewIndex() }
        )
    }

    private func notifyTutorialDelegateOfNewIndex() {
        if let currentIndex = currentIndex {
            pageDelegate?.introductionPageViewController(self, didUpdatePageIndex: currentIndex)
        }
    }
}

// MARK: UIPageViewControllerDelegate

extension IntroductionPageViewController: UIPageViewControllerDelegate {

    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentIndex = currentIndex {
            beforeIndex = currentIndex
        }
        notifyTutorialDelegateOfNewIndex()
    }
}
