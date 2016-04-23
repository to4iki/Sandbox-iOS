//
//  CollectionContainerViewPresenter.swift
//  Carousel
//
//  Created by to4iki on 4/20/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class CollectionContainerViewPresenter: NSObject {

    private let view: CollectionContainerView

    private var items: [Item] = [] {
        didSet {
            dataSource.setup(items.map(ItemReadDto.fromItem))
            view.collectionView.reloadData()
        }
    }

    private let dataSource = CollectionViewDataSource()

    init(view: CollectionContainerView) {
        self.view = view
    }
}

// MARK: - Presenter

extension CollectionContainerViewPresenter: Presenter {

    func viewDidLoad() {
        setup()
    }

    func viewWillAppear(animated: Bool) {
        items = ItemFactory.dummy()
    }
}

// MARK: - UI

extension CollectionContainerViewPresenter {

    func setup() {
        view.collectionView.dataSource = dataSource
        view.collectionView.delegate = self

        // Header
        view.collectionView.registerNib(
            CollectionHeaderReusableView.nib(),
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: CollectionHeaderReusableView.ReusableIdentifier
        )

        // Cell
        view.collectionView.registerNib(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.CellIdentifier)
    }
}

// MARK: - UICollectionViewDelegate

extension CollectionContainerViewPresenter: UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let item = dataSource.items[indexPath.row]
        print("tapd item: \(item.title)")
    }
}
