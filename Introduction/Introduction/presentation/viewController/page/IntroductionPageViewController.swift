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

    private let contentViewControllers: [UIViewController] = [UIColor.greenColor(), UIColor.yellowColor(), UIColor.blueColor()].map {
        PageContentViewController.instantiate($0)
    }

    private var beforeIndex: Int = 0

    private var currentIndex: Int? {
        return viewControllers?.first.flatMap(contentViewControllers.indexOf)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        view.subviews
            .flatMap { $0 as? UIScrollView }
            .forEach { $0.delegate = self }

        if let initialViewController = contentViewControllers.first {
            scrollToViewController(initialViewController, animated: false)
        }

        pageDelegate?.introductionPageViewController(self, didUpdatePageCount: contentViewControllers.count)
    }

    private func nextViewController(viewController: UIViewController, isAfter: Bool) -> UIViewController? {
        guard var index = contentViewControllers.indexOf(viewController) else {
            return nil
        }

        if isAfter {
            index += 1
        } else {
            index -= 1
        }

        if index >= 0 && index < contentViewControllers.count {
            return contentViewControllers[index]
        }

        return nil
    }

    private func notifyTutorialDelegateOfNewIndex() {
        if let currentIndex = currentIndex {
            pageDelegate?.introductionPageViewController(self, didUpdatePageIndex: currentIndex)
            beforeIndex = currentIndex
        }
    }
}

// MARK: - Scroll

extension IntroductionPageViewController {

    func scrollToNextViewController() {
        if let
            visibleViewController = viewControllers?.first,
            nextViewController = pageViewController(self, viewControllerAfterViewController: visibleViewController)
        {
            scrollToViewController(nextViewController)
        }
    }

    func scrollToViewController(index newIndex: Int) {
        if let currentIndex = currentIndex {
            let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .Forward : .Reverse
            let nextViewController = contentViewControllers[newIndex]
            scrollToViewController(nextViewController, direction: direction)
        }
    }

    private func scrollToViewController(viewController: UIViewController, direction: UIPageViewControllerNavigationDirection = .Forward, animated: Bool = true) {
        setViewControllers(
            [viewController],
            direction: direction,
            animated: animated,
            completion: { _ in
                self.notifyTutorialDelegateOfNewIndex()
            }
        )
    }
}

// MARK: - UIPageViewControllerDataSource

extension IntroductionPageViewController: UIPageViewControllerDataSource {

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return nextViewController(viewController, isAfter: false)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return nextViewController(viewController, isAfter: true)
    }
}

// MARK: UIPageViewControllerDelegate

extension IntroductionPageViewController: UIPageViewControllerDelegate {

    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else {
            return
        }

        notifyTutorialDelegateOfNewIndex()
    }
}

// MARK: - UIScrollViewDelegate

extension IntroductionPageViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if beforeIndex == 0 && scrollView.contentOffset.x < scrollView.bounds.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.width, y: 0)
        } else if beforeIndex == contentViewControllers.count - 1 && scrollView.contentOffset.x > scrollView.bounds.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.width, y: 0)
        }
    }

    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if beforeIndex == 0 && scrollView.contentOffset.x <= scrollView.bounds.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.width, y: 0)
        } else if beforeIndex == contentViewControllers.count - 1 && scrollView.contentOffset.x >= scrollView.bounds.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.width, y: 0)
        }
    }
}
