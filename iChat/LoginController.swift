//
//  LoginController.swift
//  iChat
//
//  Created by Likhit Garimella on 23/05/20.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    let inputsContainerView = UIView()
    let loginRegisterButton = UIButton(type: .system)
    let nameTextField = UITextField()
    let nameSeparatorView = UIView()
    let emailTextField = UITextField()
    let emailSeparatorView = UIView()
    let passwordTextField = UITextField()
    let profileImageView = UIImageView()
    let loginRegisterSegmentedControl = UISegmentedControl(items: ["Login", "Register"])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view properties
        view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        view.addSubview(loginRegisterSegmentedControl)
        
        // function calls
        hideKeyboardWhenTappedAround()
        setupInputsContainerView()
        setupProfileImageView()
        setupLoginRegisterButton()
        setupLoginRegisterSegmentedControl()
        
    }
    
    // variable constraint anchors
    var inputsContainerViewHeightAnchor = NSLayoutConstraint()
    var nameTextFieldHeightAnchor = NSLayoutConstraint()
    var emailTextFieldHeightAnchor = NSLayoutConstraint()
    var passwordTextFieldHeightAnchor = NSLayoutConstraint()
    
    func setupInputsContainerView() {
        
        // Add subviews to inputsContainerView
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        // inputsContainerView properties
        inputsContainerView.backgroundColor = UIColor.white
        inputsContainerView.translatesAutoresizingMaskIntoConstraints = false
        inputsContainerView.layer.cornerRadius = 6
        inputsContainerView.layer.masksToBounds = true
        
        // Need x, y, width, height constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputsContainerViewHeightAnchor.isActive = true
        
        // nameTextField properties
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.textColor = UIColor.darkGray
        
        // Need x, y, width, height constraints
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor.isActive = true
        
        // nameSeparatorView properties
        nameSeparatorView.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        nameSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        
        // Need x, y, width, height constraints
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // emailTextField properties
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email id", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.textColor = UIColor.darkGray
        
        // Need x, y, width, height constraints
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor.isActive = true
        
        // emailSeparatorView properties
        emailSeparatorView.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        emailSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        
        // Need x, y, width, height constraints
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // passwordTextField properties
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.textColor = UIColor.darkGray
        passwordTextField.isSecureTextEntry = true
        
        // Need x, y, width, height constraints
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor.isActive = true
        
    }
    
    func setupProfileImageView() {
        
        // profileImageView properties
        profileImageView.image = UIImage(named: "sample")
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 6
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFill
        
        // Need x, y, width, height constraints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -24).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 276.5).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 202.5).isActive = true
        
    }
    
    func setupLoginRegisterSegmentedControl() {
        
        // Segmented control properties
        loginRegisterSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        loginRegisterSegmentedControl.tintColor = UIColor.white
        loginRegisterSegmentedControl.selectedSegmentIndex = 1
        loginRegisterSegmentedControl.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        
        // Need x, y, width, height constraints
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
    }
    
    @objc func handleLoginRegisterChange() {
        
        // Setting button title same as segmented control title
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)
        
        // Change height of inputsContainerView
        inputsContainerViewHeightAnchor.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        // Change height of nameTextField
        nameTextFieldHeightAnchor.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextFieldHeightAnchor.isActive = true
        
        // Change height of emailTextField
        emailTextFieldHeightAnchor.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextFieldHeightAnchor.isActive = true
        
        // Change height of passwordTextField
        passwordTextFieldHeightAnchor.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor.isActive = true
        
    }
    
    func setupLoginRegisterButton() {
        
        // loginRegisterButton properties
        loginRegisterButton.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        loginRegisterButton.setTitle("Register", for: .normal)
        loginRegisterButton.setTitleColor(UIColor.white, for: .normal)
        loginRegisterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginRegisterButton.translatesAutoresizingMaskIntoConstraints = false
        loginRegisterButton.layer.cornerRadius = 6
        loginRegisterButton.layer.masksToBounds = true
        
        // Need x, y, width, height constraints
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // Action for register button
        loginRegisterButton.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        
    }
    
    @objc func handleLoginRegister() {
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
        
    }
    
    @objc func handleLogin() {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Invalid Form Input")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print(error!)
                return
            }
            // Successfully logged in user
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    @objc func handleRegister() {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Invalid Form Input")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let uid = user?.user.uid else {
                return
            }
            
            // Successfully registered user
            let ref = Database.database().reference()
            let usersReference = ref.child("users").child(uid)
            let values = ["name": name, "email": email]
            usersReference.updateChildValues(values) { (err, ref) in
                
                if err != nil {
                    print(err!)
                    return
                }
                
                print("Saved user successfully into Firebase database")
                self.dismiss(animated: true, completion: nil)
                
            }
            
        })
        
    }

}   // #280
