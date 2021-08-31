//
//  DeprecatedFacade.swift
//  DeprecatedFacade
//
//  Created by Leo Dion on 8/30/21.
//

import Foundation

extension Result {
  func mapEach<ElementType, NewElementType> (_ completion: @escaping (ElementType) -> (NewElementType)) -> Result<[NewElementType],Failure> where Success == [ElementType] {
    self.map{
      $0.map(completion)
    }
  }
  func legacySink (_ completion: (Success?, Failure?) -> Void) {
    let success: Success?
    let failure: Failure?
    switch self {
    case .success(let _success):
      success = _success
      failure = nil
    case .failure(let _failure):
      success = nil
      failure = _failure
    }
    completion(success, failure)
  }
}

@objcMembers
class DeprecatedRepository : NSObject {
  static let shared : DeprecatedRepository = DeprecatedRepository(wrapped: RepositoryImpl())
  internal init(wrapped: Repository) {
    self.wrapped = wrapped
  }
  
  let wrapped : Repository
  
  func getMembers(_ completion: @escaping ([DeprecatedMember]?, Error?) -> Void) {
    wrapped.getMembers { result in
      result.mapEach(DeprecatedMember.init).legacySink(completion)
    }
  }
}
