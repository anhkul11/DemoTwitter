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
  
  let postRef = Database.database().reference(withPath: "post-model")
  
  let userRef = Database.database().reference(withPath: "user-model")
  
  func login(userName: String, password: String) -> UserModel {
    return UserModel(name: "Anh Le", userName: "@Anh1234", passWord: "abc123!")
  }
  
  func signUp(userModel: UserModel) {
    FirebaseManager.shared.userRef.setValue(userModel)
  }
  
  func addPost(postModel: PostModel) {
    FirebaseManager.shared.postRef.childByAutoId().setValue(postModel.toAnyObject())
  }
}
