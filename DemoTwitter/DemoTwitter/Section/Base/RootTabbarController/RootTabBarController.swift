//
//  RootTabBarController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

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
}
