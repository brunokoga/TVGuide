//
//  TVGSearchListViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 11/6/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGSearchListViewController.h"

@interface TVGSearchListViewController ()

@end

@implementation TVGSearchListViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTableView];
}

static NSString * const kTVGSearchCellIdentifier = @"kTVGSearchCellIdentifier";

- (void)setUpTableView
{
    TableViewCellConfigureBlock configureCell = ^(TVGTrendingShowsTableViewCell *cell, TVGShow *show) {
        cell.showNameLabel.text = [show.name uppercaseString];
        cell.showProviderLabel.text = [show.provider uppercaseString];
        NSURL *imageURL = [NSURL URLWithString:show.imageURLString];
        [cell.showImageView setImageWithURL:imageURL];
        [cell configureForSearch];
    };

    self.datasource = [[BKTableViewDatasource alloc] initWithCellIdentifier:kTVGSearchCellIdentifier
                                                          configureCellBlock:configureCell];
    self.datasource.items = self.items;
    self.tableView.dataSource = self.datasource;
    self.tableView.delegate = self;
}

@end
