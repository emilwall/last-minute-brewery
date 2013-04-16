//
//  LMBSearchViewController.h
//  LastMinuteBrewery
//
//  Created by Daniel Lervik on 2013-04-16.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMBSearchViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) IBOutlet UIView *pickerView;
@property (nonatomic, strong) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;

@property (nonatomic, strong) NSArray *pickerDataSource;

@property (nonatomic, strong) NSArray *airports;
@property (nonatomic, strong) NSArray *destinations;
@property (nonatomic, strong) NSArray *hotels;

-(IBAction) didPushDoneInPickerView:(id)sender;
-(IBAction) didPushFromAirport:(id)sender;
-(IBAction) didPushToDestination:(id)sender;
-(IBAction) didPushHotel:(id)sender;
-(IBAction) didPushDate:(id)sender;

@end
