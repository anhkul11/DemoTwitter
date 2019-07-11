//
//  SearchViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {

  /// instantiate
  internal static func instantiate() -> SearchViewController {
    return Storyboard.Search.instantiate(type: SearchViewController.self)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
  
  func setupUI() {
    self.title = "Search"
    self.leftNavigationButton = .avatar
    self.rightNavigationButton = .setting
  }
}
