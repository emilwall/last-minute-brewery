//
//  LMBOffer.m
//  LastMinuteBrewery
//
//  Created by Christoffer Åhrling on 4/15/13.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import "LMBOffer.h"

@implementation LMBOffer

- (LMBOffer *) initWithBookingURL: (NSURL *) bookingURL andCity: (NSString *) city andDate: (NSDate *) date andDays: (NSNumber *) days andDeparture: (NSString *) departure andDestination: (NSString *) destination andHotelID: (NSString *) hotelID andPrice: (NSNumber *) price andRemaining: (NSNumber *) remaining andRoomDesc: (NSString *) roomDesc
{
    self = [super init];
    self.bookingURL = bookingURL;
    self.city = city;
    self.date = date;
    self.days = days;
    self.departure = departure;
    self.destination = destination;
    self.hotelid = hotelID;
    self.price = price;
    self.remaining = remaining;
    self.roomDesc = roomDesc;
    
    return self;
}

@end
