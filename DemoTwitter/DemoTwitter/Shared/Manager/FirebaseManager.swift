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
  
  /// MARK: Post model
  func addPost(postModel: PostModel) {
    FirebaseManager.shared.postRef.childByAutoId().setValue(postModel.toAnyObject())
  }
  
  func deletePost(postModel: PostModel) {
    postModel.ref?.removeValue()
  }
}
