//
//  CollectionViewFlowLayout.swift
//  Carousel
//
//  Created by to4iki on 4/21/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class CollectionViewFlowLayout: UICollectionViewFlowLayout {

    private let collectionItemSize = CGSize(width: 300, height: 300)

    private let itemSpacing: CGFloat = 10.0

    private let flickVelocityThreshold: CGFloat = 0.3

    private var pageWidth: CGFloat {
        return itemSize.width + itemSpacing
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        setup()
    }

    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else {
            return super.targetContentOffsetForProposedContentOffset(proposedContentOffset, withScrollingVelocity: velocity)
        }

        let xCurrentPagePoint = collectionView.contentOffset.x / pageWidth

        if fabs(velocity.x) > flickVelocityThreshold {
            let xNextPagePoint = velocity.x > 0.0 ? ceil(xCurrentPagePoint) : floor(xCurrentPagePoint)
            return CGPoint(x: xNextPagePoint * pageWidth, y: proposedContentOffset.y)
        } else {
            return CGPoint(x: round(xCurrentPagePoint) * pageWidth, y: proposedContentOffset.y)
        }
    }
}

extension CollectionViewFlowLayout {

    private func setup() {
        scrollDirection = .Horizontal
        itemSize = collectionItemSize
        minimumLineSpacing = itemSpacing

        let horizontalInset = (UIScreen.mainScreen().bounds.width - itemSize.width) / 2
        let verticallInset = CGFloat(0.0)

        sectionInset = UIEdgeInsets(
            top:  verticallInset,
            left: horizontalInset,
            bottom: verticallInset,
            right: horizontalInset
        )
    }
}
