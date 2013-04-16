//
//  LMBTripTableViewController.m
//  LastMinuteBrewery
//
//  Created by Erik Jonsson on 4/15/13.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import "LMBTripTableViewController.h"
#import "LMBTripRepository.h"
#import "LMBTripTableViewCell.h"
#import "LMBOffer.h"

@interface LMBTripTableViewController ()
@property (nonatomic, strong) LMBTripRepository *tripRepository;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) NSArray *resultshadow;
@end

@implementation LMBTripTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.results = [NSArray array];
        
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.tripRepository = [[LMBTripRepository alloc] init];

    [self.tripRepository getOffersFrom:self.airport to:self.destination on:self.date success:^(NSArray *result) {
        self.resultshadow = result;
        self.results = self.resultshadow;
        [self.tableView reloadData ];
    } failure:^(NSError *error) {
        NSLog(@"Outer error!");
    }];
    //self.results = [self.tripRepository getOffersFrom:@"Stockholm/Arlanda" To:@"Kreta" On:@"2013-03-20"];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([searchText length] > 0)
    {
    
        NSMutableArray *tmpArr = [NSMutableArray array];
        [self.resultshadow enumerateObjectsUsingBlock:^(LMBOffer *obj, NSUInteger idx, BOOL *stop) {
            if([obj.destination hasPrefix:searchText]){
                [tmpArr addObject:obj];
            }
        }];
        self.results = tmpArr;
        [self.tableView reloadData];
    }
    else
    {
        self.results = self.resultshadow;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LMBTripTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString *item = [self.results objectAtIndex:indexPath.row];
    cell.titleLabel.text = ((LMBOffer*)item).destination;
    cell.price.text = [((LMBOffer*)item).price stringValue];
    //cell.price.text = ((LMBOffer*)item).destination;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
