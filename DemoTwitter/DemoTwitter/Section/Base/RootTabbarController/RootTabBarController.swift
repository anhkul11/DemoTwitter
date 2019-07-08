//
//  RootTabBarController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import SnapKit

class RootTabBarController: UITabBarController {
  
  /// instantiate
  internal static func instantiate() -> RootTabBarController {
    return Storyboard.Main.instantiate(type: RootTabBarController.self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func setupUI() {
    view.backgroundColor = .white
    tabBar.tintColor = .tw_blue
    setupTabbarItems()
    
    setupNewButton()
  }
  
  func setupTabbarItems() {
    let tabBarItems = [
      UITabBarItem(title: nil, image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home")),
      UITabBarItem(title: nil, image: UIImage(named: "ic_search"), selectedImage: UIImage(named: "ic_search")),
      UITabBarItem(title: nil, image: UIImage(named: "ic_notification"), selectedImage: UIImage(named: "ic_notification")),
      UITabBarItem(title: nil, image: UIImage(named: "ic_message"), selectedImage: UIImage(named: "ic_message"))]
    let viewControllers: [UIViewController] = [
      NewFeedViewController.instantiate(),
      SearchViewController.instantiate(),
      MessageViewController.instantiate(),
      NotificationViewController.instantiate()
    ]
    let controllers = viewControllers.map({ RootNavigationController(rootViewController: $0)})
    for (index, vc) in controllers.enumerated() {
      vc.tabBarItem = tabBarItems[index]
    }
    self.setViewControllers(controllers, animated: true)
  }
  
  func setupNewButton() {
    let buttonNew = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    buttonNew.setImage(UIImage(named: "ic_write"), for: .normal)
    buttonNew.tintColor = .tw_blue
    buttonNew.layer.cornerRadius = 40
    buttonNew.layer.shadowColor = UIColor.black.cgColor
    buttonNew.layer.shadowOffset = CGSize(width: 5, height: 5)
    buttonNew.layer.shadowRadius = 5
    buttonNew.layer.shadowOpacity = 1.0
    
    buttonNew.addTarget(self, action: #selector(showNewPostController), for: .touchUpInside)
    view.addSubview(buttonNew)
    view.bringSubviewToFront(buttonNew)
    buttonNew.snp.makeConstraints { (make) in
      make.trailing.equalToSuperview().offset(-20)
      make.bottom.equalTo(self.tabBar.snp_topMargin).offset(-20)
    }
  }
  
  @objc func showNewPostController() {
    let newPostVC = NewPostViewController.instantiate()
    let rootNavigation = RootNavigationController(rootViewController: newPostVC)
    self.present(rootNavigation, animated: true, completion: nil)
  }
}
