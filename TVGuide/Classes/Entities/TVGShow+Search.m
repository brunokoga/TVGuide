//
//  TVGShow+Search.m
//  TVGuide
//
//  Created by Bruno Koga on 11/6/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGShow+Search.h"

@implementation TVGShow (Search)

- (instancetype)initWithSearchDictionary:(NSDictionary *)dictionary;
{
    self = [self init];
    if (self) {
        self.name = dictionary[@"name"];
        self.provider = dictionary[@"air"];
        self.linkString = dictionary[@"link"];
        self.imageURLString = dictionary[@"img"];
    }
    return self;

}

@end
