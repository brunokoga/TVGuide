//
//  TVGHTTPRequestOperationManager.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^TVGRequestCompletionHandler)(NSError *error, id responseObject);

@interface TVGHTTPRequestOperationManager : AFHTTPRequestOperationManager

+ (instancetype)sharedManager;

/**
 *  Calls the service for the full schedule for a given country
 *
 *  @param countryInitials Country Initials. Examples: BR, US, IT, etc.
 *  @param completion      A completion block that will be called when the request finishes
 */
- (void)fullScheduleForCountryInitials:(NSString *)countryInitials
                            completion:(TVGRequestCompletionHandler)completion;

/**
 *  Calls the service for Info for a given show
 *
 *  @param show            The show name
 *  @param completion      A completion block that will be called when the request finishes
 */
- (void)showInfoForShow:(NSString *)show
             completion:(TVGRequestCompletionHandler)completion;

/**
 *  Search for shows given a search term
 *
 *  @param searchTerm      The search term
 *  @param completion      A completion block that will be called when the request finishes
 */
- (void)searchShowsWithSearchTerm:(NSString *)searchTerm
                       completion:(TVGRequestCompletionHandler)completion;

/**
 *  Grab all the Show Trends
 *
 *  @param completion      A completion block that will be called when the request finishes
 */
- (void)showTrendsWithCompletion:(TVGRequestCompletionHandler)completion;

@end
