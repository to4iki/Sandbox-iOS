//
//  CollectionViewCell.swift
//  Carousel
//
//  Created by to4iki on 4/13/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    private static let NibName = "CollectionViewCell"

    static let CellIdentifier = "CollectionViewCell"

    @IBOutlet private weak var label: UILabel!
}

extension CollectionViewCell {

    static func nib() -> UINib {
        return UINib(nibName: NibName, bundle: nil)
    }

    func setup(item: ItemReadDto) {
        label.text = item.title
        backgroundColor = item.color
    }
}
