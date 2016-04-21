//
//  CollectionContainerView.swift
//  Carousel
//
//  Created by to4iki on 4/20/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class CollectionContainerView: UIView {

    private static let NibName = "CollectionContainerView"

    @IBOutlet private(set) weak var label: UILabel!

    @IBOutlet private weak var labelLeftMarginConstraint: NSLayoutConstraint!

    @IBOutlet private(set) weak var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

extension CollectionContainerView {

    private func commonInit() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = CollectionContainerView.nib(bundle)
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
        addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false

        let bindings = ["view": view]
        addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|[view]|",
                options:NSLayoutFormatOptions(rawValue: 0),
                metrics:nil,
                views: bindings
            )
        )

        addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|[view]|",
                options:NSLayoutFormatOptions(rawValue: 0),
                metrics:nil,
                views: bindings
            )
        )

        if let collectionViewFlowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            labelLeftMarginConstraint.constant = collectionViewFlowLayout.sectionInset.left
        }
    }
}

extension CollectionContainerView {

    static func nib(bundle: NSBundle? = nil) -> UINib {
        return UINib(nibName: NibName, bundle: bundle)
    }
}
