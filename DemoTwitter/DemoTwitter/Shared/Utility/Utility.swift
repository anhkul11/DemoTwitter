//
//  Utility.swift
//  DemoTwitter
//
//  Created by Anh Lê on 7/5/19.
//  Copyright © 2019 Anh Lê. All rights reserved.
//

import Foundation

enum SplitError: Error {
  case invalidInput(String)
}

/// Calculated how many part that string can separated to and how many character to display
func calculatePartIndicator(number: Int, divideBy: Int) throws -> (Int, Int) {
  if divideBy <= 0 || number < 0 {
    throw SplitError.invalidInput("Wrong input")
  }
  let parts = number % divideBy > 0 ? number / divideBy + 1 : number / divideBy
  let totalChacracters = "\(parts)/\(parts) ".count
  return (parts,totalChacracters)
}

/// Split mess
func splitMessage(string: String, maxLenght: Int) throws -> [String] {
  // Split to words
  let splits = string.split { (character) -> Bool in
    character == " " || character == "\n"
  }
  
  // Validate message
  if string.count <= maxLenght {
    return [string]
  }
  if splits.contains(where: { (value) -> Bool in
    return value.count >= maxLenght
  }) {
    throw SplitError.invalidInput("Wrong input")
  }
  
  // Calculate how many parts we need to divide
  let (parts, characters) = try calculatePartIndicator(number: string.count, divideBy: maxLenght)
  if characters >= maxLenght {
    throw SplitError.invalidInput("Wrong input")
  }
  
  // Start split message
  var results: [String] = []
  var prefix: String {
    return "\(results.count + 1)/\(parts) "
  }
  var temp = prefix
  for (index,value) in splits.enumerated() {
    if temp.count + value.count <= maxLenght {
      temp += "\(value) "
    } else {
      temp.removeLast() // Remove last white space
      results.append(temp)
      temp = "\(prefix)\(value) "
    }
    if index + 1 == splits.count {
      temp.removeLast() // Remove last white space
      results.append(temp)
    }
  }
  return results
}
