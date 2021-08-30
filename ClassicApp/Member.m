//
//  Member.m
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

#import "Member.h"

@implementation Member

-(id)initWithDictionary:(NSDictionary *)dictionary {
  _id = dictionary[@"id"];
  _firstName = dictionary[@"firstName"];
  _lastName = dictionary[@"lastName"];
  _imageURL = dictionary[@"imageURL"];
  _email = dictionary[@"email"];
  _summary = dictionary[@"summary"];
  NSString * createdAtString = dictionary[@"createdAt"];
  _createdAt = [NSDate dateWithTimeIntervalSince1970:[createdAtString doubleValue]];
  NSString * hexString = dictionary[@"colorValue"];
  if (hexString) {
    unsigned colorValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    if ([scanner scanHexInt:&colorValue]) {
      _colorValue = colorValue;
    }
  }
  _details = dictionary[@"details"];
  _tags = dictionary[@"tags"];
  self = [super init];
  return self;
}
@end
