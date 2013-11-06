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
    return [UIColor redColor];
}

- (UIColor *)color2
{
    return [UIColor blueColor];
}

- (UIColor *)color3
{
    return [UIColor greenColor];
}

- (UIColor *)color4
{
    return [UIColor orangeColor];
}

- (UIColor *)color5
{
    return [UIColor whiteColor];
}
@end
