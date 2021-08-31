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
  let colorValue : String?
  let details : String?
  let tags : [String]?
}

struct Member {
   init(id: UUID, firstName: String, lastName: String, imageURL: URL?, email: String, summary: String?, createdAt: Date, colorValue: Int?, details: String?, tags: [String]) {
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
  
  init(response: MemberResponse) {
    self.id = response.id
    self.firstName = response.firstName
    self.lastName = response.lastName
    self.imageURL = response.imageURL
    self.email = response.email
    self.summary = response.summary
    guard let createdAtTI = TimeInterval(response.createdAt) else {
      fatalError()
    }
    
    self.createdAt = Date(timeIntervalSince1970: createdAtTI)
    self.colorValue = response.colorValue.map(Scanner.init).flatMap { scanner -> Double? in
      var value : Double = 0.0
      scanner.scanLocation = 1
      if scanner.scanHexDouble(&value) {
        return value
      } else {
        return nil
      }
    }.map{ Int($0) }
    //self.colorValue = response.colorValue
    self.details = response.details
    self.tags = response.tags ?? []
  }
  
  let id : UUID
  let firstName : String
  let lastName : String
  let imageURL : URL?
  let email : String
  let summary : String?
  let createdAt : Date
  let colorValue : Int?
  let details : String?
  let tags : [String]
}
