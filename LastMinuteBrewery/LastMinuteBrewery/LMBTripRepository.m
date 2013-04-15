//
//  LMBTripRepository.m
//  LastMinuteBrewery
//
//  Created by Daniel Lervik on 2013-04-15.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import "LMBTripRepository.h"

@implementation LMBTripRepository

- (NSArray *)getAllAirports
{
    NSArray *airports = [NSArray arrayWithObjects:@"ARN", @"GBG", nil];
    return airports;
}

- (NSArray *)getOffersFrom:(NSString *)airport To:(NSString *)destination On:(NSString *)date
{
    return [NSArray arrayWithObjects: @"Dummy1", @"Dummy2", @"Dummy3", nil];
}

@end
