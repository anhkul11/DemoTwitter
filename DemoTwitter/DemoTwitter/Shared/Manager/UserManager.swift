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
  
  func login(userModel: UserModel) {
    Defaults[.user] = userModel
    Defaults[.isLogin] = true
    UIAppDelegate.setupRootViewController()
  }
  
  func logout() {
    Defaults[.isLogin] = false
    UIAppDelegate.setupRootViewController()
  }
  
  func signUp(nickname: String, userName: String, password: String) {
    let userModel = UserModel(name: nickname, userName: userName, passWord: password)
    Defaults[.users].append(userModel)
    Defaults[.user] = userModel
    Defaults[.isLogin] = true
    UIAppDelegate.setupRootViewController()
  }
}
