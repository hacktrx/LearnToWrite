//
//  SettingsViewController.m
//  LearnToWrite
//
//  Created by Justin Hackett on 9/25/10.
//  Copyright (c) 2010 Steamer Trunk Records. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppDelegateiPhone.h"
#import "SpeedSettingCell.h"
#import "LetterOptionsCell.h"
#import "ButtonSelectionCell.h"
#import "ChalkboardViewControlleriPhone.h"
#import "VolumeSliderCell.h"
#import "StrokeVolumeSliderCell.h"

@implementation SettingsViewController

@synthesize speedSettingCell;
@synthesize paperLinesCell;
@synthesize chalkboardViewControlleriPhone;
@synthesize buttonSelectionCell;
@synthesize volumeSliderCell;
@synthesize strokeVolumeSliderCell;
@synthesize upperLowerStrokeImageView;
@synthesize upperLowerStrokeLabel;
@synthesize upperStrokeImageView;
@synthesize upperStrokeLabel;
@synthesize lowerStrokeImageView;
@synthesize lowerStrokeLabel;
@synthesize numberStrokeImageView;
@synthesize numberStrokeLabel;
@synthesize upperLowerString;
@synthesize upperString;
@synthesize lowerString;
@synthesize numberString;

//@synthesize saveButton;

#define LETTER_STYLES_SECTION 0
#define PAPER_LINES_SECTION 1
#define ANIMATION_SECTION 2
#define VOICE_SOUNDS_SECTION 3
#define STROKE_SOUNDS_SECTION 4

/*
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning fired in settingsViewController");

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    //Use this to add the saveButton to the nav bar.
    //self.navigationItem.rightBarButtonItem = self.saveButton;
}

/*
//Not using this method for now. I would connect it to the saveButton in the nib.
-(IBAction)save:(id)sender {
}
*/

#pragma mark - Need These Nil's?
- (void)viewDidUnload
{
    NSLog(@"viewDidUnload fired in SettingsViewController");
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.speedSettingCell = nil;
    self.paperLinesCell = nil;

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Settings";
    [self.chalkboardViewControlleriPhone playTheClickSound];
    
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateUpperLowerIcon];
    [self updateUpperIcon];
    [self updateLowerIcon];
    [self updateNumberIcon];
}




#pragma mark - Update Recording Icons

-(void)updateUpperLowerString:(NSString *)text {
    
    self.upperLowerString = text;

}

-(void)updateUpperLowerIcon {

    if ([upperLowerString isEqualToString:@"0"] == YES) {
        
        self.upperLowerStrokeImageView.hidden = YES;
        self.upperLowerStrokeLabel.hidden = YES;
    }
    
    if ([upperLowerString isEqualToString:@"0"] == NO) {
        
        self.upperLowerStrokeLabel.text = self.upperLowerString;
        self.upperLowerStrokeImageView.hidden = NO;
        self.upperLowerStrokeLabel.hidden = NO;
    }
    
}




-(void)updateUpperString:(NSString *)text {
    
    self.upperString = text;
    
}

-(void)updateUpperIcon {
    
    if ([upperString isEqualToString:@"0"] == YES) {
        
        self.upperStrokeImageView.hidden = YES;
        self.upperStrokeLabel.hidden = YES;
    }
    
    if ([upperString isEqualToString:@"0"] == NO) {
        
        self.upperStrokeLabel.text = self.upperString;
        self.upperStrokeImageView.hidden = NO;
        self.upperStrokeLabel.hidden = NO;
    }
    
}





-(void)updateLowerString:(NSString *)text {
    
    self.lowerString = text;
    
}

-(void)updateLowerIcon {
    
    if ([lowerString isEqualToString:@"0"] == YES) {
        
        self.lowerStrokeImageView.hidden = YES;
        self.lowerStrokeLabel.hidden = YES;
    }
    
    if ([lowerString isEqualToString:@"0"] == NO) {
        
        self.lowerStrokeLabel.text = self.lowerString;
        self.lowerStrokeImageView.hidden = NO;
        self.lowerStrokeLabel.hidden = NO;
    }
    
}





-(void)updateNumberString:(NSString *)text {
    
    self.numberString = text;
    
}

