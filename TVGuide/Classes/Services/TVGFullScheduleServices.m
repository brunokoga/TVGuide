//
//  TVGFullScheduleServices.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGFullScheduleServices.h"

@implementation TVGFullScheduleServices

+ (void)fullScheduleForCountryInitials:(NSString *)countryInitials
                     completionHandler:(TVGServiceArrayResponse)completion
{
    TVGHTTPRequestOperationManager *manager = [TVGHTTPRequestOperationManager sharedManager];
    [manager fullScheduleForCountryInitials:countryInitials
                                 completion:^(NSError *error, id responseObject) {
                                     if (error == nil)
                                     {
                                     }
                                     else
                                     {
                                         //TODO: Error handling
                                         completion(nil);
                                     }
                                 }];
}

@end
