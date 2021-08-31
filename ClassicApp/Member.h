//
//  Member.h
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Member : NSObject
-(id _Nonnull )initWithDictionary: (NSDictionary * _Nonnull) dictionary;
@property (readonly, nonnull) NSUUID *id;
@property (readonly, nonnull) NSString *firstName;
@property (readonly, nonnull) NSString *lastName;
@property (readonly, nullable) NSURL *imageURL;
@property (readonly, nonnull) NSString *email;
@property (readonly, nullable) NSString *summary;
@property (readonly, nonnull) NSDate *createdAt;
@property (readonly) NSUInteger colorValue;
@property (readonly, nullable) NSString * details;
@property (readonly, nonnull) NSArray * tags;

@property (readonly, nonnull) UIColor * uiColor;
@end
