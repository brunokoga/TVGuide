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
                          NSDictionary *responseDictionary = responseObject;
                          TVGShow *show = [[TVGShow alloc] initWithShowInfoDictionary:responseDictionary];
                          completion(@[show]);
                      }
                      else
                      {
                          //TODO: Error handling
                          completion(nil);
                      }
    }];
}

@end
