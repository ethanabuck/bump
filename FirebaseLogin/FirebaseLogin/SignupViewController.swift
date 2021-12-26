//
//  SignupViewController.swift
//  FirebaseLogin
//
//  Created by Ethan Buck on 12/24/21.
//

import UIKit
import FirebaseAuth
import Firebase


class SignupViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        if email.text?.isEmpty == true {
            print("No text in emial field")
            return
    }
    if password.text?.isEmpty == true {
        print("No text in password field")
        return
    }
    
    signUp()
    
        func alreadyHaveAccountLoginTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func signUp()  {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
        }
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
    
        }
    }
}
}

