//
//  BKMultipleSectionsTableViewDataSource.m
//  TVGuide
//
//  Created by Bruno Koga on 11/7/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "BKMultipleSectionsTableViewDataSource.h"

@interface BKMultipleSectionsTableViewDataSource ()

@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation BKMultipleSectionsTableViewDataSource

#pragma mark TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.items count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [self.items[section] count];
    return count;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger)indexPath.section][(NSUInteger)indexPath.row];
}

@end
