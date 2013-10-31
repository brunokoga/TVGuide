//
//  BKThemeManager.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "BKThemeManager.h"
#import "TVGBasicTheme.h"


@interface BKThemeManager ()

@property (nonatomic, strong) id<TVGTheme> theme;

@end

@implementation BKThemeManager

+ (BKThemeManager *)sharedInstance
{
    static dispatch_once_t once;
    static BKThemeManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.theme = [TVGBasicTheme new];
    });
    return sharedInstance;
}

+ (id<TVGTheme>)theme
{
    return [self sharedInstance].theme;
}

+ (void)setTheme:(id<TVGTheme>)theme
{
    [self sharedInstance].theme = theme;
}

@end
