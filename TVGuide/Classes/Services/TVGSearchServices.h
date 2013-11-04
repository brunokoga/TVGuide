//
//  TVGSearchServices.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGServices.h"

@interface TVGSearchServices : TVGServices

+ (void)searchWithSearchTerm:(NSString *)searchTerm
           completionHandler:(TVGServiceArrayResponse)completion;
@end
