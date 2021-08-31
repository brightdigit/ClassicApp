//
//  DeprecatedMember.swift
//  DeprecatedMember
//
//  Created by Leo Dion on 8/30/21.
//

import Foundation

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
                var colorValue : Int? {
                  return wrapped.colorValue
                }
                  var details : String? {
                    return wrapped.details
                  }
                    var tags : [String] {
                      return wrapped.tags
                    }
}
