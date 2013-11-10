//
//  TVGScheduleShow.h
//  TVGuide
//
//  Created by Bruno Koga on 11/9/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGShow.h"

@interface TVGScheduleShow : TVGShow

@property (strong, nonatomic) NSString *timeString;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *episode;
@property (strong, nonatomic) NSString *day;
@property (strong, nonatomic) NSString *amPm;

@end
