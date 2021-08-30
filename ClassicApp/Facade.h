//
//  Facade.h
//  Facade
//
//  Created by Leo Dion on 8/30/21.
//

#import <Foundation/Foundation.h>


@interface Facade : NSObject
+(Facade*)sharedObject;
-(void)getMembers:(void (^)(NSArray * members, NSError *error))completion;
@end

