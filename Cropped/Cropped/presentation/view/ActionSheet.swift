import UIKit

struct ActionSheet {
    
    struct Builder {
        
        private let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        private weak var presentingViewController: UIViewController?
        
        init(presentingViewController: UIViewController) {
            self.presentingViewController = presentingViewController
        }
        
        func setTitle(_ title: String) -> Builder {
            sheet.title = title
            return self
        }
        
        func setMessage(_ message: String) -> Builder {
            sheet.message = message
            return self
        }
        
        func setAction(title: String, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)? = nil) -> Builder {
            let action = UIAlertAction(title: title, style: style, handler: handler)
            sheet.addAction(action)
            return self
        }
        
        func show() {
            presentingViewController?.present(sheet, animated: true, completion: nil)
        }
    }
}
