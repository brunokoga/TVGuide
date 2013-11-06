//
//  TVGShowViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGShowViewController.h"
#import "TVGShowInfoServices.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "BKThemeManager.h"

@interface TVGShowViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *airingLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TVGShowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUp];
    self.titleLabel.text = [self.show.name uppercaseString];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBarRed"]
                                                     forBarMetrics:UIBarMetricsDefault];
    NSURL *imageURL = [NSURL URLWithString:self.show.imageURLString];
    [self.imageView setImageWithURL:imageURL];
    [self fetchShowFromService];
}

- (void)setUp
{
    id<TVGTheme> theme = [BKThemeManager theme];
    self.titleLabel.font = [theme fontWithSize:self.titleLabel.font.pointSize];
    self.titleLabel.textColor = [theme color1];
    self.airingLabel.textColor = [theme color2];
    self.airingLabel.font = [theme fontWithSize:self.airingLabel.font.pointSize];
    
    self.descriptionTextView.textColor = [theme color1];
}

- (void)fetchShowFromService
{
    [self.activityIndicator startAnimating];
    [TVGShowInfoServices showInfoWithName:self.show.name
                        completionHandler:^(NSArray *array) {
                            // self.datasource.items = array;
                            [self.activityIndicator stopAnimating];
                            TVGShow *show = [array firstObject];
                            self.show.info = show.info;
                            self.show.listings = show.listings;
                            self.show.crew = show.crew;
                            [self refreshScreen];
                            [self.tableView reloadData];
                        }];
}

- (void)refreshScreen
{
    self.descriptionTextView.text = self.show.info;
    
    
}

@end
