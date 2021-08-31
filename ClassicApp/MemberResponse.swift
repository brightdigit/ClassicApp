//
//  Member.swift
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

import Foundation

struct MemberResponse : Codable {
  let id : UUID
  let firstName : String
  let lastName : String
  let imageURL : URL?
  let email : String
  let summary : String?
  let createdAt : String
  let color : String?
  let details : String?
  let tags : [String]?
}
