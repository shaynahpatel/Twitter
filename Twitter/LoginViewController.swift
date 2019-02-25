//
//  LoginViewController.swift
//  Twitter
//
//  Created by Shayna Patel on 2/23/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func LoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
            UserDefaults.standard.set(true, forKey: "loggedIn") //everytime you log in its gonna create a variable called loggedIn and set it to true
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print ("could not login")
        })
    }
    
    //this function makes sure the user stays logged in after closing the app
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "loggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
