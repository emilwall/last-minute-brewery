//
//  LMBOfferViewController.m
//  LastMinuteBrewery
//
//  Created by Christoffer Åhrling on 4/15/13.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import "LMBOfferViewController.h"
#import "UIImageView+AFNetworking.h"

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
    
    self.tripRepository = [[LMBTripRepository alloc] init];
    
    //NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    self.hotelWebView.scrollView.scrollEnabled = NO;
    
    //self.offer = [[LMBOffer alloc] initWithBookingURL:[NSURL URLWithString:@"http://google.se"] andCity:@"Paris" andDate:[formatter dateFromString:@"2013-04-08T10:05:00.0000000+00:00"] andDays:[NSNumber numberWithInt: 7] andDeparture:@"Stockholm" andDestination:@"Paris" andHotelID:@"49" andPrice:[NSNumber numberWithInt: 3303] andRemaining:[NSNumber numberWithInt: 2] andRoomDesc:@"dubbelrum"];
    
    [self updateViewWithOffer: self.offer];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSString *imageUrl = [NSString stringWithFormat:@"http://travel-offers-api.apphb.com/offer/hotel/%@/image/width/%d/height/%d", self.offer.hotelid, (int)self.image.frame.size.width, (int)self.image.frame.size.height];
    
    [self.image setImageWithURL:[NSURL URLWithString:imageUrl]];
}

- (void) updateViewWithOffer: (LMBOffer *) offer
{
    self.titleLabel.text = offer.destination;
    self.priceLabel.text = [offer.price stringValue];
    self.departureLabel.text = offer.departure;
    self.durationLabel.text = [offer.days stringValue];
    
    if (![self.offer.hotelid isEqualToString:@""]) {
        [self.tripRepository getHotelByHotelID:self.offer.hotelid onSuccess:^(NSDictionary *result) {
            NSLog(@"%@", [result valueForKey:@"name"]);
            [self.hotelWebView loadHTMLString:[result valueForKey:@"html"] baseURL:nil];
        } onFailure:^(NSError *error) {
            NSLog(@"Fail");
        }];
    }
    
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
    CGRect frame = aWebView.frame;
    frame.size.height = 1;
    aWebView.frame = frame;
    CGSize fittingSize = [aWebView sizeThatFits:CGSizeZero];
    frame.size = fittingSize;
    aWebView.frame = frame;
    
    NSLog(@"size: %f, %f", fittingSize.width, fittingSize.height);
    
    self.container.contentSize = CGSizeMake(320, aWebView.frame.origin.y + fittingSize.height);
}

- (IBAction)bookingAction:(id)sender
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
