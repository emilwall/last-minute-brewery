//
//  LMBOffer.h
//  LastMinuteBrewery
//
//  Created by Christoffer Åhrling on 4/15/13.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMBOffer : NSObject

@property (nonatomic, strong) NSURL *bookingURL;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSNumber *days;
@property (nonatomic, strong) NSString *departure;
@property (nonatomic, strong) NSString *destination;
@property (nonatomic, strong) NSString *hotelid;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *remaining;
@property (nonatomic, strong) NSString *roomDesc;

@end
