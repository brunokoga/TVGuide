//
//  TVGTrendingShowsViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGTrendingShowsViewController.h"
#import "TVGTrendingShowsServices.h"
#import "TVGShowViewController.h"

@implementation TVGTrendingShowsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTableView];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBarRed"]
                                                  forBarMetrics:UIBarMetricsDefault];
}

static NSString * const kTVGTrendingShowsCellIdentifier = @"kTVGTrendingShowsCellIdentifier";

- (void)setUpTableView
{
    TableViewCellConfigureBlock configureCell = ^(TVGTrendingShowsTableViewCell *cell, TVGShow *show) {
        cell.showNameLabel.text = [show.name uppercaseString];
        cell.showProviderLabel.text = [show.provider uppercaseString];
        NSURL *imageURL = [NSURL URLWithString:show.imageURLString];
        [cell.showImageView setImageWithURL:imageURL];
        [cell configureForTrending];
    };

    self.datasource = [[BKTableViewDatasource alloc] initWithCellIdentifier:kTVGTrendingShowsCellIdentifier
                                                          configureCellBlock:configureCell];
    
    self.tableView.dataSource = self.datasource;
    self.tableView.delegate = self;
    
    [self fetchShowsFromService];
}

- (void)fetchShowsFromService
{
    [self.activityIndicator startAnimating];
    [TVGTrendingShowsServices trendingShowsWithCompletionHandler:^(NSArray *array) {
        [self.activityIndicator stopAnimating];
        self.datasource.items = array;
        [self.tableView reloadData];
    }];
}



@end
