//
//  TVGShow+Trending.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGShow+Trending.h"

@implementation TVGShow (Trending)

- (instancetype)initWithTrendingDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.position = dictionary[@"num"];
        self.provider = dictionary[@"air"];
        self.imageURLString = dictionary[@"img"];
        self.linkString = dictionary[@"lnk"];
    }
    return self;
    
}
@end
