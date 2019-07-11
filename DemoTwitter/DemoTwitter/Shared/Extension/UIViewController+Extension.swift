//
//  UIViewController+Extension.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/10/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

extension UIViewController {
  // Hide keyboard when tap outside keyboard
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
