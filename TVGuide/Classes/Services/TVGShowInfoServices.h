//
//  TVGShowInfoServices.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGServices.h"

@interface TVGShowInfoServices : TVGServices

+ (void)showInfoWithName:(NSString *)showName
       completionHandler:(TVGServiceArrayResponse)completion;

@end
