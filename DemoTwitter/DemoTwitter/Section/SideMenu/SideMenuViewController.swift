//
//  SideMenuViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/8/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

  /// instantiate
  internal static func instantiate() -> SideMenuViewController {
    return Storyboard.SideMenu.instantiate(type: SideMenuViewController.self)
  }
  
  @IBOutlet weak var tableView: UITableView!
  
  var cellTypes: [MenuCellType] {
    return MenuCellType.allCases
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
  
  func setupUI() {
    setupTableView()
  }
  
  func setupTableView() {
    tableView.separatorStyle = .none
    tableView.backgroundColor = .white
    tableView.registerCellNibForClass(SideMenuTableViewCell.self)
    
    tableView.dataSource = self
    tableView.delegate = self
    
    let headerView = SideMenuHeaderView.instanceFromNib()
    tableView.tableHeaderView = headerView
  }
  
  func showAlertLogout() {
    let alert = UIAlertController(title: nil, message: "Are you sure want to log out?", preferredStyle: .alert)
    let yes = UIAlertAction(title: "Yes", style: .default) { (_) in
      UserManager.shared.logout()
    }
    let no = UIAlertAction(title: "No", style: .destructive, handler: nil)
    alert.addAction(yes)
    alert.addAction(no)
    
    alert.view.tintColor = .tw_blue
    
    present(alert, animated: true, completion: nil)
  }
}
