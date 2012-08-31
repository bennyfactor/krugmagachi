//
//  krugRSSViewController.h
//  krugmagachi
//
//  Created by Ben Lamb on 12​08.30.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface krugRSSViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *parseResults;

- (IBAction)markRead:(id)sender;
@end
