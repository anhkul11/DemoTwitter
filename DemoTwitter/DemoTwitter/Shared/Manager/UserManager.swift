//
//  UserManager.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/8/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

final class UserManager {
  public static let shared = UserManager()
  
  func login(userName: String, password: String) {
    Defaults[.user] = FirebaseManager.shared.login(userName: userName, password: password)
    Defaults[.isLogin] = true
    UIAppDelegate.setupRootViewController()
  }
  
  func logout() {
    Defaults.remove(.user)
    Defaults[.isLogin] = false
    UIAppDelegate.setupRootViewController()
  }
}
