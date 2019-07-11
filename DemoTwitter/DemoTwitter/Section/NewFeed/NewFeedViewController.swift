//
//  NewFeedViewController
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import Firebase

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
    bindingRx()
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
    let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 0))
    tableView.tableFooterView = footerView
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  func bindingRx() {
    FirebaseManager.shared.postRef.queryOrderedByKey().observe(.value) { (snapShot) in
      var newPosts: [PostModel] = []
      for child in snapShot.children {
        if let snapshot = child as? DataSnapshot,
          let newPost = PostModel(snapshot: snapshot) {
          newPosts.append(newPost)
        }
      }
      
      self.posts = newPosts.reversed()
      self.tableView.reloadData()
    }
  }
}
