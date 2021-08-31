//
//  Facade.h
//  Facade
//
//  Created by Leo Dion on 8/30/21.
//

#import <Foundation/Foundation.h>

@class Member;

@interface Facade : NSObject
+(Facade*_Nonnull)sharedObject;
-(void)getMembers:(void (^_Nonnull)(NSArray <Member*> * _Nullable  members,  NSError * _Nullable error))completion;
@end

