//
//  LandingViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class LandingViewController: UIViewController {
  
  /// instantiate
  internal static func instantiate() -> LandingViewController {
    return Storyboard.Login.instantiate(type: LandingViewController.self)
  }
  
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var signInLabel: UILabel!
  @IBOutlet weak var signInButton: UIButton!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    bindingRx()
  }
  
  func setupUI() {
    if let nav = self.navigationController as? RootNavigationController {
      nav.navigationBar.topItem?.titleView = nav.titleImageView
    }
    
    descriptionLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    descriptionLabel.textColor = .black
    descriptionLabel.textAlignment = .left
    descriptionLabel.text = "See what's happening in the world right now."
    descriptionLabel.numberOfLines = 0
    
    signUpButton.setStyle(.login)
    signUpButton.setTitle("Create account", for: .normal)
    
    let nsAttriText = NSMutableAttributedString(string: "Have an account already? ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    nsAttriText.append(NSMutableAttributedString(string: "Log in", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.tw_blue]))
    signInLabel.attributedText = nsAttriText
  }
  
  func bindingRx() {
    signInButton.rx.tap.subscribe(onNext: { [weak self] (_) in
      let loginController = LoginViewController.instantiate()
      self?.navigationController?.pushViewController(loginController, animated: true)
    }).disposed(by: disposeBag)
    
    signUpButton.rx.tap.subscribe(onNext: { [weak self] (_) in
      let signUpController = SignUpViewController.instantiate()
      self?.navigationController?.pushViewController(signUpController, animated: true)
    }).disposed(by: disposeBag)
  }
}
