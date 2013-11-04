//
//  TVGSearchServices.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGSearchServices.h"

@implementation TVGSearchServices

+ (void)searchWithSearchTerm:(NSString *)searchTerm
           completionHandler:(TVGServiceArrayResponse)completion
{
    TVGHTTPRequestOperationManager *manager = [TVGHTTPRequestOperationManager sharedManager];
    [manager searchShowsWithSearchTerm:searchTerm
                  completion:^(NSError *error, id responseObject) {
                      if (error == nil)
                      {
                          NSArray *responseArray = responseObject;
                          completion(responseArray);
                      }
                      else
                      {
                          //TODO: Error handling
                          completion(nil);
                      }
                  }];
}
@end
