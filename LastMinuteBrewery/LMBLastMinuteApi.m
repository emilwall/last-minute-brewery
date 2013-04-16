//
//  LMBLastMinuteApi.h
//  AFNetTest2
//
//  Created by Erik Jonsson on 4/16/13.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMBLastMinuteApi.h"

@implementation LMBLastMinuteApi

+ (LMBLastMinuteApi *)sharedClient {
    static LMBLastMinuteApi *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://travel-offers-api.apphb.com/"];
        _sharedClient = [[LMBLastMinuteApi alloc] initWithBaseURL:url];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
 
    
    return self;
}

@end
