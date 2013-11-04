//
//  TVGSearchForShowsViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGSearchForShowsViewController.h"
#import "TVGSearchServices.h"

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self searchForTerm:textField.text];
    return YES;
}

- (void)searchForTerm:(NSString *)term
{
       [TVGSearchServices searchWithSearchTerm:term
                             completionHandler:^(NSArray *array) {
                                 NSLog(@"%@", array);
                             }];
}
@end