-(void)updateNumberIcon {
    
    if ([numberString isEqualToString:@"0"] == YES) {
        
        self.numberStrokeImageView.hidden = YES;
        self.numberStrokeLabel.hidden = YES;
    }
    
    if ([numberString isEqualToString:@"0"] == NO) {
        
        self.numberStrokeLabel.text = self.numberString;
        self.numberStrokeImageView.hidden = NO;
        self.numberStrokeLabel.hidden = NO;
    }
    
}



/*
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
*/

/*
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
*/

/*Deleted for v4.0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}
*/

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSInteger rows = 0;
    
    /*
     The number of rows depends on the section.
     In the case of ingredients, if editing, add a row in editing mode to present an "Add Ingredient" cell.
	 */
    switch (section) {
        case LETTER_STYLES_SECTION:
            rows = 1;
            break;
        case PAPER_LINES_SECTION:
            rows = 1;
            break;
        case ANIMATION_SECTION:
            rows = 1;
            break;
        case VOICE_SOUNDS_SECTION:
            rows = 1;
            break;
        case STROKE_SOUNDS_SECTION:
            rows = 1;
            break;
		default:
            break;
    }
    return rows;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *title = nil;
    
    // Return a title or nil as appropriate for the section.
    switch (section) {
        case LETTER_STYLES_SECTION:
            title = @"Letter Styles";
            break;
        case PAPER_LINES_SECTION:
            title = @"Paper Lines";
            break;
        case ANIMATION_SECTION:
            title = @"Animation Speed";
            break;
        case VOICE_SOUNDS_SECTION:
            title = @"Voice Level";
            break;
        case STROKE_SOUNDS_SECTION:
            title = @"Stroke Volume";
            break;
        default:
            break;
    }
    
    return title;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    //THIS WILL CHANGE WHEN I GET THE SOUND CELLS DONE.
    if (indexPath.section == LETTER_STYLES_SECTION) {
        
        if (indexPath.row == 0) {
            
            static NSString *ButtonSelectionCellIdentifier = @"ButtonSelectionCell";
            
            ButtonSelectionCell *cell = (ButtonSelectionCell *)[tableView dequeueReusableCellWithIdentifier:ButtonSelectionCellIdentifier];
            
            if (!cell) {
                
                //UINib *soundEffectCellNib = [UINib nibWithNibName:@"ButtonSelectionCell" bundle:nil];
                //[soundEffectCellNib instantiateWithOwner:self options:nil];
                
                [[NSBundle mainBundle] loadNibNamed:@"ButtonSelectionCell" owner:self options:nil];
                
                //Set the alphabetViewController as the delegate of the ButtonSelectionCell.
                self.buttonSelectionCell.delegate = self.chalkboardViewControlleriPhone.alphabetViewController;
                
                NSInteger index = self.chalkboardViewControlleriPhone.alphabetViewController.selectedSwitchSegment;
                self.buttonSelectionCell.mySegmentedControl.selectedSegmentIndex = index;                
                
                cell = self.buttonSelectionCell;
                
                //cell = self.buttonSelectionCell;
                //self.buttonSelectionCell = nil;
                
                //cell.cellTextLabel.text = @"Voice Sounds";
        
                }
        
        return cell;
        
    }//end if row == 0
    
}
    if (indexPath.section == PAPER_LINES_SECTION) {

        if (indexPath.row == 0) {
        
            static NSString *SoundEffectCellIdentifier = @"PaperLinesCell";
            
            LetterOptionsCell *cell = (LetterOptionsCell *)[tableView dequeueReusableCellWithIdentifier:SoundEffectCellIdentifier];
            
            if (!cell) {
                
                UINib *letterOptionsCellNib = [UINib nibWithNibName:@"LetterOptionsCell" bundle:nil];
                [letterOptionsCellNib instantiateWithOwner:self options:nil];
                
                self.paperLinesCell.delegate = self.chalkboardViewControlleriPhone;
                cell = self.paperLinesCell;
                self.paperLinesCell = nil;

        }
        
        return cell;
        
    }//end if row == 1
}
    
    if (indexPath.section == ANIMATION_SECTION) {

        static NSString *SpeedSettingCellIdentifier = @"SpeedSettingCell";
        
        SpeedSettingCell *cell = (SpeedSettingCell *)[tableView dequeueReusableCellWithIdentifier:SpeedSettingCellIdentifier];
        /*
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"SpeedSettingCell" owner:self options:nil];
            
            UIImage *stetchLeftTrack = [[UIImage imageNamed:@"redslide.png"]
                                        stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
            UIImage *stetchRightTrack = [[UIImage imageNamed:@"whiteslide.png"]
                                         stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
            [speedSettingCell.myAnimationSpeedSlider setThumbImage: [UIImage imageNamed:@"slider_ball.png"] forState:UIControlStateNormal];
            [speedSettingCell.myAnimationSpeedSlider setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
            [speedSettingCell.myAnimationSpeedSlider setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
        }
        */
        
        if (!cell) {
            
            UINib *speedSettingCellNib = [UINib nibWithNibName:@"SpeedSettingCell" bundle:nil];
            [speedSettingCellNib instantiateWithOwner:self options:nil];
            
        }
        
        //Pass the reference of the ChalkboardViewControlleriPhone on to the cell.
        self.speedSettingCell.chalkboardViewController = self.chalkboardViewControlleriPhone;
        cell = speedSettingCell;
    
        //self.speedSettingCell = nil;
        
        return cell;
        
    }
    
    //THIS WILL CHANGE WHEN I GET THE SOUND CELLS DONE.
    if (indexPath.section == VOICE_SOUNDS_SECTION) {
        
        
        //if (indexPath.row == 0) {
            
            static NSString *SoundEffectCellIdentifier = @"VolumeCell";
            
            VolumeSliderCell *cell = (VolumeSliderCell *)[tableView dequeueReusableCellWithIdentifier:SoundEffectCellIdentifier];
            
            if (!cell) {
                
                UINib *volumeSliderCellNib = [UINib nibWithNibName:@"VolumeSliderCell" bundle:nil];
                [volumeSliderCellNib instantiateWithOwner:self options:nil];
                
                self.volumeSliderCell.delegate = self.chalkboardViewControlleriPhone;
                cell = self.volumeSliderCell;
                self.volumeSliderCell = nil;
                                
            }
            
            return cell;
            
        }//end if row == 0
        
        if (indexPath.section == STROKE_SOUNDS_SECTION) {
            
            static NSString *SoundEffectCellIdentifier = @"StrokeVolumeCell";
            
            StrokeVolumeSliderCell *cell = (StrokeVolumeSliderCell *)[tableView dequeueReusableCellWithIdentifier:SoundEffectCellIdentifier];
            
            if (!cell) {
                
                UINib *soundEffectCellNib = [UINib nibWithNibName:@"StrokeVolumeSliderCell" bundle:nil];
                [soundEffectCellNib instantiateWithOwner:self options:nil];
                
                self.strokeVolumeSliderCell.delegate = self.chalkboardViewControlleriPhone;
                cell = self.strokeVolumeSliderCell;
                self.strokeVolumeSliderCell = nil;
                                
            }
            
            return cell;
            
        }//end if row == 0
        
    //}
    
    return nil;
}


/*
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	
    
    if (indexPath == 0) {
        
    UIImage *stetchLeftTrack = [[UIImage imageNamed:@"redslide.png"]
                                stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
    UIImage *stetchRightTrack = [[UIImage imageNamed:@"whiteslide.png"]
                                 stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
    [speedSettingCell.myAnimationSpeedSlider setThumbImage: [UIImage imageNamed:@"slider_ball.png"] forState:UIControlStateNormal];
    [speedSettingCell.myAnimationSpeedSlider setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
    [speedSettingCell.myAnimationSpeedSlider setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
    
    }
    

}
*/


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == LETTER_STYLES_SECTION) {
        
        if (indexPath.row == 0) {
            return 79;
        }
    }
    
    if (indexPath.section == PAPER_LINES_SECTION) {
        
        if (indexPath.row == 0) {
            return 44;
        }
    }
    return 60;
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
     [detailViewController release];
     */
}




-(IBAction)playSoundForButton:(id)sender {
    
    [self.chalkboardViewControlleriPhone playTheClickSound];
}


@end


