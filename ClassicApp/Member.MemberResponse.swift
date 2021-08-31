//
//  Member.swift
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

import Foundation

extension Member {
  init(response: MemberResponse) {
    let id = response.id
    let firstName = response.firstName
    let lastName = response.lastName
    let imageURL = response.imageURL
    let email = response.email
    let summary = response.summary
    guard let createdAtTI = TimeInterval(response.createdAt) else {
      fatalError()
    }
    
    let createdAt = Date(timeIntervalSince1970: createdAtTI / 1000.0)
    let colorValue = response.color
      .map{$0.suffix(6)}
      .map(String.init)
      .flatMap{Int.init($0, radix: 16)}
      .map{ Int($0) }
    let details = response.details
    let tags = response.tags.map{$0.compactMap(Tag.init)}.map(Set.init) ?? Set()
    
    self.init(
      id: id, firstName: firstName, lastName: lastName,
      imageURL: imageURL, email: email, summary: summary,
      createdAt: createdAt, colorValue: colorValue, details: details,
      tags: tags
    )
  }
}
