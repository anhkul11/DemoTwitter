//
//  NewFeedViewController
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit

class NewFeedViewController: BaseViewController {
  
  /// instantiate
  internal static func instantiate() -> NewFeedViewController {
    return Storyboard.NewFeed.instantiate(type: NewFeedViewController.self)
  }
  
  @IBOutlet weak var tableView: UITableView!
  
  var posts: [PostModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  func setupUI() {
    self.title = "Home"
    self.leftNavigationButton = .avatar
    self.rightNavigationButton = .setting
    
    setupTableView()
  }
  
  func setupTableView() {
    tableView.separatorStyle = .singleLine
    tableView.registerCellNibForClass(PostTableViewCell.self)
    
    tableView.dataSource = self
    tableView.delegate = self
  }
}
