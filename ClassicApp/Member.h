//
//  Member.h
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, DefunctMemberTags) {
  DefunctMemberTagAutomotive = 1 << 0,
  DefunctMemberTagBaby = 1 << 1,
  DefunctMemberTagBeauty = 1 << 2,
  DefunctMemberTagBooks = 1 << 3,
  DefunctMemberTagClothing = 1 << 4,
  DefunctMemberTagComputers = 1 << 5,
  DefunctMemberTagElectronics = 1 << 6,
  DefunctMemberTagGames = 1 << 7,
  DefunctMemberTagGarden = 1 << 8,
  DefunctMemberTagGrocery = 1 << 9,
  DefunctMemberTagHealth = 1 << 10,
  DefunctMemberTagHome = 1 << 11,
  DefunctMemberTagIndustrial = 1 << 12,
  DefunctMemberTagJewelry = 1 << 13,
  DefunctMemberTagKids = 1 << 14,
  DefunctMemberTagMovies = 1 << 15,
  DefunctMemberTagMusic = 1 << 16,
  DefunctMemberTagOutdoors = 1 << 17,
  DefunctMemberTagShoes = 1 << 18,
  DefunctMemberTagSports = 1 << 19,
  DefunctMemberTagTools = 1 << 20,
  DefunctMemberTagToys = 1 << 21
};

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
@property (readonly) UIColor * uiColor;
@property (readonly) DefunctMemberTags tags;
@end
