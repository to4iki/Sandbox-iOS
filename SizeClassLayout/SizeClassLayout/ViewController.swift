import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewWidthConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(ViewController.onOrientationChange(notification:)),
            name: NSNotification.Name.UIDeviceOrientationDidChange,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name.UIDeviceOrientationDidChange,
            object: nil
        )
    }

    func onOrientationChange(notification: NSNotification) {
        let deviceOrientation = UIDevice.current.orientation
        if UIDeviceOrientationIsLandscape(deviceOrientation) {
            print("Landscape")
            print(viewWidthConstraint.constant)
        } else if UIDeviceOrientationIsPortrait(deviceOrientation){
            print("Portrait")
            print(viewWidthConstraint.constant)
        }
    }
}
