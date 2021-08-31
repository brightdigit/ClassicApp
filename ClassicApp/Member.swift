//
//  Member.swift
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

import Foundation

struct Member {
  let id : UUID
  let firstName : String
  let lastName : String
  let imageURL : URL?
  let email : String
  let summary : String?

  let createdAt : Date
  let colorValue : Int?
  let details : String?
  let tags : Set<Tag>
  
   init(id: UUID, firstName: String, lastName: String, imageURL: URL?, email: String, summary: String?, createdAt: Date, colorValue: Int?, details: String?, tags: Set<Tag>) {
    self.id = id
    self.firstName = firstName
    self.lastName = lastName
    self.imageURL = imageURL
    self.email = email
    self.summary = summary
    self.createdAt = createdAt
    self.colorValue = colorValue
    self.details = details
    self.tags = tags
  }

}
