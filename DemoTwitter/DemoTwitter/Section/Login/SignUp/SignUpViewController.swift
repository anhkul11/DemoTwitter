
//
//  SignUpViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  /// instantiate
  internal static func instantiate() -> SignUpViewController {
    return Storyboard.Login.instantiate(type: SignUpViewController.self)
  }
  
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var nicknameTextField: UITextField!
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
}
