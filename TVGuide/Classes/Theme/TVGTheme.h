//
//  TVGTheme.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TVGTheme <NSObject>

- (UIFont *)fontWithSize:(CGFloat)pointSize;
- (UIColor *)color1; //red
- (UIColor *)color2; //blue
- (UIColor *)color3; //green
- (UIColor *)color4; //orange
- (UIColor *)color5; //white

@end
