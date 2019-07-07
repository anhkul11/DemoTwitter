//
//  BaseViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/5/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

enum NavigationButton {
  case avatar
  case setting
  case filtering
  case close
  case done
  case none
}
class BaseViewController: UIViewController {

  var leftNavigationButton: NavigationButton = .none {
    didSet {
      switch leftNavigationButton {
      case .avatar:
        self.navigationItem.leftBarButtonItem = avatarButton
      case .setting:
        self.navigationItem.leftBarButtonItem = settingButton
      case .none:
        self.navigationItem.leftBarButtonItem = nil
      default:
        self.navigationItem.leftBarButtonItem = backButton
      }
    }
  }
  
  var rightNavigationButton: NavigationButton = .none {
    didSet {
      switch rightNavigationButton {
      case .avatar:
        self.navigationItem.rightBarButtonItem = avatarButton
      case .setting:
        self.navigationItem.rightBarButtonItem = settingButton
      case .none:
        self.navigationItem.rightBarButtonItem = nil
      default:
        self.navigationItem.rightBarButtonItem = backButton
      }
    }
  }
  
  // MARK: Set up buttons
  lazy var avatarButton: UIBarButtonItem = {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    button.setImage(UIImage(named: "ic_twitter"), for: .normal)
    button.contentHorizontalAlignment = .left
    button.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
    return UIBarButtonItem(customView: button)
  }()
  
  lazy var settingButton: UIBarButtonItem = {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    button.setImage(UIImage(named: "ic_setting"), for: .normal)
    button.contentHorizontalAlignment = .right
    button.addTarget(self, action: #selector(showSetting), for: .touchUpInside)
    return UIBarButtonItem(customView: button)
  }()
  
  lazy var backButton: UIBarButtonItem = {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    button.setImage(UIImage(named: "ic_back"), for: .normal)
    button.contentHorizontalAlignment = .left
    button.addTarget(self, action: #selector(popController), for: .touchUpInside)
    return UIBarButtonItem(customView: button)
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
}

extension BaseViewController {
  
  // MARK: Actions
  @objc func showMenu() {
    
  }
  
  @objc func showSetting() {
    
  }
  
  @objc func popController() {
    self.navigationController?.popViewController(animated: true)
  }
}
