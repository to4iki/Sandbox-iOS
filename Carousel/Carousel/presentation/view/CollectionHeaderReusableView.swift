//
//  CollectionHeaderReusableView.swift
//  Carousel
//
//  Created by to4iki on 4/16/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class CollectionHeaderReusableView: UICollectionReusableView {

    private static let NibName = "CollectionHeaderReusableView"

    static let ReusableIdentifier = "CollectionHeaderReusableView"

    @IBOutlet private weak var titleLabel: UILabel!
}

extension CollectionHeaderReusableView {

    static func nib() -> UINib {
        return UINib(nibName: NibName, bundle: nil)
    }

    func setup(title: String) {
        titleLabel.text = title
    }
}