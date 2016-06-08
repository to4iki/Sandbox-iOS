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
        contents: [UIColor.greenColor(), UIColor.yellowColor(), UIColor.blueColor()].map(PageContentViewController.instantiate)
    )

    private var beforeIndex: Int = 0

    private var currentIndex: Int? {
        return viewControllers?.first.flatMap(pageDataSource.contents.indexOf)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = pageDataSource
        delegate = self

        if let initialViewController = pageDataSource.contents.first {
            scrollToViewController(initialViewController, animated: false)
        }

        configureSwipeView()
        pageDelegate?.introductionPageViewController(self, didUpdatePageCount: pageDataSource.contents.count)
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
            let nextViewController = pageDataSource.contents[newIndex]
            scrollToViewController(nextViewController, direction: direction)
        }
    }

    private func configureSwipeView() {
        view.subviews
            .flatMap { $0 as? UIScrollView }
            .forEach { $0.delegate = self }
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
            beforeIndex = currentIndex
        }
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
        } else if beforeIndex == pageDataSource.contents.count - 1 && scrollView.contentOffset.x > scrollView.bounds.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.width, y: 0)
        }
    }

    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if beforeIndex == 0 && scrollView.contentOffset.x <= scrollView.bounds.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.width, y: 0)
        } else if beforeIndex == pageDataSource.contents.count - 1 && scrollView.contentOffset.x >= scrollView.bounds.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.width, y: 0)
        }
    }
}
