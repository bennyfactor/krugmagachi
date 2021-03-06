//
//  krugRSSViewController.m
//  krugmagachi
//
//  Created by Ben Lamb on 12​08.30.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "krugRSSViewController.h"
#import "KMXMLParser.h"

@interface krugRSSViewController ()

@end

@implementation krugRSSViewController

@synthesize navtitle = _navtitle;
@synthesize parseResults = _parseResults;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   
    //Sets the navigation bar title
    
    
    KMXMLParser *parser = [[KMXMLParser alloc]  initWithURL:@"http://krugman.blogs.nytimes.com/feed/" delegate:nil];
    
    _parseResults = [parser posts];
    
    self.navtitle.title = @"News";
    self.navtitle.rightBarButtonItem.title = @"Mark all read";

    
}




- (void)viewDidUnload
{
    [self setNavtitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Nav button



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    
    // Return the number of sections.
    
    return 1;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    // Return the number of rows in the section.
    
    return self.parseResults.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Check if cell is nil. If it is create a new instance of it
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier];
        
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [[self.parseResults objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    cell.detailTextLabel.text = [[self.parseResults objectAtIndex:indexPath.row]  objectForKey:@"summary"];
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
    
}


/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}*/

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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
    
    /*    WebViewController *vc = [[WebViewController alloc] init];
     
     vc.url = [NSURL URLWithString:[[self.parseResults objectAtIndex:indexPath.row]  objectForKey:@"link"] ];
     
     [self.navigationController pushViewController:vc animated:YES]; 
     */

    //turn off check mark
    UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
    if (newCell.accessoryType == UITableViewCellAccessoryDetailDisclosureButton) {
        newCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    
    //open URL in broswer
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[[self.parseResults objectAtIndex:indexPath.row]  objectForKey:@"link"] ]];



}


- (IBAction)markRead:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Our control point is being captured" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
@end
