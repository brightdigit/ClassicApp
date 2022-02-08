//
//  Facade.swift
//  Facade
//
//  Created by Leo Dion on 8/30/21.
//

import Foundation
import UIKit

protocol Repository {
  func getMembers (
    _ completion: @escaping (
      Result<[Member], Error>
    ) -> Void)
}
class RepositoryImpl : Repository {
  let allMembers : [Member]
  let currentMembers : [Member]
  
  init() {
    let decoder = JSONDecoder()
    guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
      fatalError()
    }
    let data = try! Data(contentsOf: url)
    let memberResponses = try! decoder.decode([MemberResponse].self, from: data)
    
    self.allMembers = memberResponses.map(Member.init)
    let count = Int.random(in: 20...30)
    self.currentMembers = Array(self.allMembers.shuffled().prefix(count))
  }
  
  func getMembers(_ completion: @escaping (Result<[Member], Error>) -> Void) {
    let time = DispatchTime.now() + 5
    DispatchQueue.main.asyncAfter(deadline: time) {
      completion(.success(
        self.currentMembers))
    }
  }
}
