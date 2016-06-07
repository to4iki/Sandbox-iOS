//
//  IntroductionPageViewControllerDataSource.swift
//  Introduction
//
//  Created by to4iki on 6/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class IntroductionPageViewControllerDataSource: NSObject {

    let viewControllers: [UIViewController]

    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
    }

    private func nextViewController(viewController: UIViewController, isAfter: Bool) -> UIViewController? {
        guard var index = viewControllers.indexOf(viewController) else {
            return nil
        }

        if isAfter {
            index += 1
        } else {
            index -= 1
        }

        if index >= 0 && index < viewControllers.count {
            return viewControllers[index]
        }

        return nil
    }
}

// MARK: - UIPageViewControllerDataSource

extension IntroductionPageViewControllerDataSource: UIPageViewControllerDataSource {

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return nextViewController(viewController, isAfter: false)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return nextViewController(viewController, isAfter: true)
    }
}
