//
//  BrushTableViewController.m
//  LearnToWrite
//
//  Created by Justin Hackett on 2/15/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import "BrushTableViewController.h"
#import "MainCell.h"
#import "ChalkboardView.h"
#import "SoundEffect.h"
#import "ChalkboardViewController.h"

@implementation BrushTableViewController

@synthesize lastIndexPath;
@synthesize brushPatternsList;
@synthesize imagesList;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/


- (void)viewDidLoad {
    
    NSLog(@"viewDidLoad fired in BrushTableViewController");

	NSArray *listArray = [[NSArray alloc] initWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",
				  @"8.png",@"9.png",@"10.png",@"11.png",@"12.png",@"13.png",@"14.png",@"15.png",@"16.png",
				  @"17.png",@"18.png",@"19.png",@"20.png",@"21.png",@"22.png",nil];
	
	//NSLog(@"Value of myBrushImage at first is %@", [ChalkboardView getMyBrushImage]);
	
	NSArray *array = [[NSArray alloc] initWithObjects:@"1PastelPurp_iPad.png",@"2WhiteDiamond_iPad.png",@"3GreenSwirl_iPad.png",
					  @"4ColorDots_iPad.png",@"5Fingerprint_iPad.png",@"6Particle_iPad.png",@"7RedSquare_iPad.png",@"8YellowSun_iPad.png",
					  @"9BluePencil_iPad.png",@"10BroncoOrange_iPad.png",@"11GreySquare_iPad.png",@"12BrownDots_iPad.png",
					  @"13PurpleHaze_iPad.png",@"14GreyConfetti_iPad.png",@"15BlueStripe_iPad.png",@"16SolidRed_iPad.png",
					  @"17SolidGreen_iPad.png",@"18SolidBlue_iPad.png",@"19SolidPink_iPad.png",@"20SolidOrange_iPad.png",
					  @"21SolidYellow_iPad.png",@"22WhiteFlat_iPad.png",nil];
	
	//assign it to the variable brushPatternsList
	self.brushPatternsList = array;
	self.imagesList = listArray;
	
	//Release *array.
	
	NSLog(@"brushPatternsList array is %@\n", brushPatternsList);
	
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

//TODO: implement this?

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    NSLog(@"didReceiveMemoryWarning fired in BrushTableViewController");

    
    // Release any cached data, images, etc that aren't in use.
}


//TODO: implement this?
- (void)viewDidUnload {
    
    NSLog(@"viewDidUnload in BrushTableViewController");

//	self.brushPatternsList = nil;
//	self.imagesList = nil;
//	clickSound = nil;
    [super viewDidUnload];
 
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



#pragma mark -
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [imagesList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath
{
    return 60.0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"BrushImageCell";
    
    /*
     * Here we get the cell at index
     */
#if 0
    // With a basic behaviour we must declare a variable called cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
#endif
    // We declared cell as an instance var so no need to declare it!
    cell = (MainCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    /*
     * If the cell is nil, it is not yet created, thus we need to create a new
     */
    if (cell == nil) {
#if 0
        // This is how to create a cell with a regular type of cells
        //cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        //cell.text = @"Cocoa Cast demo";
#endif
        // This is how to create a cell from loading the .xib file containing our cell
        [[NSBundle mainBundle] loadNibNamed:@"MainCell" owner:self options:nil];
        NSLog(@"New cell created");
    }
    
    // Set up the cell...
    /*
     * Here we can set the content of the displayed cell
     */
	
	[cell setBrushImage:[imagesList objectAtIndex:indexPath.row]];
	
	NSInteger row = [indexPath row];
	NSInteger oldRow = [lastIndexPath row];
	cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? 
    UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	
    return cell;
}

//TODO: Use this for selection?
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	
	
	
	//TODO: use this for something?
	
	int newRow = [indexPath row];
    int oldRow = (lastIndexPath != nil) ? [lastIndexPath row] : -1;
    
    if (newRow != oldRow)
    {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:
                                    indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath: 
                                    lastIndexPath]; 
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        lastIndexPath = indexPath;
    }
	
	//load the click sound and play it - jh
	NSBundle *mainBundle = [NSBundle mainBundle];
	clickSound =  [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"Click" ofType:@"caf"]];
	[clickSound play];
	
	NSLog(@"Row index number of the cell selected is %d\n", [indexPath row]);
	NSString *selectedBrushImage = [brushPatternsList objectAtIndex:[indexPath row]];
	NSLog(@"Name of selectedBrushImage file is %@", selectedBrushImage);
	[ChalkboardView setMyBrushImage:[UIImage imageNamed:selectedBrushImage]];
	NSLog(@"Value of myBrushImage is after selecting it in the menu is %@\n", [ChalkboardView getMyBrushImage]);

	//post notification so the two ChalkboardViewControllers can change the brush and, so the iPad one can dismiss the popover - j
	[[NSNotificationCenter defaultCenter] postNotificationName:@"brushHasBeenSelected" object:self];
	
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}


/*
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
*/
/*
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
*/
/*
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
    
    return cell;
}
*/
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    // AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
    // [self.navigationController pushViewController:anotherViewController];
    // [anotherViewController release];
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark -



@end

