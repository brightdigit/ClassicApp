//
//  TableViewController.m
//  TableViewController
//
//  Created by Leo Dion on 8/30/21.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "Facade.h"
#import "Member.h"

@interface TableViewController ()
@property (nonatomic, retain) NSArray *members;
@property (nonatomic, retain) NSError *error;
@end

@implementation TableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  UINib * nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
  [self.tableView registerNib:nib forCellReuseIdentifier:@"reuseIdentifier"];
  
  __weak TableViewController *weakSelf = self;
  [[Facade sharedObject] getMembers:^(NSArray *members, NSError *error) {
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
  
  Member * member = [self.members objectAtIndex:indexPath.row];
  
  if (member) {
    // Configure the cell...
    cell.nameLabel.text = member.firstName;
    
    cell.nameLabel.textColor =  [UIColor colorWithRed:((CGFloat) ((member.colorValue & 0xFF0000) >> 16))/255
                                                green:((CGFloat) ((member.colorValue & 0xFF00) >> 8))/255
                                                blue:((CGFloat) (member.colorValue & 0xFF))/255
                                                alpha: 255.0];
  }
  
  return cell;
}

@end
