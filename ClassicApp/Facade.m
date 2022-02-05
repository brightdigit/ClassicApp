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

@property (nonatomic, retain) NSArray *currentMembers;

@end

@implementation Facade

static NSArray * allMembers = nil;

+ (id)sharedObject
{
    if (obj == nil) obj = [[Facade alloc] init];
    return obj;
}

static NSArray *parseAllMembers() {
  NSURL * url = [NSBundle.mainBundle URLForResource:@"data" withExtension:@"json"];
  NSData * data = [NSData dataWithContentsOfURL:url];
  NSArray * membersJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
  NSMutableArray * mutAllMembers = [NSMutableArray arrayWithCapacity:membersJSON.count];
  [membersJSON enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * stop) {
    [mutAllMembers addObject: [[Member alloc] initWithDictionary: obj]];
  }];
  return [NSArray arrayWithArray:mutAllMembers];
}

static NSArray *extractRandomMembers(NSArray *allMembers) {
  int count = 20 + arc4random_uniform(10);
  int index = arc4random_uniform(1000 - count);
  return [allMembers subarrayWithRange:NSMakeRange(index, count)];
}

-(id)init {
  if (allMembers == nil) {
    allMembers = parseAllMembers();
  }
  
  self.currentMembers = extractRandomMembers(allMembers);
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
