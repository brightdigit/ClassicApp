//
//  Member.m
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Member.h"

@implementation Member

static NSUInteger parseColorValue(NSString *hexString) {
  if ([[NSNull null] isEqual:hexString]) {
    return 0;
  }
  if (hexString) {
    unsigned colorValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    if ([scanner scanHexInt:&colorValue]) {
      return colorValue;
    }
  }
  return 0;
}

-(id)initWithDictionary:(NSDictionary *)dictionary {
  NSString * createdAtString = dictionary[@"createdAt"];
  NSString * hexString = dictionary[@"color"];
  
  _id = dictionary[@"id"];
  _firstName = dictionary[@"firstName"];
  _lastName = dictionary[@"lastName"];
  _imageURL = dictionary[@"imageURL"];
  _email = dictionary[@"email"];
  _summary = dictionary[@"summary"];
  _createdAt = [NSDate dateWithTimeIntervalSince1970:[createdAtString doubleValue]];
  _colorValue = parseColorValue(hexString);
  _details = dictionary[@"details"];
  _tags = dictionary[@"tags"];
  
  self = [super init];
  return self;
}

+ (UIColor *)colorFromValue:(NSUInteger) value {
  return [UIColor colorWithRed:((CGFloat) ((value & 0xFF0000) >> 16))/255
                                            green:((CGFloat) ((value & 0xFF00) >> 8))/255
                                            blue:((CGFloat) (value & 0xFF))/255
                         alpha: 255.0];
}

-(UIColor *) uiColor {
  return [[self class] colorFromValue:self.colorValue];
}
@end
