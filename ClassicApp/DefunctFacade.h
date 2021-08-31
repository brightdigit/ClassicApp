//
//  Facade.h
//  Facade
//
//  Created by Leo Dion on 8/30/21.
//

#import <Foundation/Foundation.h>

@class DefunctMember;

@interface DefunctFacade : NSObject
+(DefunctFacade*_Nonnull)sharedObject;
-(void)getMembers:(void (^_Nonnull)(NSArray <DefunctMember*> * _Nullable  members,  NSError * _Nullable error))completion;
@end

