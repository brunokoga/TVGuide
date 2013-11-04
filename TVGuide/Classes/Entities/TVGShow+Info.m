//
//  TVGShow+Info.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGShow+Info.h"

@implementation TVGShow (Info)

- (instancetype)initWithShowInfoDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if (self) {
        self.info = dictionary[@"info"];
        self.listings = dictionary[@"listings"];
        self.crew = dictionary[@"crew"];
        
    }
    return self;
    
}

@end

