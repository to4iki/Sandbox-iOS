import UIKit


final class CollectionViewCell: UICollectionViewCell {

    private static let NibName = "CollectionViewCell"

    static let CellIdentifier = "CollectionViewCell"
}

extension CollectionViewCell {

    static func nib() -> UINib {
        return UINib(nibName: NibName, bundle: nil)
    }
}
