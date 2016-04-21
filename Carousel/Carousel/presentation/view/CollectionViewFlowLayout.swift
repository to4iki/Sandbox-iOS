//
//  CollectionViewFlowLayout.swift
//  Carousel
//
//  Created by to4iki on 4/21/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class CollectionViewFlowLayout: UICollectionViewFlowLayout {

    private let size = CGSize(width: 300, height: 300)

    private let spaceing: CGFloat = 10.0

    override func awakeFromNib() {
        super.awakeFromNib()

        setup()
    }

    private func setup() {
        scrollDirection = .Horizontal
        itemSize = size
        minimumLineSpacing = spaceing
        sectionInset.left = spaceing
        sectionInset.right = spaceing
    }
}
