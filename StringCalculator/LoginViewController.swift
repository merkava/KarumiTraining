//
//  LoginViewController.swift
//  StringCalculator
//
//  Created by Marcos on 11/12/19.
//  Copyright © 2019 Mobgen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let username = UILabel()
    let userNameTF = UITextField()
    let password = UILabel()
    let passwordTF = UITextField()
    let loginB = UIButton(type: .roundedRect)
    let logoutB = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        setupComponents()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setupComponents() {
        
        username.text = "User Name"
        username.textColor = .gray
        username.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(username)
        
        userNameTF.text = "user"
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userNameTF)
        
        password.text = "Password"
        password.textColor = .gray
        password.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(password)
        
        passwordTF.text = "pass"
        passwordTF.isSecureTextEntry = true
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTF)
            
        loginB.setTitle("LOGIN", for: .normal)
        loginB.setTitleColor(.red, for: .normal)
        loginB.addTarget(self, action: #selector(didPressLoginButton(_:)), for: .touchUpInside)
        loginB.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginB)
        
        logoutB.setTitle("LOGOUT", for: .normal)
        logoutB.setTitleColor(.red, for: .normal)
        logoutB.addTarget(self, action: #selector(didPressLogoutButton(_:)), for: .touchUpInside)
        logoutB.translatesAutoresizingMaskIntoConstraints = false
        logoutB.alpha = 0
        view.addSubview(logoutB)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        username.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        username.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        loginB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        logoutB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        
        username.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        userNameTF.topAnchor.constraint(equalTo: username.topAnchor, constant: 30),
        password.topAnchor.constraint(equalTo: userNameTF.topAnchor, constant: 50),
        passwordTF.topAnchor.constraint(equalTo: password.topAnchor, constant: 30),
        loginB.topAnchor.constraint(equalTo: passwordTF.topAnchor, constant: 70),
        passwordTF.widthAnchor.constraint(equalToConstant: 150),
        loginB.widthAnchor.constraint(equalToConstant: 150),
        loginB.heightAnchor.constraint(equalToConstant: 50),
        logoutB.topAnchor.constraint(equalTo: loginB.topAnchor, constant: 40),
        logoutB.widthAnchor.constraint(equalToConstant: 150),
        logoutB.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }

    
    @objc func didPressLoginButton(_ button: UIButton) {
        let login = Login()
        if login.loginInApp(user: userNameTF.text ?? "", pass: passwordTF.text ?? "") {
            loginB.alpha = 0
            logoutB.alpha = 1
            username.alpha = 0
            userNameTF.alpha = 0
            password.alpha = 0
            passwordTF.alpha = 0
        } else {
            let alert:UIAlertController = UIAlertController(title: "ERROR", message: "Login incorrecto, te sugiero rollo gallego", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
    }
    
    @objc func didPressLogoutButton(_ button: UIButton) {
        let logout = Logout.init(timeManager: RealTimeClock())
        if logout.logoutOfApp() {
            loginB.alpha = 1
            logoutB.alpha = 0
            username.alpha = 1
            userNameTF.alpha = 1
            password.alpha = 1
            passwordTF.alpha = 1
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

class Login: NSObject {
    func loginInApp(user: String, pass: String) -> Bool {
        if pass == "estalloviendo" && user == "galicia" {
            return true
        } else {
            return false
        }
        
    }
}

protocol Clock {
    func now() -> Int
}
class RealTimeClock: NSObject, Clock {
    func now() -> Int {
        return Int(Date().timeIntervalSince1970)
    }
}

class Logout: NSObject {
    let timeManager: Clock
    init(timeManager: Clock) {
        self.timeManager = timeManager
        
    }
    func logoutOfApp() -> Bool {
        if timeManager.now()%2 == 0 {
            return true
        } else {
            return false
        }
    }
}
