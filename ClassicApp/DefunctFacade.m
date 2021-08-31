//
//  Facade.m
//  Facade
//
//  Created by Leo Dion on 8/30/21.
//

#import "DefunctFacade.h"
#import "DefunctMember.h"

static DefunctFacade * _Nonnull obj = nil;

@interface DefunctFacade ()

@property (nonatomic, retain, nonnull) NSArray *currentMembers;

@end

@implementation DefunctFacade

static NSArray <DefunctMember *> * _Nonnull allMembers = nil;

+ (id)sharedObject
{
    if (obj == nil) obj = [[DefunctFacade alloc] init];
    return obj;
}

static NSArray <DefunctMember *> * _Nonnull parseAllMembers() {
  NSURL * url = [NSBundle.mainBundle URLForResource:@"data" withExtension:@"json"];
  NSData * data = [NSData dataWithContentsOfURL:url];
  NSArray * membersJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
  NSMutableArray * mutAllMembers = [NSMutableArray arrayWithCapacity:membersJSON.count];
  [membersJSON enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * stop) {
    [mutAllMembers addObject: [[DefunctMember alloc] initWithDictionary: obj]];
  }];
  return [NSArray arrayWithArray:mutAllMembers];
}

static NSArray <DefunctMember *> * _Nonnull extractRandomMembers(NSArray * _Nonnull allMembers) {
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

- (void)getMembers:(void (^)(NSArray<DefunctMember *> * _Nullable, NSError * _Nullable))completion {
  NSTimeInterval delayInSeconds = (float)rand() / RAND_MAX * 5 + 3.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));

  dispatch_after(popTime, dispatch_get_main_queue(), ^{
    completion(self.currentMembers, nil);
  });
}
@end
