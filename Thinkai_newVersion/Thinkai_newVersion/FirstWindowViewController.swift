//
//  FirstWindowViewController.swift
//  Thinkai_newVersion
//
//  Created by Angi on 6/21/22.
//

import UIKit

class FirstWindowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        print("Sign in.")
        
        let signIn = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        
        self.present(signIn, animated: true)
        
    }
    
    @IBAction func signInWithFbButtonTapped(_ sender: Any) {
        print("Sign in with facebook.")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
