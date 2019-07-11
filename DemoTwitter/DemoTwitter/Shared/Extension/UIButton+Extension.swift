//
//  UIButton+Extension.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation
import UIKit

enum ButtonStyle {
  case login
  case newfeed
}
extension UIButton {
  func setStyle(_ style: ButtonStyle) {
    switch style {
    case .login:
      self.setTitleColor(.white, for: .normal)
      self.layer.cornerRadius = 10
      self.backgroundColor = .tw_blue
    case .newfeed:
      break
    }
  }
}
