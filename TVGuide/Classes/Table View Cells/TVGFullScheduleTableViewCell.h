//
//  TVGFullScheduleTableViewCell.h
//  TVGuide
//
//  Created by Bruno Koga on 11/7/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHPanningTableViewCell_Private.h"

@interface TVGFullScheduleTableViewCell : HHPanningTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *amPmLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *showNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *channelLabel;

@end
