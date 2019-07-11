//
//  UICollectionView+Extension.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

public extension UICollectionView {
  func registerCellClass <CellClass: UICollectionViewCell> (_ cellClass: CellClass.Type) {
    let classNameWithoutModule = cellClass
      .description()
      .components(separatedBy: ".")
      .dropFirst()
      .joined(separator: ".")
    
    register(cellClass, forCellWithReuseIdentifier: classNameWithoutModule)
  }
  
  func registerCellNibForClass(_ cellClass: AnyClass) {
    let classNameWithoutModule = cellClass
      .description()
      .components(separatedBy: ".")
      .dropFirst()
      .joined(separator: ".")
    
    register(UINib(nibName: classNameWithoutModule, bundle: nil),
             forCellWithReuseIdentifier: classNameWithoutModule)
  }
}
