//
//  LMBOfferViewController.m
//  LastMinuteBrewery
//
//  Created by Christoffer Åhrling on 4/15/13.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import "LMBOfferViewController.h"
#import "LMBOffer.h"

@interface LMBOfferViewController ()

@end

@implementation LMBOfferViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
                
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    self.offer = [[LMBOffer alloc] initWithBookingURL:[NSURL URLWithString:@"http://google.se"] andCity:@"Paris" andDate:[formatter dateFromString:@"2013-04-08T10:05:00.0000000+00:00"] andDays:[NSNumber numberWithInt: 7] andDeparture:@"Stockholm" andDestination:@"Paris" andHotelID:@"14" andPrice:[NSNumber numberWithInt: 3303] andRemaining:[NSNumber numberWithInt: 2] andRoomDesc:@"dubbelrum"];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
