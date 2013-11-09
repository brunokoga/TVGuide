//
//  TVGHTTPRequestOperationManager.m
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGHTTPRequestOperationManager.h"
#import <AFNetworkActivityIndicatorManager.h>
#import <AFNetworking/AFURLResponseSerialization.h>

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
        sharedInstance = [[self alloc] initWithBaseURL:nil];
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        [sharedInstance instantiateURLs];
        [sharedInstance configureSerializers];
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

- (void)configureSerializers
{
    self.responseSerializer = [AFCompoundResponseSerializer compoundSerializerWithResponseSerializers:@[[AFJSONResponseSerializer new], [AFXMLParserResponseSerializer new], [AFImageResponseSerializer new]]];
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
    urlString = [urlString stringByAppendingString:countryInitials];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
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
    NSString *formattedShow = [show stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    urlString = [urlString stringByAppendingString:formattedShow];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
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
    urlString = [urlString stringByAppendingString:searchTerm];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
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
