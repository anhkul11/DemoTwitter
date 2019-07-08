//
//  SideMenuHeaderView.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/8/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import SnapKit

class SideMenuHeaderView: UIView {
  
  class func instanceFromNib() -> SideMenuHeaderView {
    return UINib(nibName: "SideMenuHeaderView",
                 bundle: nil).instantiate(withOwner: nil,
                                          options: nil)[0] as! SideMenuHeaderView
  }
  
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var nickNameLabel: UILabel!
  @IBOutlet weak var accountLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    
    setupView()
    configure()
  }
  
  func setupView() {
    avatarImageView.layer.cornerRadius = avatarImageView.bounds.height/2
  }
  
  func configure() {
    if let userModel = Defaults[.user] {
      nickNameLabel.text = userModel.name
      accountLabel.text = userModel.userName
    }
  }
}
