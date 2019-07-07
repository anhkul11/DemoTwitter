//
//  RootTabBarController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

  /// instantiate
  internal static func instantiate() -> RootTabBarController {
    return Storyboard.Main.instantiate(type: RootTabBarController.self)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
