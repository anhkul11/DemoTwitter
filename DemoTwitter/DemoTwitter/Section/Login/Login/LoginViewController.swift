//
//  LoginViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyUserDefaults

class LoginViewController: UIViewController {
  
  /// instantiate
  internal static func instantiate() -> LoginViewController {
    return Storyboard.Login.instantiate(type: LoginViewController.self)
  }
  
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  @IBOutlet weak var titleLabelBottomConstraint: NSLayoutConstraint!
  @IBOutlet weak var errorLabelBottomConstraint: NSLayoutConstraint!
  
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    bindingRx()
  }
  
  override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    super.willTransition(to: newCollection, with: coordinator)
    if UIDevice.current.orientation.isLandscape {
      self.titleLabelBottomConstraint.constant = 40
    } else {
      self.titleLabelBottomConstraint.constant = 90
    }
    view.layoutIfNeeded()
  }
  
  func setupUI() {
    if let nav = self.navigationController as? RootNavigationController{
      nav.navigationBar.topItem?.titleView = nav.titleImageView
    }
    loginButton.setStyle(.login)
    errorLabel.isHidden = true
    
    hideKeyboardWhenTappedAround()
    animationKeyboard()
  }
  
  func bindingRx() {
    loginButton.rx.tap.subscribe(onNext: { [weak self] (_) in
      self?.doLogin()
    }).disposed(by: disposeBag)
  }
  
  func doLogin() {
    let userName = usernameTextField.text ?? ""
    let password = passwordTextField.text ?? ""
    let userModels = Defaults[.users]
    let currentUser = userModels.filter { (userModel) -> Bool in
      return userModel.userName == userName && userModel.passWord == password
    }
    if currentUser.isEmpty {
      showError()
      
    } else {
      let user = UserModel(name: currentUser[0].name, userName: currentUser[0].userName, passWord: currentUser[0].passWord)
      UserManager.shared.login(userModel: user)
    }
  }
  
  func showError() {
    errorLabel.text = "Wrong username, password"
    errorLabel.isHidden = false
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
