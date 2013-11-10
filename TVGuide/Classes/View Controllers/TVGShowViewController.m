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
#import "BKMultipleSectionsTableViewDataSource.h"
#import "TVGFullScheduleTableViewCell.h"
#import "TVGScheduleShow.h"

@interface TVGShowViewController () <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *airingLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *showListingLabel;
@property (strong, nonatomic) BKMultipleSectionsTableViewDataSource *datasource;
@end

@implementation TVGShowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUp];
    [self setUpTableView];
    self.titleLabel.text = [self.show.name uppercaseString];
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
    
    self.showListingLabel.textColor = [theme color1];
    self.showListingLabel.font = [theme fontWithSize:self.showListingLabel.font.pointSize];
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
                            self.show.imageURLString = show.imageURLString;
                            self.show.air = show.air;
                            [self parseShowListings];
                            [self refreshScreen];
                            [self.tableView reloadData];
                        }];
}
static NSString * const kTVGFullScheduleCellIdentifier = @"kTVGFullScheduleCellIdentifier";


- (void)setUpTableView
{
    TableViewCellConfigureBlock configureCell = ^(TVGFullScheduleTableViewCell *cell, TVGScheduleShow *show) {
        
        cell.showNameLabel.text = [show.title uppercaseString];
        cell.channelLabel.text = [show.provider uppercaseString];
        
        //removing the AM/PM
        cell.timeLabel.text = show.timeString;
        cell.amPmLabel.text = show.amPm;
        cell.drawerView = nil;
    };

    self.datasource = [[BKMultipleSectionsTableViewDataSource alloc] initWithCellIdentifier:kTVGFullScheduleCellIdentifier
                                                                         configureCellBlock:configureCell];
    
    self.tableView.dataSource = self.datasource;
    self.tableView.delegate = self;
    
}
- (void)parseShowListings
{
    NSMutableArray *items = [NSMutableArray new];
    for (NSDictionary *dict in self.show.listings) {
        NSArray *array = dict[@"showTimes"];
        NSMutableArray *section = [NSMutableArray new];
        for (NSArray *listingArray in array) {
            for (NSDictionary *dictListings in listingArray) {
                TVGScheduleShow *show = [TVGScheduleShow new];
                show.provider = dictListings[@"air"];
                show.timeString = dictListings[@"time"];
                show.title = dictListings[@"info"];
                show.amPm = dictListings[@"ampm"];
                show.day = dict[@"day"];
                [section addObject:show];
            }
        }
        [items addObject:section];
    }
    self.datasource.items = [items copy];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    id<TVGTheme> theme = [BKThemeManager theme];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 230, 22)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 22)];
    view.backgroundColor = [theme color1];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    [view addSubview:label];
    TVGScheduleShow *show = (TVGScheduleShow *)self.datasource.items[section][0];
    label.text = show.day;
    return view;
}

- (void)refreshScreen
{
    self.airingLabel.text = [self.show.air uppercaseString];
    if ([self.show.imageURLString length] > 0) {
        [self.imageView setImageWithURL:[NSURL URLWithString:self.show.imageURLString]];
    }
    self.descriptionTextView.text = self.show.info;
}

@end
