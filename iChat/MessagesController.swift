//
//  MessagesController.swift
//  iChat
//
//  Created by Likhit Garimella on 23/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class MessagesController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nav bar button
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        let image = UIImage(named: "pen")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        
        checkIfUserIsLoggedIn()
        
    }
    
    @objc func handleNewMessage() {
        
        let newMessageController = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        // presentation style
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
        
        
    }
    
    func checkIfUserIsLoggedIn() {
        
        // user is not logged in
        if Auth.auth().currentUser?.uid == nil {
            // handleLogout()
            self.perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            // if user logged in
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
                
                if let dictionary = snapshot.value as? [String : AnyObject] {
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
            }, withCancel: nil)
        }
        
    }
    
    @objc func handleLogout() {
        
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        // presentation style
        loginController.modalPresentationStyle = .fullScreen
        present(loginController, animated: true, completion: nil)
        
    }

}

// Dismiss keyboard on tapping anywhere
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}   // #88
