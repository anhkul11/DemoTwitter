//
//  MessageViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

  /// instantiate
  internal static func instantiate() -> MessageViewController {
    return Storyboard.Message.instantiate(type: MessageViewController.self)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

      setupUI()
  }
  
  func setupUI() {
    self.title = "Message"
    self.leftNavigationButton = .avatar
    self.rightNavigationButton = .setting
  }
}
