//
//  LoginViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  /// instantiate
  internal static func instantiate() -> LoginViewController {
    return Storyboard.Login.instantiate(type: LoginViewController.self)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
  func setupUI() {
    
  }
}
