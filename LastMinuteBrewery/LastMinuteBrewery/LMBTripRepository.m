//
//  LMBTripRepository.m
//  LastMinuteBrewery
//
//  Created by Daniel Lervik on 2013-04-15.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import "LMBTripRepository.h"
#import "LMBLastMinuteApi.h"
#import "LMBOffer.h"


@implementation LMBTripRepository

- (NSArray *)getAllAirports
{
    NSArray *airports = [NSArray arrayWithObjects:@"ARN", @"GBG", nil];
    return airports;
}

- (void)getOffersFrom:(NSString *)airport
                   to:(NSString *)destination
                   on:(NSString *)date
              success:(void (^)(NSArray *result))success
              failure:(void (^)(NSError *error))failure
{
    NSString *path = [[NSString alloc] initWithFormat:@"/offers/from/%@/", airport];
    if(destination) {
        path = [[NSString alloc] initWithFormat:@"%@to/%@/",path, destination];
    }
    if(date) {
        path = [[NSString alloc] initWithFormat:@"%@on/%@/",path, date];
    }
    NSLog(path);
    NSMutableArray *result = [[NSMutableArray alloc] init];
    [[LMBLastMinuteApi sharedClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"Success");
         NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
         for(NSDictionary *dict in responseObject) {
             //NSLog(@"%@ -> %@",[dict valueForKey:@"destination"], [dict valueForKey:@"city"]);
             //LMBOffer *offer = [[LMBOffer alloc] init];
             
             LMBOffer *offer = [[LMBOffer alloc] initWithBookingURL:[NSURL URLWithString:[dict valueForKey:@"bookingUrl"]] andCity:[dict valueForKey:@"city"] andDate:[formatter dateFromString:[dict valueForKey:@"date"]] andDays:[dict valueForKey:@"days"] andDeparture:[dict valueForKey:@"departure"] andDestination:[dict valueForKey:@"destination"] andHotelID:[dict valueForKey:@"hotelId"] andPrice:[dict valueForKey:@"price"] andRemaining:[dict valueForKey:@"remaining"] andRoomDesc:[dict valueForKey:@"roomDesc"]];
             
             //offer.price = [dict valueForKey:@"price"];
             //offer.destination = [dict valueForKey:@"destination"];
             [result addObject:offer];
             
         }
        if(success) {
            success(result);
        }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Failure");
         if(failure) {
             failure(error);
         }
     }];
    
    
}

- (void)getHotelByHotelID: (NSString *) hotelid
                onSuccess: (void (^)(NSDictionary *result))success
                onFailure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"/offer/hotel/%@", hotelid];
    NSLog(path);
    [[LMBLastMinuteApi sharedClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success!");
        if(success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure..");
        if(failure) {
            failure(error);
        }
    }];
}

- (void)getHotelImageWithID: (NSString *) hotelID
                   andWidth: (NSNumber *) width
                  andHeight: (NSNumber *) height
                  onSuccess: (void (^)(UIImage *result))success
                  onFailure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"/offer/hotel/%@/image/width/%@/height/%@", hotelID, [width stringValue], [height stringValue]];
    NSLog(path);
    [[LMBLastMinuteApi sharedClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, UIImage *responseObject) {
        NSLog(@"Success!");
        if(success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure..");
        if(failure) {
            failure(error);
        }
    }];
    
}

@end
