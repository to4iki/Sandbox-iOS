//
//  CollectionViewDataSource.swift
//  Carousel
//
//  Created by to4iki on 4/13/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class CollectionViewDataSource: NSObject {

    private(set) var items: [ItemReadDto] = []
}

extension CollectionViewDataSource {

    func setup(items: [ItemReadDto]) {
        self.items = items
    }
}

// MARK: - UICollectionViewDataSource

extension CollectionViewDataSource: UICollectionViewDataSource {

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewCell.CellIdentifier, forIndexPath: indexPath)

        guard let collectionViewCell = cell as? CollectionViewCell else {
            return cell
        }

        collectionViewCell.setup(items[indexPath.row])

        return collectionViewCell
    }

    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        guard kind == UICollectionElementKindSectionHeader else {
            fatalError("can't create header.")
        }

        let header = collectionView.dequeueReusableSupplementaryViewOfKind(
            UICollectionElementKindSectionHeader,
            withReuseIdentifier: CollectionHeaderReusableView.ReusableIdentifier,
            forIndexPath: indexPath
        )

        guard let collectionHeaderReusableView = header as? CollectionHeaderReusableView else {
            fatalError("can't create header.")
        }

        collectionHeaderReusableView.setup("sample carousel")

        return collectionHeaderReusableView
    }
}
