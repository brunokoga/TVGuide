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
    [self setUpDrawer];
}

- (void)setUpDrawer
{
    UIView *drawerView = [[UIView alloc] initWithFrame:self.frame];
    id<TVGTheme> theme = [BKThemeManager theme];
    UIColor *backgrouncColor = [theme color2];
    drawerView.backgroundColor = backgrouncColor;
    
    
//    self.addFavorites = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.addFavorites setBackgroundImage:[UIImage imageNamed:@"icoHeart.png"] forState:UIControlStateNormal];
//    self.addFavorites.frame = CGRectMake(233.0, 16.0, 21.0, 21.0);
//    [drawerView addSubview:self.addFavorites];
//    
//    
//    self.addNotification = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.addNotification setBackgroundImage:[UIImage imageNamed:@"icoClock.png"] forState:UIControlStateNormal];
//    self.addNotification.frame = CGRectMake(277.0, 16.0, 21.0, 21.0);
//    [drawerView addSubview:self.addNotification];
    
    self.drawerView = drawerView;
    self.maximumPan = 120.0;
    self.directionMask = UISwipeGestureRecognizerDirectionLeft;
}
@end
