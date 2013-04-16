//
//  LMBSearchViewController.m
//  LastMinuteBrewery
//
//  Created by Daniel Lervik on 2013-04-16.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import "LMBSearchViewController.h"

@interface LMBSearchViewController ()

@end

@implementation LMBSearchViewController


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerDataSource objectAtIndex:row];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerDataSource count];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.airports = [NSArray arrayWithObjects:@"Stockholm/Arlanda", @"Götet", nil];
    self.destinations = [NSArray arrayWithObjects:@"Paris", @"London", @"Stockholm", @"Helsinki", nil];
    self.hotels = [NSArray arrayWithObjects:@"Hotel Inn", @"The Mad Hatter", @"The Jugged Hare", nil];
}

-(void)dismissPickerView
{
    [UIView animateWithDuration:0.4 animations:^{
        CGRect rect = self.pickerView.frame;
        rect.origin.y = self.view.frame.size.height;
        self.pickerView.frame = rect;
    }];
}
-(void)showPickerView
{
    [self.picker reloadAllComponents];
    [UIView animateWithDuration:0.4 animations:^{
        CGRect rect = self.pickerView.frame;
        rect.origin.y = self.view.frame.size.height - rect.size.height;
        self.pickerView.frame = rect;
    }];
}

-(IBAction) didPushDoneInPickerView:(id)sender
{
    [self dismissPickerView];
}

- (IBAction)didPushDate:(id)sender
{
    
}
- (IBAction)didPushFromAirport:(id)sender
{
    self.pickerDataSource = self.airports;
    [self showPickerView];
}
- (IBAction)didPushToDestination:(id)sender
{
    self.pickerDataSource = self.destinations;
    [self showPickerView];
}
- (IBAction)didPushHotel:(id)sender
{
    self.pickerDataSource = self.hotels;
    [self showPickerView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
