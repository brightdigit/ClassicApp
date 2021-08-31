//
//  TableViewController.m
//  TableViewController
//
//  Created by Leo Dion on 8/30/21.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "DefunctFacade.h"
#import "DefunctMember.h"

@interface TableViewController ()
@property (nonatomic, retain, nullable) NSArray <DefunctMember*> *members;
@property (nonatomic, retain, nullable) NSError *error;
@end

@implementation TableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  UINib * nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
  [self.tableView registerNib:nib forCellReuseIdentifier:@"reuseIdentifier"];
  
  __weak TableViewController *weakSelf = self;
  [[DefunctFacade sharedObject] getMembers:^(NSArray *members, NSError *error) {
    weakSelf.members = members;
    weakSelf.error = error;
    [weakSelf.tableView reloadData];
  }];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  return self.members.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
 
  DefunctMember * member = [self.members objectAtIndex:indexPath.row];
  
  if (member && cell) {
    cell.nameLabel.text = member.firstName;
    cell.nameLabel.textColor = member.uiColor;

    NSLog(@"%@", member.id);
    NSLog(@"%@", member.firstName);
    NSLog(@"%@", member.lastName);
    NSLog(@"%@", member.imageURL);
    NSLog(@"%@", member.email);
    NSLog(@"%@", member.summary);
    NSLog(@"%@", member.createdAt);
    NSLog(@"%lu", (unsigned long)member.colorValue);
    NSLog(@"%@", member.details);
    NSLog(@"%ld", (long)member.tags);
  }
  
  return cell;
}

@end
