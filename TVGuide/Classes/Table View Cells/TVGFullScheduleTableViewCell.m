//
//  TVGFullScheduleTableViewCell.m
//  TVGuide
//
//  Created by Bruno Koga on 11/7/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGFullScheduleTableViewCell.h"
#import "BKThemeManager.h"

@implementation TVGFullScheduleTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (void)setUp
{
    id<TVGTheme> theme = [BKThemeManager theme];
    self.showNameLabel.textColor = [theme color2];
    self.channelLabel.textColor = [theme color1];
    self.timeLabel.textColor = [theme color1];
    self.amPmLabel.textColor = [theme color1];
}

@end
