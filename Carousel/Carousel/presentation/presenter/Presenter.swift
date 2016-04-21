//
//  Presenter.swift
//  Carousel
//
//  Created by to4iki on 4/20/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation

protocol Presenter: class {

    func viewDidLoad()

    func viewWillAppear(animated: Bool)

    func viewDidAppear(animated: Bool)

    func viewWillDisappear(animated: Bool)

    func viewDidDisappear(animated: Bool)
}

// MARK: - ViewController LifeCycle Compliance

extension Presenter {

    func viewDidLoad() { }

    func viewWillAppear(animated: Bool) { }

    func viewDidAppear(animated: Bool) { }

    func viewWillDisappear(animated: Bool) { }

    func viewDidDisappear(animated: Bool) { }
}
