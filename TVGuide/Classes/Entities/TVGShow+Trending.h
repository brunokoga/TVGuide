//
//  TVGShow+Trending.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGShow.h"
/**
 *  Category that allows creating a TVGShow
 *  from a NSDictionary (returned from the API)
 */

@interface TVGShow (Trending)

- (instancetype)initWithTrendingDictionary:(NSDictionary *)dictionary;

@end
