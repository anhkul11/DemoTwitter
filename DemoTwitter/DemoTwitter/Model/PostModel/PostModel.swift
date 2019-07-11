//
//  PostModel.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/5/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation
import Firebase

struct PostModel {
  
  let ref: DatabaseReference?
  let key: String
  var nickName: String
  var account: String
  var dateTime: String
  var message: String
  var numberOfLike: Int
  var numberOfComment: Int
  var numberOfRetweet: Int
  
  init(userModel: UserModel?, message: String, key: String = "") {
    self.ref = nil
    self.key = key
    self.nickName = userModel?.name ?? ""
    self.account = userModel?.userName ?? ""
    self.dateTime = "\(Date())"
    self.message = message
    self.numberOfLike = 0
    self.numberOfComment = 0
    self.numberOfRetweet = 0
  }
  
  init?(snapshot: DataSnapshot) {
    guard
      let value = snapshot.value as? [String: AnyObject],
      let nickName = value["nickName"] as? String,
      let account = value["account"] as? String,
      let dateTime = value["dateTime"] as? String,
      let message = value["message"] as? String,
      let numberOfLike = value["numberOfLike"] as? Int,
      let numberOfComment = value["numberOfComment"] as? Int,
      let numberOfRetweet = value["numberOfRetweet"] as? Int else {
        return nil
    }
    
    self.ref = snapshot.ref
    self.key = snapshot.key
    self.nickName = nickName
    self.account = account
    self.dateTime = dateTime
    self.message = message
    self.numberOfLike = numberOfLike
    self.numberOfComment = numberOfComment
    self.numberOfRetweet = numberOfRetweet
  }
  
  func toAnyObject() -> Any {
    return [
      "nickName": nickName,
      "account": account,
      "dateTime": dateTime,
      "message": message,
      "numberOfLike": numberOfLike,
      "numberOfComment": numberOfComment,
      "numberOfRetweet": numberOfRetweet
    ]
  }
}
