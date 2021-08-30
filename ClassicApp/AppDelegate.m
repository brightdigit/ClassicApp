//
//  AppDelegate.m
//  ClassicApp
//
//  Created by Leo Dion on 8/30/21.
//

#import "AppDelegate.h"
#import "TableViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  TableViewController * viewController = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
       UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
       //navController.navigationBarHidden = YES;

       self.window.rootViewController = navController;
       [self.window makeKeyAndVisible];
  return YES;
}


@end
