//
//  NSNull+SafeString.h
//  TVGuide
//
//  Created by Bruno Koga on 11/10/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (SafeString)

- (NSString *)uppercaseString;
- (NSInteger)length;
@end
