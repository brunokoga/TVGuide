//
//  TVGServices.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVGHTTPRequestOperationManager.h"
#import <ARSafeJSON/ARSafeJSON.h>

/**
 *  Abstract Class that declares
 *  the common functionalities from 
 *  a service class.
 */

typedef void (^TVGServiceArrayResponse)(NSArray *array);

@interface TVGServices : NSObject

@end
