//
//  krugMasterViewController.h
//  krugmagachi
//
//  Created by Ben Lamb on 12​08.29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class krugDetailViewController;

@interface krugMasterViewController : UITableViewController

@property (strong, nonatomic) krugDetailViewController *detailViewController;

@end
