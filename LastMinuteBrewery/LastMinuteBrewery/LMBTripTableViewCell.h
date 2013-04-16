//
//  LMBTripTableViewCell.h
//  LastMinuteBrewery
//
//  Created by Erik Jonsson on 4/15/13.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMBTripTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) IBOutlet UILabel *price;
@end
