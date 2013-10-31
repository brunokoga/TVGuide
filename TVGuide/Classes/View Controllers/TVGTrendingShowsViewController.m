//
//  TVGTrendingShowsViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGTrendingShowsViewController.h"
#import "BKTableViewDatasource.h"
#import "TVGTrendingShowsServices.h"
#import "TVGTrendingShowsTableViewCell.h"
#import "TVGShow.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "TVGShowViewController.h"

@interface TVGTrendingShowsViewController () <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong) BKTableViewDatasource *datasource;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation TVGTrendingShowsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTableView];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.selectedIndexPath)
    {
        [self.tableView deselectRowAtIndexPath:self.selectedIndexPath
                                             animated:YES];
        self.selectedIndexPath = nil;
    }
}


static NSString * const kTVGTrendingShowsCellIdentifier = @"kTVGTrendingShowsCellIdentifier";

- (void)setUpTableView
{
    TableViewCellConfigureBlock configureCell = ^(TVGTrendingShowsTableViewCell *cell, TVGShow *show) {
        cell.showNameLabel.text = show.name;
        cell.showProviderLabel.text = show.provider;
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
    [TVGTrendingShowsServices trendingShowsWithCompletionHandler:^(NSArray *array) {
        self.datasource.items = array;
        [self.tableView reloadData];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowInfoSegue"])
    {
        TVGShowViewController *destination = segue.destinationViewController;
        NSLog(@"%@", [(TVGShow *)self.datasource.items[self.selectedIndexPath.row] name]);
        [destination setShow:(TVGShow *)self.datasource.items[self.selectedIndexPath.row]];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    return indexPath;
}


@end
