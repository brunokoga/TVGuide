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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self instantiateViewControllers];
	// Do any additional setup after loading the view.
}
static NSString * const kTVGNagivationControllerIdentifier = @"TVGNagivationController";
static NSString * const kTVGSideMenuViewControllerIdentifier = @"TVGSideMenuViewController";



- (void)instantiateViewControllers
{
    UIViewController *centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:kTVGNagivationControllerIdentifier];
    self.centerViewController = centerViewController;
    
    UIViewController *leftViewController = [self.storyboard instantiateViewControllerWithIdentifier:kTVGSideMenuViewControllerIdentifier];
    self.leftMenuViewController = leftViewController;
    self.leftMenuWidth = 139.0;
}
@end
