//
//  TVGSideMenuContainerViewController.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "MFSideMenuContainerViewController.h"

typedef enum TVGCenterViewController {
    TVGTrending,
    TVGSearch,
    TVGSchedule,
    TVGShowInfo,
    TVGFavorites
} TVGCenterViewController;

@interface TVGSideMenuContainerViewController : MFSideMenuContainerViewController

- (void)openViewControllerInCenterView:(TVGCenterViewController)viewController;

@end
