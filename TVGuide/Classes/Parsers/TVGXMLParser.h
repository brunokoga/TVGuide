//
//  TVGXMLParser.h
//  TVGuide
//
//  Created by Bruno Koga on 11/9/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVGShow.h"

// Abstract Class. You should sublass it.
@interface TVGXMLParser : NSObject <NSXMLParserDelegate>
@property (nonatomic, strong) NSMutableArray *shows;
@property (nonatomic, strong) TVGShow *currentShow;
@property (nonatomic, strong) NSString *currentElement;
@property (nonatomic, strong) NSMutableString *currentElementValue;
@property (nonatomic, copy) NSString *entryElementName;

- (NSArray *)showsFromXMLParser:(NSXMLParser *)xmlParser;

@end
