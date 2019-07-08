//
//  SideMenuViewController+DataSource.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/8/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

extension SideMenuViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellTypes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String.className(SideMenuTableViewCell.self)) as! SideMenuTableViewCell
    cell.configure(type: cellTypes[indexPath.row])
    return cell
  }
}

extension SideMenuViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cellType = cellTypes[indexPath.row]
    switch cellType{
    case .logout:
      showAlertLogout()
    default:
      break
    }
  }
}
