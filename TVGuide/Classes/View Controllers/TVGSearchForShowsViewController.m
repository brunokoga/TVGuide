//
//  TVGSearchForShowsViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGSearchForShowsViewController.h"
#import "TVGSearchServices.h"
#import "TVGSearchListViewController.h"

@interface TVGSearchForShowsViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation TVGSearchForShowsViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBarGreen"]
                                                  forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self searchForTerm:textField.text];
    [textField resignFirstResponder];
    return YES;
}

- (void)searchForTerm:(NSString *)term
{
    [self.activityIndicator startAnimating];
       [TVGSearchServices searchWithSearchTerm:term
                             completionHandler:^(NSArray *array) {
                                 [self.activityIndicator stopAnimating];
                                 TVGSearchListViewController *listViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TVGSearchListViewController"];
                                 listViewController.items = array;
                                 [self.navigationController pushViewController:listViewController
                                                                      animated:YES];
                             }];
}
@end
