//
//  TVGScheduleXMLParser.h
//  TVGuide
//
//  Created by Bruno Koga on 11/9/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGXMLParser.h"
#import "TVGScheduleShow.h"

@interface TVGScheduleXMLParser : TVGXMLParser
@property (nonatomic, strong) TVGScheduleShow *currentShow;
@property (nonatomic, strong) NSString *currentDay;
@property (nonatomic, strong) NSMutableArray *showsSeparatedByDay;

@end
