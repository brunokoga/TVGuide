//
//  TVGShowInfoServices.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGShowInfoServices.h"
#import "TVGShow+Info.h"

@implementation TVGShowInfoServices

+ (void)showInfoWithName:(NSString *)showName
       completionHandler:(TVGServiceArrayResponse)completion;
{
    TVGHTTPRequestOperationManager *manager = [TVGHTTPRequestOperationManager sharedManager];
    [manager showInfoForShow:showName
                  completion:^(NSError *error, id responseObject) {
                      if (error == nil)
                      {
                          NSMutableArray *shows = [NSMutableArray new];
                          NSArray *responseArray = responseObject;
                          for (NSDictionary *dictionary in responseArray)
                          {
                              TVGShow *show = [[TVGShow alloc] initWithShowInfoDictionary:dictionary];
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
