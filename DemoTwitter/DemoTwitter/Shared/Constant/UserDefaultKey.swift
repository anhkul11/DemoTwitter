//
//  UserDefaultKey.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
  /// User is loged in?
  static let isLogin = DefaultsKey<Bool>("isLogin", defaultValue: false)
}
