//
//  LMBTripTableViewController.h
//  LastMinuteBrewery
//
//  Created by Erik Jonsson on 4/15/13.
//  Copyright (c) 2013 BrewBros Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMBTripTableViewController : UITableViewController<UISearchBarDelegate>

@property (nonatomic, strong) NSString *airport, *destination, *date;
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
@end
