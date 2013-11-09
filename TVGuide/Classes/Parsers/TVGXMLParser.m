//
//  TVGXMLParser.m
//  TVGuide
//
//  Created by Bruno Koga on 11/9/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGXMLParser.h"

@implementation TVGXMLParser 

- (NSArray *)showsFromXMLParser:(NSXMLParser *)xmlParser;
{
    self.shows = [NSMutableArray array];
    if ([xmlParser isKindOfClass:[NSXMLParser class]])
    {
        xmlParser.delegate = self;
        [xmlParser parse];
    }
    return [self.shows copy];
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:self.entryElementName])
    {
        self.currentShow = [TVGShow new];
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:self.entryElementName])
    {
        if (self.currentShow)
            [self.shows addObject:self.currentShow];
        
        self.currentShow = nil;
    }
}
- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{
    [self.currentElementValue appendString:string];
}
@end
