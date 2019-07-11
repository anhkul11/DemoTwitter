//
//  RootNavigationController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {
  
  lazy var titleImageView: UIView = {
    let image = UIImage(named: "ic_twitter")?.withRenderingMode(.alwaysOriginal)
    let titleView = UIImageView(image: image)
    titleView.contentMode = .scaleAspectFit
    return titleView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  func setupUI() {
    self.navigationBar.backgroundColor = .white
    self.navigationBar.tintColor = .tw_blue
  }
}
