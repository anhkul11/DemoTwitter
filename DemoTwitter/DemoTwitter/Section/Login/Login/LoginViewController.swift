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
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
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
    loginButton.setStyle(.login)
    errorLabel.isHidden = true
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
}
