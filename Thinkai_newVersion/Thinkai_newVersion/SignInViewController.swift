//
//  SignInViewController.swift
//  Thinkai_newVersion
//
//  Created by Angi on 6/21/22.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButtonTapped2(_ sender: Any) {
        print("Sign in button tapped.")
        
        // read values from text fields
        let userName = userNameTextField.text
        let userPassword = userPasswordTextField.text
        
        // check if required fields are not empty
        if (userName?.isEmpty)! || (userPassword?.isEmpty)!
        {
            //display alert message here
            print("User name \(String(describing: userName)) or password \(String(describing: userPassword)) is empty")
            
            displayMessage(userMessage: "One of the required fields is missing")
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
        
        // send HTTP request to perform sign in
        let myUrl = URL(string: "http://localhost:3000/api/authentication")
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST" // compose a query string
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    
        let postString = ["username": userName!, "userpassword": userPassword!] as [String:String]
        print(postString)
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
        } catch let error{
            print(error.localizedDescription)
            displayMessage(userMessage: "Somethinh went wrong...")
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
                        
                        //now we can access value of first name by its key
                        let accessToken = parseJSON["success"] as? String
                        
                        print("Access : \(String(describing: accessToken!))")
                        
                        if (accessToken?.isEmpty)!
                        {
                            //display an alert dialog with a friendly error message
                            self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later.")
                            return
                        }
                        else
                        {
                            if(accessToken == "true" )
                            {
                                DispatchQueue.main.async
                                 {
                                let homePage = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
                                 let appDelegate = UIApplication.shared.delegate
                                 appDelegate?.window??.rootViewController = homePage
                                  
                                     self.present(homePage, animated: true)}
                            }
                            else
                            {
                                //display an alert dialog with a friendly error message
                                self.displayMessage(userMessage: "Invalid password or username. Please try again.")
                                return
                            }                        }
                }
            else {
                        // display an alert dialog with a friendly error message
                        self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later.")
                    }
                    
                } catch {
                    self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                    
                    // display an alert dialog with a friendly error message
                    self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later.")
                    print(error)                }
            
        }
      
        task.resume()
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        print("Register button tapped.")
        
        let registerbutton = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        self.present(registerbutton, animated: true)
        
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

}
