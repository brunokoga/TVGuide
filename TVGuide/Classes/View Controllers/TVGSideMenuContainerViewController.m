//
//  TVGSideMenuContainerViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGSideMenuContainerViewController.h"

@interface TVGSideMenuContainerViewController ()

@end

@implementation TVGSideMenuContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self instantiateViewControllers];
	// Do any additional setup after loading the view.
}
static NSString * const kTVGNagivationControllerIdentifier = @"TVGNagivationController";
static NSString * const kTVGSideMenuViewControllerIdentifier = @"TVGSideMenuViewController";


static NSString * const kTVGTrendingShowsViewControllerIdentifier = @"TVGTrendingShowsViewController";
static NSString * const kTVGFullScheduleViewControllerIdentifier = @"TVGFullScheduleViewController";
static NSString * const kTVGSearchForShowsViewControllerIdentifier = @"TVGSearchForShowsViewController";
static NSString * const kTVGShowViewControllerIdentifier = @"TVGShowViewController";
static NSString * const kTVGFavoritesViewControllerIdentifier = @"TVGFavoritesViewController";

- (void)instantiateViewControllers
{
    UIViewController *centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:kTVGNagivationControllerIdentifier];
    self.centerViewController = centerViewController;
    
    UIViewController *leftViewController = [self.storyboard instantiateViewControllerWithIdentifier:kTVGSideMenuViewControllerIdentifier];
    self.leftMenuViewController = leftViewController;
    self.leftMenuWidth = 139.0;
}

- (void)openViewControllerInCenterView:(TVGCenterViewController)viewController
{
    NSString *identifier;
    switch (viewController) {
        case TVGTrending:
            identifier = kTVGTrendingShowsViewControllerIdentifier;
            break;
        case TVGSchedule:
            identifier = kTVGFullScheduleViewControllerIdentifier;
            break;
        case TVGSearch:
            identifier = kTVGSearchForShowsViewControllerIdentifier;
            break;
        case TVGShowInfo:
            identifier = kTVGShowViewControllerIdentifier;
            break;
        case TVGFavorites:
            identifier = kTVGFavoritesViewControllerIdentifier;
            break;
            
        default:
            break;
    }
    
    if ([identifier length] > 0) {
        UIViewController *rootViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        UINavigationController *navigationController = self.centerViewController;
        [navigationController setViewControllers:@[rootViewController]];
        [self toggleLeftSideMenuCompletion:^{
            
        }];
    }
}

@end