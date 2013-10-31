//
//  BKTableViewDatasource.h
//  TVGuide
//
//  Created by Bruno Koga on 10/31/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface BKTableViewDatasource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray *items;

- (id)initWithCellIdentifier:(NSString *)aCellIdentifier
          configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end