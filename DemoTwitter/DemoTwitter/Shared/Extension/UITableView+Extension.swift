//
//  UITableView+Extension.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

public extension UITableView {
  func registerCellClass <CellClass: UITableViewCell> (_ cellClass: CellClass.Type) {
    let classNameWithoutModule = cellClass
      .description()
      .components(separatedBy: ".")
      .dropFirst()
      .joined(separator: ".")
    
    register(cellClass, forCellReuseIdentifier: classNameWithoutModule)
  }
  
  func registerCellNibForClass(_ cellClass: AnyClass) {
    let classNameWithoutModule = cellClass
      .description()
      .components(separatedBy: ".")
      .dropFirst()
      .joined(separator: ".")
    
    register(UINib(nibName: classNameWithoutModule, bundle: nil),
             forCellReuseIdentifier: classNameWithoutModule)
  }
}
