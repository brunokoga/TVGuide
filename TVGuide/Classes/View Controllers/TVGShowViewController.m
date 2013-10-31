//
//  TVGShowViewController.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGShowViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface TVGShowViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *airingLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TVGShowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleLabel.text = self.show.name;
    NSURL *imageURL = [NSURL URLWithString:self.show.imageURLString];
    [self.imageView setImageWithURL:imageURL];
}

@end
