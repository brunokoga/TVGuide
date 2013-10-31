//
//  TVGSideMenuViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGSideMenuViewController.h"
#import <MFSideMenu/MFSideMenu.h>
#import "TVGSideMenuContainerViewController.h"

@interface TVGSideMenuViewController ()

@end

@implementation TVGSideMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)trendingShowsButtonPressed:(id)sender {
    [(TVGSideMenuContainerViewController *)self.menuContainerViewController openViewControllerInCenterView:TVGTrending];
}


- (IBAction)fullScheduleButtonPressed:(id)sender {
    [(TVGSideMenuContainerViewController *)self.menuContainerViewController openViewControllerInCenterView:TVGSchedule];
}

- (IBAction)searchForShowsButtonPressed:(id)sender {
    [(TVGSideMenuContainerViewController *)self.menuContainerViewController openViewControllerInCenterView:TVGSearch];
}

- (IBAction)myFavoritesButtonPressed:(id)sender {
    [(TVGSideMenuContainerViewController *)self.menuContainerViewController openViewControllerInCenterView:TVGFavorites];
}
@end
