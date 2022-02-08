//
//  DeprecatedFacade.swift
//  DeprecatedFacade
//
//  Created by Leo Dion on 8/30/21.
//

import Foundation

@objcMembers
class DeprecatedRepository : NSObject {
  static let shared : DeprecatedRepository = DeprecatedRepository(
    wrapped: RepositoryImpl()
  )
  
  internal init(wrapped: Repository) {
    self.wrapped = wrapped
  }
  
  let wrapped : Repository
  
  func getMembers(_ completion: @escaping (
    [DeprecatedMember]?, Error?
  ) -> Void) {
    wrapped.getMembers { result in
      result.mapEach(DeprecatedMember.init).legacySink(completion)
    }
  }
}
