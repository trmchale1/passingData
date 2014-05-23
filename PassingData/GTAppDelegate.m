//
//  GTAppDelegate.m
//  PassingData
//
//  Created by Tim McHale on 5/22/14.
//  Copyright (c) 2014 Gramercy Consultants. All rights reserved.
//

#import "GTAppDelegate.h"
#import "FirstViewController.h"
@implementation GTAppDelegate
@synthesize navigationController, firstController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.navigationController = [[UINavigationController alloc] init];
    [self.window addSubview:[self.navigationController view]];
    
    if(self.firstController == nil);
    {
        FirstViewController *firstView = [[FirstViewController alloc] init];
        self.firstController = firstView;
    }
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
