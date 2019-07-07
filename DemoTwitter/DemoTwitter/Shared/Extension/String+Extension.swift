//
//  String+Extension.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation

extension String {
  static func className(_ aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).components(separatedBy: ".").last!
  }
}
