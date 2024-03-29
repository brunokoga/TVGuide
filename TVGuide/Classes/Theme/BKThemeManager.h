//
//  BKThemeManager.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVGTheme.h"
/**
 *  This class is responsible for returning the
 *  correct instantiated theme.
 */

@interface BKThemeManager : NSObject

+ (id<TVGTheme>)theme;
+ (void)setTheme:(id<TVGTheme>)theme;

@end
