//
//  LMBOfferViewController.h
//  LastMinuteBrewery
//
//  Created by Christoffer Åhrling on 4/15/13.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMBOffer;

@interface LMBOfferViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *image;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *departureLabel;
@property (nonatomic, strong) IBOutlet UILabel *durationLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong) IBOutlet UIWebView *hotelWebView;


@property (nonatomic, strong) LMBOffer *offer;

- (IBAction)bookingAction:(id)sender;

@end
