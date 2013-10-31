//
//  TVGHTTPRequestOperationManager.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGHTTPRequestOperationManager.h"
#import <AFNetworkActivityIndicatorManager.h>

@interface TVGHTTPRequestOperationManager()
@property (strong) NSDictionary *urls;

@end
@implementation TVGHTTPRequestOperationManager

#pragma mark - Initialization
+ (instancetype)sharedManager
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        [sharedInstance instantiateURLs];
    });
    return sharedInstance;
}
static NSString * const kAPIURLsFileName = @"APIURLs";

static NSString * const kCONFIGURATION_KEY = @"Configuration";


- (void)instantiateURLs
{
    NSString *path = [[NSBundle mainBundle] pathForResource:kAPIURLsFileName ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *configuration = [[NSBundle mainBundle] objectForInfoDictionaryKey:kCONFIGURATION_KEY];
    NSDictionary *dictForConfiguration = dictionary[configuration];
    self.urls = dictForConfiguration;
}


#pragma mark - Public Methods

static NSString * const kAPIFullSchedule = @"fullSchedule";
static NSString * const kAPISearchShows = @"searchShows";
static NSString * const kAPIShowInfo = @"showInfo";
static NSString * const kAPIShowTrends = @"showTrends";

- (void)fullScheduleForCountryInitials:(NSString *)countryInitials
                            completion:(TVGRequestCompletionHandler)completion
{
    NSString *urlString = self.urls[kAPIFullSchedule];
    [urlString stringByAppendingString:countryInitials];
    
    [self GET:urlString
   parameters:nil
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          completion(nil, responseObject);
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          completion(error, nil);
      }];
}

- (void)showInfoForShow:(NSString *)show
             completion:(TVGRequestCompletionHandler)completion
{
    NSString *urlString = self.urls[kAPIShowInfo];
    [urlString stringByAppendingString:show];
    
    [self GET:urlString
   parameters:nil
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          completion(nil, responseObject);
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          completion(error, nil);
      }];
}

- (void)searchShowsWithSearchTerm:(NSString *)searchTerm
                       completion:(TVGRequestCompletionHandler)completion
{
    NSString *urlString = self.urls[kAPISearchShows];
    [urlString stringByAppendingString:searchTerm];
    
    [self GET:urlString
   parameters:nil
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          completion(nil, responseObject);
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          completion(error, nil);
      }];
}

- (void)showTrendsWithCompletion:(TVGRequestCompletionHandler)completion
{
    NSString *urlString = self.urls[kAPIShowTrends];
    
    [self GET:urlString
   parameters:nil
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          completion(nil, responseObject);
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          completion(error, nil);
      }];
}

@end