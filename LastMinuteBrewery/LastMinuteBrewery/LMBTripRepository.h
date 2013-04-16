//
//  LMBTripRepository.h
//  LastMinuteBrewery
//
//  Created by Daniel Lervik on 2013-04-15.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMBTripRepository : NSObject

- (NSArray *)getAllAirports;

- (void)getOffersFrom:(NSString *)airport
                   to:(NSString *)destination
                   on:(NSString *)date success:(void (^)(NSArray *result))success
              failure:(void (^)(NSError *error))failure;


@end
