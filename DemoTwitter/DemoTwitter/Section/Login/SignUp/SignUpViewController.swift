
//
//  SignUpViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SwiftyUserDefaults

class SignUpViewController: UIViewController {
  
  /// instantiate
  internal static func instantiate() -> SignUpViewController {
    return Storyboard.Login.instantiate(type: SignUpViewController.self)
  }
  
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var nicknameTextField: UITextField!
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  @IBOutlet weak var errorLabelBottomConstraint: NSLayoutConstraint!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    bindingRx()
  }
  
  func setupUI() {
    if let nav = self.navigationController as? RootNavigationController{
      nav.navigationBar.topItem?.titleView = nav.titleImageView
    }
    signUpButton.setStyle(.login)
    errorLabel.isHidden = true
    
    animationKeyboard()
  }
  
  func bindingRx() {
    signUpButton.rx.tap.subscribe(onNext: { [weak self] (_) in
      let nickname = self?.nicknameTextField.text ?? ""
      let email = self?.userNameTextField.text ?? ""
      let password = self?.passwordTextField.text ?? ""
      
      if let (validate,errorMessage) = self?.validateInput(nickname: nickname, userName: email, password: password) {
        if validate {
          UserManager.shared.signUp(nickname: nickname, userName: email, password: password)
        } else {
          self?.errorLabel.text = errorMessage
          self?.errorLabel.isHidden = false
        }
      }
    }).disposed(by: disposeBag)
  }
  
  func validateInput(nickname: String, userName: String, password: String) -> (Bool,String) {
    if nickname.isEmpty || userName.isEmpty || password.isEmpty {
      return (false, "Please input nickname, username, password!")
    }
    
    if userName.count < 8 || password.count < 8 || userName.contains(" ") || password.contains(" ") {
      return (false, "Username, password must have aleast 8 characters, and don't have white space.")
    }
    
    let models = Defaults[.users]
    if models.contains(where: { $0.userName == userName}) {
      return (false, "This username is already signed up.")
    }
    return (true,"")
  }
  
  func animationKeyboard() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
  }
  @objc func keyboardWillShow(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
      errorLabelBottomConstraint.constant += keyboardSize.height
      view.layoutIfNeeded()
    }
    
  }
  
  @objc func keyboardWillHide(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
      errorLabelBottomConstraint.constant -= keyboardSize.height
      view.layoutIfNeeded()
    }
  }
}
