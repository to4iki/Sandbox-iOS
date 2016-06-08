//
//  IntroductionPageViewControllerDataSource.swift
//  Introduction
//
//  Created by to4iki on 6/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class IntroductionPageViewControllerDataSource: NSObject {

    let contents: [UIViewController]

    init(contents: [UIViewController]) {
        self.contents = contents
    }

    private func nextViewController(viewController: UIViewController, isAfter: Bool) -> UIViewController? {
        guard var index = contents.indexOf(viewController) else {
            return nil
        }

        if isAfter {
            index += 1
        } else {
            index -= 1
        }

        if index >= 0 && index < contents.count {
            return contents[index]
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
