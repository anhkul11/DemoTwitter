//
//  NewPostViewController.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/8/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import RxSwift
import RxCocoa

class NewPostViewController: BaseViewController {
  
  /// instantiate
  internal static func instantiate() -> NewPostViewController {
    return Storyboard.NewFeed.instantiate(type: NewPostViewController.self)
  }
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var placeHolderLabel: UILabel!
  
  var userModel: UserModel? = Defaults[.user]
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    bindingRx()
  }
  
  func setupUI() {
    imageView.layer.cornerRadius = imageView.bounds.height/2
    textView.becomeFirstResponder()
    textView.font = UIFont.systemFont(ofSize: 16)
    setupNavigation()
  }
  
  func bindingRx() {
    textView.rx.text.orEmpty.subscribe(onNext: { [unowned self] (value) in
      self.placeHolderLabel.isHidden = !value.isEmpty
    }).disposed(by: disposeBag)
  }
  
  func setupNavigation() {
    leftNavigationButton = .close
    let tweetButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    tweetButton.setTitle("Tweet", for: .normal)
    tweetButton.backgroundColor = .tw_blue
    tweetButton.setTitleColor(.white, for: .normal)
    tweetButton.addTarget(self, action: #selector(postNewTweet), for: .touchUpInside)
    tweetButton.layer.cornerRadius = 10
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: tweetButton)
  }
  
  @objc func postNewTweet() {
    let text = textView.text ?? ""
    do {
      let messages = try splitMessage(string: text, maxLenght: 50)
      for message in messages {
        let postModel = PostModel(userModel: userModel, message: message)
        FirebaseManager.shared.addPost(postModel: postModel)
      }
    } catch {
      print(error.localizedDescription)
      showPopUp(error: error)
      return
    }
    self.dismiss(animated: true, completion: nil)
  }
  
  func showPopUp(error: Error) {
    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okAction)
    alert.view.tintColor = .tw_blue
    present(alert, animated: true, completion: nil)
  }
}
