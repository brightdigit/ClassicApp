//
//  Facade.m
//  Facade
//
//  Created by Leo Dion on 8/30/21.
//

#import "Facade.h"
#import "Member.h"

static Facade *obj = nil;
@interface Facade ()

@property (nonatomic, retain) NSArray *allMembers;
@property (nonatomic, retain) NSArray *currentMembers;

@end

@implementation Facade
@synthesize allMembers;

+ (id)sharedObject
{
    if (obj == nil) obj = [[Facade alloc] init];
    return obj;
}

-(id)init {
  NSURL * url = [NSBundle.mainBundle URLForResource:@"data" withExtension:@"json"];
  NSData * data = [NSData dataWithContentsOfURL:url];
  NSArray * membersJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
  NSMutableArray * mutAllMembers = [NSMutableArray arrayWithCapacity:membersJSON.count];
  [membersJSON enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * stop) {
    [mutAllMembers addObject: [[Member alloc] initWithDictionary: obj]];
  }];
  self.allMembers = [NSArray arrayWithArray:mutAllMembers];
  
  int count = 20 + arc4random_uniform(10);
  int index = arc4random_uniform(1000 - count);
  self.currentMembers = [self.allMembers subarrayWithRange:NSMakeRange(index, count)];
  self = [super init];
  return self;
}

- (void)getMembers:(void (^)(NSArray *, NSError *))completion {
  NSTimeInterval delayInSeconds = (float)rand() / RAND_MAX * 5 + 3.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));

  dispatch_after(popTime, dispatch_get_main_queue(), ^{
    completion(self.currentMembers, nil);
  });
}
@end
