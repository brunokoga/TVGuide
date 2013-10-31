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
