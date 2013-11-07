//
//  TVGFullScheduleServices.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGServices.h"

@interface TVGFullScheduleServices : TVGServices

+ (void)fullScheduleForCountryInitials:(NSString *)countryInitials
                     completionHandler:(TVGServiceArrayResponse)completion;

@end
