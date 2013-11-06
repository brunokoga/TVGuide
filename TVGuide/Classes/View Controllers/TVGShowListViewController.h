//
//  TVGShowListViewController.h
//  TVGuide
//
//  Created by Bruno Koga on 11/6/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGBaseViewController.h"
#import "BKTableViewDatasource.h"
#import "TVGShowViewController.h"
#import "TVGShow.h"
#import "TVGTrendingShowsTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface TVGShowListViewController : TVGBaseViewController <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong) BKTableViewDatasource *datasource;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end
