//
//  TVGAppDelegate.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGAppDelegate.h"
#import "BKThemeManager.h"
@implementation TVGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[BKThemeManager theme] setupTheme];
    return YES;
}

@end
