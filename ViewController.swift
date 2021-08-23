//
//  ViewController.swift
//  FaceID
//
//  Created by Mr. Krabs on 8/22/21.
//

import LocalAuthentication
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 500, height: 75))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Face ID", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    @objc func didTapButton() {
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Please Authorize with touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        
                        let alert = UIAlertController(title: "Failed to Authenticate", message: "Please try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                        self?.present(alert, animated: true)
                        return
                        }
                    
                    let vc = UIViewController()
                    vc.title = "Dubs Financial"
                    vc.view.backgroundColor = .systemGreen
                    self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
                    
                    }
                }
        }
        else {
            let alert = UIAlertController(title: "Unavailable", message: "You can't use the feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }

}

