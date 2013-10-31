//
//  TVGShow.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TVGShow : NSObject

@property (strong) NSString *imageURLString;
@property (strong) NSString *linkString;
@property (strong) NSString *name;
@property (strong) NSNumber *position;
@property (strong) NSString *provider;

@property (strong) NSString *info;
@property (strong) NSArray *crew;
@property (strong) NSArray *listings;

@end
