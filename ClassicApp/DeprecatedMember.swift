//
//  DeprecatedMember.swift
//  DeprecatedMember
//
//  Created by Leo Dion on 8/30/21.
//

import Foundation
import UIKit

@objcMembers
class DeprecatedMember : NSObject {
  internal init(wrapped: Member) {
    self.wrapped = wrapped
  }
  
  let wrapped : Member
  
  var id : UUID {
    return wrapped.id
  }
  
  var firstName : String {
    return wrapped.firstName
  }
  
  var lastName : String {
    return wrapped.lastName
  }
  
  var imageURL : URL? {
    return wrapped.imageURL
  }
  
  var email : String {
    return wrapped.email
  }
  
  var summary : String? {
    return wrapped.summary
  }
  
  var createdAt : Date {
    return wrapped.createdAt
  }
  
  var colorValue : NSNumber? {
    return wrapped.colorValue.map(NSNumber.init)
  }
  
  var details : String? {
    return wrapped.details
  }
  
  var tags : [String] {
    return wrapped.tags.map{ $0.rawValue }
  }
  
  var uiColor : UIColor? {
    return wrapped.uiColor
  }
}
