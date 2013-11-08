//
//  TVGBasicTheme.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGBasicTheme.h"

@implementation TVGBasicTheme

static NSString * const kBasicThemeFontName = @"PunkRockShow";

- (void)setupTheme
{
    UIColor *whiteColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTintColor:whiteColor];
    [[UIBarButtonItem appearance] setTintColor:whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : whiteColor,
                                                           NSFontAttributeName : [self fontWithSize:22.0]}];
}

- (UIFont *)fontWithSize:(CGFloat)pointSize
{
    return [UIFont fontWithName:kBasicThemeFontName size:pointSize];
}

- (UIColor *)color1
{
   UIColor *color = [UIColor colorWithRed:240.0/255.0
                                    green:69.0/255.0
                                     blue:70.0/255.0
                                    alpha:1.0];
    return color;
}

- (UIColor *)color2
{
   UIColor *color = [UIColor colorWithRed:66.0/255.0
                                    green:173.0/255.0
                                     blue:240.0/255.0
                                    alpha:1.0];
    return color;
}

- (UIColor *)color3
{
   UIColor *color = [UIColor colorWithRed:125.0/255.0
                                    green:195.0/255.0
                                     blue:53.0/255.0
                                    alpha:1.0];
    return color;
}

- (UIColor *)color4
{
   UIColor *color = [UIColor colorWithRed:244.0/255.0
                                    green:145.0/255.0
                                     blue:50.0/255.0
                                    alpha:1.0];
    return color;
}

- (UIColor *)color5
{
    return [UIColor whiteColor];
}
@end
