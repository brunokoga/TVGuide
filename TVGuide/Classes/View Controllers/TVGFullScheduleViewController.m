//
//  TVGFullScheduleViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGFullScheduleViewController.h"
#import "BKMultipleSectionsTableViewDataSource.h"
#import "TVGFullScheduleServices.h"
#import "TVGFullScheduleTableViewCell.h"
#import "TVGScheduleShow.h"

@interface TVGFullScheduleViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TVGFullScheduleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBarBlue"]
                                                     forBarMetrics:UIBarMetricsDefault];
    [self setUpTableView];
}

static NSString * const kTVGTrendingShowsCellIdentifier = @"kTVGFullScheduleCellIdentifier";

- (void)setUpTableView
{
    TableViewCellConfigureBlock configureCell = ^(TVGFullScheduleTableViewCell *cell, TVGScheduleShow *show) {
        cell.showNameLabel.text = [show.name uppercaseString];
        cell.channelLabel.text = [show.provider uppercaseString];
        
        //removing the AM/PM
        cell.timeLabel.text = [show.timeString substringToIndex:[show.timeString length] -3];
        cell.amPmLabel.text = [show.timeString substringFromIndex:[show.timeString length] -2];
//        NSURL *imageURL = [NSURL URLWithString:show.imageURLString];
//        [cell.showImageView setImageWithURL:imageURL];
//        [cell configureForTrending];
    };

    self.datasource = [[BKMultipleSectionsTableViewDataSource alloc] initWithCellIdentifier:kTVGTrendingShowsCellIdentifier
                                                                         configureCellBlock:configureCell];
    
    self.tableView.dataSource = self.datasource;
    self.tableView.delegate = self;
    
    [self fetchScheduleFromService];
}

- (void)fetchScheduleFromService
{
    [self.activityIndicator startAnimating];
    NSString *countryInitials = @"US"; //TODO: change this ugly hardcoded thing
    [TVGFullScheduleServices fullScheduleForCountryInitials:countryInitials
                                          completionHandler:^(NSArray *array) {
                                              [self.activityIndicator stopAnimating];
                                              self.datasource.items = array;
                                              [self.tableView reloadData];
    }];
}
@end
