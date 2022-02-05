//
//  Member.h
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Member : NSObject
-(id)initWithDictionary: (NSDictionary *) dictionary;
@property (readonly) NSUUID *id;
@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) NSURL *imageURL;
@property (readonly) NSString *email;
@property (readonly) NSString *summary;
@property (readonly) NSDate *createdAt;
@property (readonly) NSUInteger colorValue;
@property (readonly) NSString * details;
@property (readonly) NSArray * tags;

@property (readonly) UIColor * uiColor;
@end
