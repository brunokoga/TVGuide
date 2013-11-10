//
//  TVGShow.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TVGShow : NSObject

@property (strong, nonatomic) NSString *imageURLString;
@property (strong, nonatomic) NSString *linkString;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *position;
@property (strong, nonatomic) NSString *provider;

@property (strong, nonatomic) NSString *info;
@property (strong, nonatomic) NSArray *crew;
@property (strong, nonatomic) NSArray *listings;
@property (strong, nonatomic) NSString *air;

@end
