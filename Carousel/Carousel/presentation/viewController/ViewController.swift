//
//  ViewController.swift
//  Carousel
//
//  Created by to4iki on 4/12/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var collectionContainerView: CollectionContainerView!

    private lazy var collectionContainerViewPresenter: CollectionContainerViewPresenter =
        CollectionContainerViewPresenter(view: self.collectionContainerView)
}

// MARK: - LifeCycle

extension ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionContainerViewPresenter.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        collectionContainerViewPresenter.viewWillAppear(animated)
    }
}
