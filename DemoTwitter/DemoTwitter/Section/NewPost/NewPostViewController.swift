//
//  NewPostViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/8/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class NewPostViewController: BaseViewController {
  
  /// instantiate
  internal static func instantiate() -> NewPostViewController {
    return Storyboard.NewFeed.instantiate(type: NewPostViewController.self)
  }
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textField: UITextField!
  
  var userModel: UserModel? = Defaults[.user]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
  func setupUI() {
    imageView.layer.cornerRadius = imageView.bounds.height/2
    textField.becomeFirstResponder()
    textField.font = UIFont.systemFont(ofSize: 16)
    setupNavigation()
  }
  
  func setupNavigation() {
    leftNavigationButton = .close
    let tweetButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
    tweetButton.setTitle("Tweet", for: .normal)
    tweetButton.backgroundColor = .tw_blue
    tweetButton.setTitleColor(.white, for: .normal)
    tweetButton.addTarget(self, action: #selector(postNewTweet), for: .touchUpInside)
    tweetButton.layer.cornerRadius = 10
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: tweetButton)
  }
  
  @objc func postNewTweet() {
    let postModel = PostModel(userModel: userModel, message: textField.text ?? "")
    FirebaseManager.shared.addPost(postModel: postModel)
    self.dismiss(animated: true, completion: nil)
  }
}
