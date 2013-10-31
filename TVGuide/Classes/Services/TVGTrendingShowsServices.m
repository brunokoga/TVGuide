//
//  TVGTrendingShowsServices.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGTrendingShowsServices.h"
#import "TVGShow+Trending.h"

@implementation TVGTrendingShowsServices

+ (void)trendingShowsWithCompletionHandler:(TVGServiceArrayResponse)completion
{
    TVGHTTPRequestOperationManager *manager = [TVGHTTPRequestOperationManager sharedManager];
    [manager showTrendsWithCompletion:^(NSError *error, id responseObject) {
        if (error == nil)
        {
            NSMutableArray *shows = [NSMutableArray new];
            NSArray *responseArray = responseObject;
            for (NSDictionary *dictionary in responseArray)
            {
                TVGShow *show = [[TVGShow alloc] initWithTrendingDictionary:dictionary];
                [shows addObject:show];
            }
            completion([shows copy]);
        }
        else
        {
            //TODO: Error handling
            completion(nil);
        }
    }];
    
    
}

@end
