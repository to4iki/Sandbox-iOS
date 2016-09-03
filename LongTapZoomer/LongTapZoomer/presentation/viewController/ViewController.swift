import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    private let collectionViewDataSource = CollectionViewDataSource()

    lazy var setupRecognizer: (() -> Void)? = {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: .cellLongPressed)
        longPressRecognizer.allowableMovement = 100
        self.collectionView.addGestureRecognizer(longPressRecognizer)
        self.setupRecognizer = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRecognizer?()
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = self
        collectionView.registerNib(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.CellIdentifier)
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("taped index: \(indexPath.row)")
    }
}

// MARK: - Recognizer

extension ViewController {

    func cellLongPressed(sender: UILongPressGestureRecognizer) {
        let point = sender.locationInView(collectionView)
        guard let indexPath = collectionView.indexPathForItemAtPoint(point) else { return }

        switch sender.state {
        case .Began:
            print("longPressed began index: \(indexPath.row)")
        case .Ended:
            print("longPressed ended index: \(indexPath.row)")
        case .Changed:
            print("longPressed changed index: \(indexPath.row)")
        default:
            break
        }
    }
}

// MARK: - Selector

private extension Selector {

    static let cellLongPressed = #selector(ViewController.cellLongPressed(_:))
}