import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    private let collectionViewDataSource = CollectionViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = self
        collectionView.registerNib(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.CellIdentifier)
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("index: \(indexPath.row)")
    }
}
