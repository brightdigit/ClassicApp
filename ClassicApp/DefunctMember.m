//
//  Member.m
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DefunctMember.h"

@implementation DefunctMember

static NSDictionary <NSString*, NSNumber*>  * _Nonnull  memberTags = nil;

static NSDictionary <NSString*, NSNumber*>  * _Nonnull  getMemberTags () {
  if (!memberTags) {    
    memberTags = @{
      @"Automotive" : [NSNumber numberWithInt: DefunctMemberTagAutomotive],
      @"Baby" : [NSNumber numberWithInt: DefunctMemberTagBaby],
      @"Beauty" : [NSNumber numberWithInt: DefunctMemberTagBeauty],
      @"Books" : [NSNumber numberWithInt: DefunctMemberTagBooks],
      @"Clothing" : [NSNumber numberWithInt: DefunctMemberTagClothing],
      @"Computers" : [NSNumber numberWithInt: DefunctMemberTagComputers],
      @"Electronics" : [NSNumber numberWithInt: DefunctMemberTagElectronics],
      @"Games" : [NSNumber numberWithInt: DefunctMemberTagGames],
      @"Garden" : [NSNumber numberWithInt: DefunctMemberTagGarden],
      @"Grocery" : [NSNumber numberWithInt: DefunctMemberTagGrocery],
      @"Health" : [NSNumber numberWithInt: DefunctMemberTagHealth],
      @"Home" : [NSNumber numberWithInt: DefunctMemberTagHome],
      @"Industrial" : [NSNumber numberWithInt: DefunctMemberTagIndustrial],
      @"Jewelry" : [NSNumber numberWithInt: DefunctMemberTagJewelry],
      @"Kids" : [NSNumber numberWithInt: DefunctMemberTagKids],
      @"Movies" : [NSNumber numberWithInt: DefunctMemberTagMovies],
      @"Music" : [NSNumber numberWithInt: DefunctMemberTagMusic],
      @"Outdoors" : [NSNumber numberWithInt: DefunctMemberTagOutdoors],
      @"Shoes" : [NSNumber numberWithInt: DefunctMemberTagShoes],
      @"Sports" : [NSNumber numberWithInt: DefunctMemberTagSports],
      @"Tools" : [NSNumber numberWithInt: DefunctMemberTagTools],
      @"Toys" : [NSNumber numberWithInt: DefunctMemberTagToys]
    };
  }
  
  return memberTags;
}

static NSUInteger parseColorValue(NSString * _Nullable hexString) {
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
  _createdAt = [NSDate dateWithTimeIntervalSince1970:[createdAtString doubleValue] / 1000];
  _colorValue = parseColorValue(hexString);

  _details = dictionary[@"details"];
  _tags = [DefunctMember tagsFromStrings: dictionary[@"tags"]];

  self = [super init];
  return self;
}

+ (UIColor * _Nonnull)colorFromValue:(NSUInteger) value {
  return [UIColor colorWithRed:((CGFloat) ((value & 0xFF0000) >> 16))/255
                                            green:((CGFloat) ((value & 0xFF00) >> 8))/255
                                            blue:((CGFloat) (value & 0xFF))/255
                         alpha: 255.0];
}

-(UIColor * _Nonnull) uiColor {
  return [[self class] colorFromValue:self.colorValue];
}


+(DefunctMemberTags) tagsFromStrings: (NSArray <NSString*>  * _Nonnull ) tags {
  __block DefunctMemberTags current = 0;
  
  if ([[NSNull null] isEqual:tags]) {
    return current;
  }
  
  if (tags) {
    NSDictionary * memberTags = getMemberTags();
    [tags enumerateObjectsUsingBlock:^(NSString * _Nonnull tag, NSUInteger idx, BOOL * _Nonnull stop) {
      NSNumber * value = memberTags[tag];
      if (value) {
        current |= value.intValue;
      }
    }];
  }
  
  return current;
}
@end
