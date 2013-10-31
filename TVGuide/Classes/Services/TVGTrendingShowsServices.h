//
//  TVGTrendingShowsServices.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVGServices.h"

@interface TVGTrendingShowsServices : TVGServices

+ (void)trendingShowsWithCompletionHandler:(TVGServiceArrayResponse)completion;

@end
