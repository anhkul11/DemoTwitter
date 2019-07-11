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
import KWDrawerController

extension AppDelegate {
  func setupFireBase() {
    FirebaseApp.configure()
  }
  
  func setupRootViewController() {
    let isLogin = Defaults[.isLogin]
    if isLogin {
      rootTabbarController = RootTabBarController.instantiate()
      let sideMenuController = SideMenuViewController.instantiate()
      
      drawerController = DrawerController()
      drawerController?.setViewController(rootTabbarController, for: .none)
      drawerController?.setViewController(sideMenuController, for: .left)
      self.window?.rootViewController = drawerController
    } else {
      let landingController = LandingViewController.instantiate()
      rootNavigationController = RootNavigationController(rootViewController: landingController)
      self.window?.rootViewController = rootNavigationController
    }
  }
}
