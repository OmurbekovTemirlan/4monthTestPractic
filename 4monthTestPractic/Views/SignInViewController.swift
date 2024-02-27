//
//  SignInViewController.swift
//  4monthTestPractic
//
//  Created by Apple on 26.2.2024.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    private let makePaswordlbl = MakerView().makerLabel(text: "Create New Password 🔐",
                                                        size: 30,
                                                        weight: .bold,
                                                        textColor: .black,
                                                        textAlignment: .left,
                                                        numberOfLines: 1)
    
    private let infolbl = MakerView().makerLabel(
        text: "Enter your new password. If you forget it, then you have to do forgot password.",
        size: 18,
        weight: .regular,
        textColor: .black,
        numberOfLines: 2)
    
    private let passwordLbl = MakerView().makerLabel(text: "Password", size: 16, weight: .bold, textColor: .black)
    
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter a password"
        tf.isSecureTextEntry = true
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        rightView.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        tf.isUserInteractionEnabled = true
        rightView.addTarget(self, action: #selector(hideText ), for: .touchUpInside)
        rightView.tag = 0
        tf.rightView = rightView
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        tf.leftView = view
        tf.leftViewMode = .always
        tf.rightViewMode = .always
        tf.addTarget(self, action: #selector(handleInputOrButtonTap), for: .editingChanged)
        tf.tag = 0
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    private let confirmPasswordLbl = MakerView().makerLabel(text: "Confirm Password", size: 16, weight: .bold, textColor: .black)
    
    private let confirmPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm password"
        tf.isSecureTextEntry = true
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        rightView.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        tf.isUserInteractionEnabled = true
        rightView.addTarget(self, action: #selector(hideText ), for: .touchUpInside)
        rightView.tag = 1
        tf.rightView = rightView
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        tf.leftView = view
        tf.leftViewMode = .always
        tf.rightViewMode = .always
        tf.addTarget(self, action: #selector(handleInputOrButtonTap), for: .editingChanged)
        tf.tag = 0
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    
    
    
    private let rememberlbl = MakerView().makerLabel(text: "Remember Me", size: 18, weight: .semibold, textColor: .black)
    
    private let continueBtn = MakerView().makeButton(title: "Continue", colorBt: .white,
                                                     backgroundColorBT: .gray,
                                                     cornerRadiusBt: 12,
                                                     target: self,
                                                     action: #selector(handleInputOrButtonTap) )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        SetupLabels()
        setupTf()
        
        
    }
    
    private func SetupLabels(){
        view.addSubview(makePaswordlbl)
        
        NSLayoutConstraint.activate([
            makePaswordlbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            makePaswordlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            makePaswordlbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            
            
        ])
        view.addSubview(infolbl)
        NSLayoutConstraint.activate([
            infolbl.topAnchor.constraint(equalTo: makePaswordlbl.bottomAnchor, constant: 12),
            infolbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infolbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupTf(){
        view.addSubview(passwordLbl)
        NSLayoutConstraint.activate([
            passwordLbl.topAnchor.constraint(equalTo: infolbl.bottomAnchor, constant: 32),
            passwordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        view.addSubview(passwordTF)
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: passwordLbl.bottomAnchor, constant: 16),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTF.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        view.addSubview(confirmPasswordLbl)
        NSLayoutConstraint.activate([
            confirmPasswordLbl.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 24),
            confirmPasswordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            
        ])
        view.addSubview(confirmPasswordTF)
        NSLayoutConstraint.activate([
            confirmPasswordTF.topAnchor.constraint(equalTo: confirmPasswordLbl.bottomAnchor, constant: 16),
            confirmPasswordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            confirmPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            confirmPasswordTF.heightAnchor.constraint(equalToConstant: 35)
            
        ])
        
        view.addSubview(rememberlbl)
        NSLayoutConstraint.activate([
            rememberlbl.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor , constant: 24),
            rememberlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 64)
        ])
        view.addSubview(continueBtn)
        NSLayoutConstraint.activate([
            continueBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            continueBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            continueBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            continueBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func hideText(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
        case 1:
            confirmPasswordTF.isSecureTextEntry = !confirmPasswordTF.isSecureTextEntry
        default:
            break
        }
    }
    


    @objc private func handleInputOrButtonTap(_ sender: Any) {
        guard let password = passwordTF.text, let confirmPassword = confirmPasswordTF.text else { return }

        if sender is UITextField {
            if password.count >= 5 && password == confirmPassword {
                continueBtn.isEnabled = true
                continueBtn.backgroundColor = UIColor(hex: "#F5484A")
            } else {
                continueBtn.isEnabled = false
                continueBtn.backgroundColor = UIColor.gray
            }
        } else if sender is UIButton && password.count >= 5 && password == confirmPassword {
            let vc = ViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    }
    




