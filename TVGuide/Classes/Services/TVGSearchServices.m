//
//  TVGSearchServices.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGSearchServices.h"
#import "TVGShow+Search.h"

@implementation TVGSearchServices

+ (void)searchWithSearchTerm:(NSString *)searchTerm
           completionHandler:(TVGServiceArrayResponse)completion
{
    TVGHTTPRequestOperationManager *manager = [TVGHTTPRequestOperationManager sharedManager];
    [manager searchShowsWithSearchTerm:searchTerm
                  completion:^(NSError *error, id responseObject) {
                      if (error == nil)
                      {
                          NSArray *responseArray = [[ARSafeJSON new] cleanUpJson:responseObject];
                          NSMutableArray *results = [NSMutableArray new];
                          for (NSDictionary *dictionary in responseArray)
                          {
                              TVGShow *show = [[TVGShow alloc] initWithSearchDictionary:dictionary];
                              [results addObject:show];
                          }
                          completion([results copy]);
                      }
                      else
                      {
                          //TODO: Error handling
                          completion(nil);
                      }
                  }];
}
@end
