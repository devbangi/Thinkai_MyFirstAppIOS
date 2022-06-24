//
//  RegisterViewController.swift
//  Thinkai_newVersion
//
//  Created by Angi on 6/21/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        print("Cancel button tapped.")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInButtonTapped3(_ sender: Any) {
        print("Sing in button tapped.")
        
        //validate required fields are not empty
        if (firstNameTextField.text?.isEmpty)! ||
           (lastNameTextField.text?.isEmpty)! ||
           (emailAddressTextField.text?.isEmpty)! ||
           (passwordTextField.text?.isEmpty)!
        {
            // display alert message and return
            displayMessage(userMessage: "All fields are quired to fill in.")
            return
        }
        
        //validate password
        if
            ((passwordTextField.text?.elementsEqual(repeatPasswordTextField.text!))! != true)
        {
            // display alert message and return
            displayMessage(userMessage: "Please make sure that passwords match.")
            return
        }
        
        // create activity indicator
        let myActivityIndicator = UIActivityIndicatorView(style:UIActivityIndicatorView.Style.medium)
        
        // position activity indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // if needed, you can prevent activity indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        // start activity indicator
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
        
        // send HTTP request to register user
        let myUrl = URL(string: "http://localhost:3000/api/register")
        var request = URLRequest(url:myUrl!)
        request.httpMethod = "POST" // compose a query string
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let postString = ["firstname":firstNameTextField.text!,
                          "lastname":lastNameTextField.text!,
                          "username":emailAddressTextField.text!,
                          "userpassword":passwordTextField.text!,
        ] as [String: String]
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            displayMessage(userMessage: "Something went wrong. Try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
        self.removeActivityIndicator(activityIndicator: myActivityIndicator)
       
        if error != nil
        {
            self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later.")
            print("error=\(String(describing: error))")
            return
        }
            
        // let's convert response sent from a server side code to a NSDictionary object:
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    
                    let _id = parseJSON["_id"] as? String
                    
                    print("User id: \(String(describing: _id!))")
                    
                    if(_id?.isEmpty)!
                    {
                        //display an alert dialog with a friendly error message
                        self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later")
                        return
                    }
                    else{
                        self.displayMessage(userMessage: "Successfully Registered a New Account. Please procees to Sign in.")
                    }
                } else {
                    // display an alert dialog with a friendly error message
                    self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later.")
                }
            } catch {
                self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                
                // display an alert dialog with a friendly error message
                self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later.")
                print(error)
            }
            }
            
        task.resume()
        
    }
    
    func removeActivityIndicator(activityIndicator: UIActivityIndicatorView)
    {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default)
            {
                (action:UIAlertAction!) in
                // code in this block will trigger when OK button is tapped.
                print("OK button tapped")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
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
