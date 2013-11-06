//
//  TVGShowListViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 11/6/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGShowListViewController.h"

@interface TVGShowListViewController ()

@end

@implementation TVGShowListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowInfoSegue"])
    {
        TVGShowViewController *destination = segue.destinationViewController;
        [destination setShow:(TVGShow *)self.datasource.items[self.selectedIndexPath.row]];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    return indexPath;
}
@end
