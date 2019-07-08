//
//  StoryBoard.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/7/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation
import UIKit

public enum Storyboard: String {
  case Main
  case Login
  case NewFeed
  case Search
  case Notification
  case Message
  case SideMenu
  
  public func instantiate<VC: UIViewController>(type: VC.Type) -> VC {
    var storyboardId = ""
    
    let components = "\(type)".components(separatedBy: ".")
    
    if !components.isEmpty {
      storyboardId = components[0]
    }
    
    let storyboad = UIStoryboard(name: self.rawValue, bundle: nil)
    let controller = storyboad.instantiateViewController(withIdentifier: storyboardId) as! VC
    
    return controller
  }
}
