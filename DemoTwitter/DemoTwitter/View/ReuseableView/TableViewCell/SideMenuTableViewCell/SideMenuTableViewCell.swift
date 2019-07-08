//
//  SideMenuTableViewCell.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/8/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

enum MenuCellType: Int, CaseIterable {
  case profile = 0
  case list = 1
  case bookmark = 2
  case logout = 3
}
class SideMenuTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  func setupUI() {
    
  }
  
  func configure(type: MenuCellType) {
    switch type {
    case .profile:
      self.imageView?.image = UIImage(named: "ic_customer")
      self.textLabel?.text = "Profile"
    case .list:
      self.imageView?.image = UIImage(named: "ic_list")
      self.textLabel?.text = "List"
    case .bookmark:
      self.imageView?.image = UIImage(named: "ic_bookmark")
      self.textLabel?.text = "Bookmark"
    case .logout:
      self.imageView?.image = UIImage(named: "ic_logout")
      self.textLabel?.text = "Log out"
    }
  }
}
