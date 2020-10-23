import UIKit

extension UIViewController {
    
    func presentAlert(title: String?, message: String?, buttonText: String?) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.view.tintColor = .green
        alert.addAction(UIAlertAction(
            title: buttonText,
            style: .default,
            handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
