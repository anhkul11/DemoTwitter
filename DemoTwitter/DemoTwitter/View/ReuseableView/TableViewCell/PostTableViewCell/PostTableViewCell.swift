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
import Lottie

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
    nickNameLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
    
    accountLabel.textColor = .lightGray
    accountLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    
    timeLabel.textColor = .lightGray
    timeLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)

    messageLabel.numberOfLines = 0
    
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
        self?.playAnimation()
      } else {
        self?.likeButton.setImage(UIImage(named: "ic_heart"), for: .normal)
      }
    }).disposed(by: disposeBag)
  }
  
  func configure(postModel: PostModel) {
    self.nickNameLabel.text = postModel.nickName
    self.accountLabel.text = postModel.account
    self.timeLabel.text = postModel.dateTime.prefix(10).lowercased()
    self.messageLabel.text = postModel.message
  }
  
  func playAnimation() {
    guard let imageFrame = self.likeButton.imageView?.frame else {
      return
    }
    let lottie = AnimationView(name: "heart_animation")
    lottie.frame = CGRect(x: -imageFrame.width/2, y: -imageFrame.height/2, width: imageFrame.width*2, height: imageFrame.height*2)
    likeButton.addSubview(lottie)
    likeButton.bringSubviewToFront(lottie)
    lottie.play(fromProgress: 0, toProgress: 0.5, loopMode: nil) { [weak self] (isFinish) in
      lottie.removeFromSuperview()
      if isFinish {
        self?.likeButton.setImage(UIImage(named: "ic_heart_red"), for: .normal)
      }
    }
  }
}
