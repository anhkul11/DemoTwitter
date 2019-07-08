//
//  UserModel.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/5/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

struct UserModel: Codable, DefaultsSerializable {
  var name: String
  var userName: String
  var passWord: String
}
