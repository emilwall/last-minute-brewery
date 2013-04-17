//
//  LMBSearchViewController.m
//  LastMinuteBrewery
//
//  Created by Daniel Lervik on 2013-04-16.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import "LMBSearchViewController.h"
#import "LMBLastMinuteApi.h"
#import "LMBTripTableViewController.h"

@interface LMBSearchViewController ()
@property (nonatomic, strong) LMBLastMinuteApi *api;
@end

@implementation LMBSearchViewController


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    id rowData = [self.currentPickerDataSource objectAtIndex:row];
    
    if ([[rowData class] isSubclassOfClass:[NSString class]])
        return rowData;
    else
        return [(NSDictionary *)rowData objectForKey:@"name"];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.currentPickerDataSource count];
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
    self.api = [LMBLastMinuteApi sharedClient];
    
    [self.api getPath:@"/airports" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.airports = responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    
    [self.api getPath:@"/destinations" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.destinations = responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    
    self.destinations = [NSArray arrayWithObjects:@"Paris", @"London", @"Stockholm", @"Helsinki", nil];
    self.hotels = [NSArray arrayWithObjects:nil];
}

-(void)dismissPickerView
{
    [UIView animateWithDuration:0.4 animations:^{
        CGRect rect = self.pickerView.frame;
        rect.origin.y = self.view.frame.size.height;
        self.pickerView.frame = rect;
    }];
    
    id selected = [self.currentPickerDataSource objectAtIndex:[self.picker selectedRowInComponent:0]];
    
    if (self.currentPickerDataSource == self.airports)
        [self setSelectedAirport:selected];
    else if (self.currentPickerDataSource == self.destinations)
        [self setSelectedDestination:selected];

    self.currentPushButton = nil;
}

-(void)setSelectedAirport:(id)airport
{
    [self.fromButton setTitle:[(NSDictionary *)airport objectForKey:@"name"] forState:UIControlStateNormal];
    self.airport = airport;
}

-(void)setSelectedDestination:(id)destination
{
    [self.toButton setTitle:destination forState:UIControlStateNormal];
    self.destination = destination;
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
-(IBAction) didPushDoneInDatePickerView:(id)sender
{
    [UIView animateWithDuration:0.4 animations:^{
        CGRect rect = self.datePickerView.frame;
        rect.origin.y = self.view.frame.size.height;
        self.datePickerView.frame = rect;
    }];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    NSDate *date = [self.datePicker date];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    
    [self.dateButton setTitle:formattedDateString forState:UIControlStateNormal];
}

- (IBAction)didPushDate:(id)sender
{
    [UIView animateWithDuration:0.4 animations:^{
        CGRect rect = self.datePickerView.frame;
        rect.origin.y = self.view.frame.size.height - rect.size.height;
        self.datePickerView.frame = rect;
    }];
}
- (IBAction)didPushFromAirport:(id)sender
{
    self.currentPickerDataSource = self.airports;
    self.currentPushButton = sender;
    [self showPickerView];
}
- (IBAction)didPushToDestination:(id)sender
{
    self.currentPickerDataSource = self.destinations;
    self.currentPushButton = sender;
    [self showPickerView];
}
- (IBAction)didPushHotel:(id)sender
{
    self.currentPickerDataSource = self.hotels;
    self.currentPushButton = sender;
    [self showPickerView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue.destinationViewController class] isSubclassOfClass:[LMBTripTableViewController class]])
    {
        LMBTripTableViewController *trips = (LMBTripTableViewController *)segue.destinationViewController;
        
        trips.airport = [(NSDictionary *)self.airport objectForKey:@"name"];
        trips.destination = (NSString *)self.destination;
        trips.date = [self.dateButton titleForState:UIControlStateNormal];
    }
}

@end
