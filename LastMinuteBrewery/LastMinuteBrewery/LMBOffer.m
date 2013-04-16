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
    LMBOffer *offer = [[LMBOffer alloc] init];
    offer.bookingURL = bookingURL;
    offer.city = city;
    offer.date = date;
    offer.days = days;
    offer.departure = departure;
    offer.destination = destination;
    offer.hotelid = hotelID;
    offer.price = price;
    offer.remaining = remaining;
    offer.roomDesc = roomDesc;
    
    return offer;
}

@end
