import UIKit

final class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    fileprivate let imagePickerController = UIImagePickerController()
    
    fileprivate lazy var actionSheetBuilder: ActionSheet.Builder =
        ActionSheet.Builder(presentingViewController: self)
            .setTitle("ProfileImage")
            .setAction(title: "Album", style: .default, handler: { [weak self] _ in self?.presentImagePicker() })
            .setAction(title: "Remove", style: .destructive, handler: { [weak self] _ in self?.deleteImage() })
            .setAction(title: "Cancel", style: .cancel)
    
    private lazy var gestureRecognizers: [UITapGestureRecognizer] = [
        UITapGestureRecognizer(target: self, action: .didTouchImageView)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.gestureRecognizers = gestureRecognizers
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
    }
}

// MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Public

extension ViewController {
    
    func didTouchImageView(sender: AnyObject) {
        actionSheetBuilder.show()
    }
}

// MARK: - Private

extension ViewController {
    
    fileprivate func presentImagePicker() {
        present(imagePickerController, animated: true, completion: nil)
    }
    
    fileprivate func deleteImage() {
        imageView.image = nil
    }
}

// MARK: - Selector

private extension Selector {
    
    static let didTouchImageView = #selector(ViewController.didTouchImageView)
}

