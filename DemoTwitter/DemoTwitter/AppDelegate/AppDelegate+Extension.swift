//
//  AppDelegate+Extension.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/5/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation
import Firebase
import SwiftyUserDefaults

extension AppDelegate {
  func setupFireBase() {
    FirebaseApp.configure()
  }
  
  func setupRootViewController() {
    let isLogin = Defaults[.isLogin]
    if isLogin {
      rootTabbarController = RootTabBarController.instantiate()
      self.window?.rootViewController = rootTabbarController
    } else {
      let landingController = LandingViewController.instantiate()
      rootNavigationController = RootNavigationController(rootViewController: landingController)
      self.window?.rootViewController = rootNavigationController
    }
  }
}
