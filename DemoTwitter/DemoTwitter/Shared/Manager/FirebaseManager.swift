//
//  FirebaseManager.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation
import FirebaseDatabase

final class FirebaseManager {
  static let shared = FirebaseManager()
  
  let rootRef = Database.database().reference()
}
