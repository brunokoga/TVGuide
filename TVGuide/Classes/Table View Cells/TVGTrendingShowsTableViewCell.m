//
//  TVGTrendingShowsTableViewCell.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGTrendingShowsTableViewCell.h"
#import "BKThemeManager.h"

@implementation TVGTrendingShowsTableViewCell

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
    self.showNameLabel.font = [theme fontWithSize:self.showNameLabel.font.pointSize];
    self.showProviderLabel.font = [theme fontWithSize:self.showProviderLabel.font.pointSize];
}

- (void)configureForTrending
{
    id<TVGTheme> theme = [BKThemeManager theme];
    self.showNameLabel.textColor = [theme color1];
    self.showProviderLabel.textColor = [theme color2];
}

- (void)configureForSearch
{
    id<TVGTheme> theme = [BKThemeManager theme];
    self.showNameLabel.textColor = [theme color4];
    self.showProviderLabel.textColor = [theme color3];
    
}


@end
