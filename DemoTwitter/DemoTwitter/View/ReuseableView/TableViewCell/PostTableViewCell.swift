//
//  PostTableViewCell.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class PostTableViewCell: UITableViewCell {
  
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var detailView: UIView!
  @IBOutlet weak var nickNameLabel: UILabel!
  @IBOutlet weak var accountLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var moreButton: UIButton!
  @IBOutlet weak var commentButton: UIButton!
  @IBOutlet weak var retweetButton: UIButton!
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var sharedButton: UIButton!
  
  var isLiked: BehaviorSubject<Bool> = BehaviorSubject(value: false)
  let disposeBag = DisposeBag()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    setupUI()
    bindingRx()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func setupUI() {
    avatarImageView.layer.cornerRadius = avatarImageView.bounds.height/2
    avatarImageView.image = UIImage(named: "img_avatar")
    avatarImageView.contentMode = .scaleAspectFit
    
    nickNameLabel.textColor = .black
    accountLabel.textColor = .lightGray
    timeLabel.textColor = .lightGray
    
    moreButton.contentHorizontalAlignment = .right
    
    commentButton.contentHorizontalAlignment = .left
    commentButton.imageView?.contentMode = .scaleAspectFit
    
    retweetButton.contentHorizontalAlignment = .left
    retweetButton.imageView?.contentMode = .scaleAspectFit
    
    likeButton.contentHorizontalAlignment = .left
    likeButton.imageView?.contentMode = .scaleAspectFit
    
    sharedButton.contentHorizontalAlignment = .left
    sharedButton.imageView?.contentMode = .scaleAspectFit
  }
  
  func bindingRx() {
    likeButton.rx.tap.subscribe(onNext: { [weak self] (_) in
      let value = try? self?.isLiked.value()
      if let isLike = value {
        self?.isLiked.onNext(!isLike)
      }
    }).disposed(by: disposeBag)
    
    isLiked.subscribe(onNext: { [weak self] (isLiked) in
      if isLiked {
        self?.likeButton.setImage(UIImage(named: "ic_heart_red"), for: .normal)
      } else {
        self?.likeButton.setImage(UIImage(named: "ic_heart"), for: .normal)
      }
    }).disposed(by: disposeBag)
  }
}
