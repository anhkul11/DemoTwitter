//
//  NotificationViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

class NotificationViewController: BaseViewController {

  /// instantiate
  internal static func instantiate() -> NotificationViewController {
    return Storyboard.Notification.instantiate(type: NotificationViewController.self)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

      setupUI()
  }
  
  func setupUI() {
    self.title = "Notification"
    self.leftNavigationButton = .avatar
    self.rightNavigationButton = .setting
  }
}
