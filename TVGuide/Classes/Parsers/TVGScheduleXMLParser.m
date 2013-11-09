//
//  TVGScheduleXMLParser.m
//  TVGuide
//
//  Created by Bruno Koga on 11/9/13.
//  Copyright (c) 2013 MobileAware. All rights reserved.
//

#import "TVGScheduleXMLParser.h"

@implementation TVGScheduleXMLParser
/*
 >
 
 <DAY attr="2016-11-15">
 <time attr="10:00 pm">
 <show name="Comedy Bang! Bang!">
 <sid>31483</sid>
 <network>IFC</network>
 <title>Jim Gaffigan Wears a Blue Jacket &amp; Plum T-Shirt</title>
 <ep>02x15</ep>
 <link>http://www.tvrage.com/shows/id-31483/episodes/1065412352</link>
 </show>
 </time>
*/

static NSString *kTVGScheduleXMLParserEpisodeElement = @"ep";
static NSString *kTVGScheduleXMLParserLinkElement = @"link";
static NSString *kTVGScheduleXMLParserTitleElement = @"title";
static NSString *kTVGScheduleXMLParserNetworkElement = @"network";
static NSString *kTVGScheduleXMLParserTimeElement = @"time";
static NSString *kTVGScheduleXMLParserShowElement = @"show";
static NSString *kTVGScheduleXMLParserDayElement = @"DAY";
static NSString *kTVGScheduleXMLParserEntryElement = @"schedule";

- (id)init
{
    self = [super init];
    if (self)
    {
        self.entryElementName = kTVGScheduleXMLParserEntryElement;
    }
    return self;
}

- (NSArray *)showsFromXMLParser:(NSXMLParser *)xmlParser;
{
    self.showsSeparatedByDay = [NSMutableArray array];
    if ([xmlParser isKindOfClass:[NSXMLParser class]])
    {
        xmlParser.delegate = self;
        [xmlParser parse];
    }
    return [self.showsSeparatedByDay copy];
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:kTVGScheduleXMLParserTimeElement])
    {
        self.currentShow = [TVGScheduleShow new];
        self.currentShow.timeString = [attributeDict objectForKey:@"attr"];
        self.currentElement = kTVGScheduleXMLParserTimeElement;
        self.currentElementValue = [NSMutableString new];
    }

    else if ([elementName isEqualToString:kTVGScheduleXMLParserDayElement])
    {
        self.shows = [NSMutableArray new];
        
        self.currentElement = kTVGScheduleXMLParserDayElement;
        self.currentElementValue = [NSMutableString new];
        self.currentDay = [attributeDict objectForKey:@"attr"];
    }
    else if ([elementName isEqualToString:kTVGScheduleXMLParserShowElement])
    {
        self.currentShow.name = [attributeDict objectForKey:@"name"];
        self.currentElement = kTVGScheduleXMLParserShowElement;
        self.currentElementValue = [NSMutableString new];
    }
    else if ([elementName isEqualToString:kTVGScheduleXMLParserTitleElement])
    {
        self.currentElement = kTVGScheduleXMLParserTitleElement;
        self.currentElementValue = [NSMutableString new];
    }
    else if ([elementName isEqualToString:kTVGScheduleXMLParserNetworkElement])
    {
        self.currentElement = kTVGScheduleXMLParserNetworkElement;
        self.currentElementValue = [NSMutableString new];
    }
    else if ([elementName isEqualToString:kTVGScheduleXMLParserEpisodeElement])
    {
        self.currentElement = kTVGScheduleXMLParserEpisodeElement;
        self.currentElementValue = [NSMutableString new];
    }
   else if ([elementName isEqualToString:kTVGScheduleXMLParserLinkElement])
    {
        self.currentElement = kTVGScheduleXMLParserLinkElement;
        self.currentElementValue = [NSMutableString new];
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:kTVGScheduleXMLParserTimeElement])
    {
        //TODO: change that to use the showsDictionary property
        if (self.currentShow)
        {
            self.currentShow.day = self.currentDay;
            [self.shows addObject:self.currentShow];
        }
        
        self.currentShow = nil;
    }
    
    else if ([elementName isEqualToString:kTVGScheduleXMLParserDayElement])
    {
        [self.showsSeparatedByDay addObject:self.shows];
//        self.currentDay = [self.currentElementValue copy];
    }
    else if ([elementName isEqualToString:kTVGScheduleXMLParserLinkElement])
    {
        self.currentShow.linkString = [self.currentElementValue copy];
    }
    else if ([elementName isEqualToString:kTVGScheduleXMLParserTitleElement])
    {
        self.currentShow.title = [self.currentElementValue copy];
    }
    else if ([elementName isEqualToString:kTVGScheduleXMLParserNetworkElement])
    {
        self.currentShow.provider = [self.currentElementValue copy];
    }
    else if ([elementName isEqualToString:kTVGScheduleXMLParserEpisodeElement])
    {
        self.currentShow.episode = [self.currentElementValue copy];
    }
}
@end
