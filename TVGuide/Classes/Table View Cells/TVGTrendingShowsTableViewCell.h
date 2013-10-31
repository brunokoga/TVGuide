//
//  TVGTrendingShowsTableViewCell.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVGTrendingShowsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *showNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *showProviderLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

- (void)configureForTrending;
- (void)configureForSearch;

@end
