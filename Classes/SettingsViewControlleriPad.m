//
//  SettingsViewControlleriPad.m
//  LearnToWrite
//
//  Created by Justin Hackett on 4/16/12.
//  Copyright (c) 2012 JH Productions. All rights reserved.
//

#import "SettingsViewControlleriPad.h"
//#import "AppDelegateiPhone.h"
#import "SpeedSettingCelliPad.h"
#import "LetterOptionsCelliPad.h"
#import "ButtonSelectionCelliPad.h"
#import "ChalkboardViewController.h"
#import "VolumeSliderCelliPad.h"
#import "StrokeVolumeSliderCelliPad.h"

@implementation SettingsViewControlleriPad

@synthesize speedSettingCell;
@synthesize paperLinesCell;
@synthesize chalkboardViewController;
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
    NSLog(@"didReceiveMemoryWarning fired in chalkboardViewControlleriPad");

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

    NSLog(@"viewDidLoad fired in SettingsViewController");

}

/*
 //Not using this method for now. I would connect it to the saveButton in the nib.
 -(IBAction)save:(id)sender {
 }
 */

#pragma mark - Need These Nil's?
- (void)viewDidUnload
{
    NSLog(@"viewDidUnload fired in SettingsViewControlleriPad");
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.speedSettingCell = nil;
    self.paperLinesCell = nil;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.navigationItem.title = @"Settings";
    //[self.chalkboardViewController playTheClickSound];
    
    NSLog(@"viewWillAppear fired in SettingsViewController");

}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self updateUpperLowerIcon];
    [self updateUpperIcon];
    [self updateLowerIcon];
    [self updateNumberIcon];
    
    NSLog(@"viewDidAppear fired in SettingsViewController");

}


#pragma mark - Update Recording Icons

-(void)updateUpperLowerString:(NSString *)text {
    
    self.upperLowerString = text;

    
}

-(void)updateUpperLowerIcon {
    
    if ([upperLowerString isEqualToString:@"0"] == YES) {
        
        self.upperLowerStrokeImageView.hidden = YES;
        self.upperLowerStrokeLabel.hidden = YES;
        NSLog(@"updateUpperLowerIcon fired for upperLowerString = 0");
    }
    
    if ([upperLowerString isEqualToString:@"0"] == NO) {
        
        self.upperLowerStrokeLabel.text = self.upperLowerString;
        self.upperLowerStrokeImageView.hidden = NO;
        self.upperLowerStrokeLabel.hidden = NO;
        NSLog(@"updateUpperLowerIcon fired for upperLowerString != 0");

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

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
            NSLog(@"first IF statement is running for  ButtonSelectionCelliPad in SettingsViewControlleriPad");

            static NSString *ButtonSelectionCellIdentifier = @"ButtonSelectionCell";
            
            ButtonSelectionCelliPad *cell = (ButtonSelectionCelliPad *)[tableView dequeueReusableCellWithIdentifier:ButtonSelectionCellIdentifier];
            
            if (!cell) {
                
                //UINib *soundEffectCellNib = [UINib nibWithNibName:@"ButtonSelectionCelliPad" bundle:nil];
                //[soundEffectCellNib instantiateWithOwner:self options:nil];
                
                [[NSBundle mainBundle] loadNibNamed:@"ButtonSelectionCelliPad" owner:self options:nil];
                
                //Set the alphabetViewController as the delegate of the ButtonSelectionCelliPad.
                self.buttonSelectionCell.delegate = self.chalkboardViewController.alphabetViewController;
                
                NSInteger index = self.chalkboardViewController.alphabetViewController.selectedSwitchSegment;
                self.buttonSelectionCell.mySegmentedControl.selectedSegmentIndex = index;                
                
                cell = self.buttonSelectionCell;
                
                //cell = self.buttonSelectionCell;
                //self.buttonSelectionCell = nil;
                
                //cell.cellTextLabel.text = @"Voice Sounds";
                
            }
            
            return cell;
            NSLog(@"Returned ButtonSelectionCelliPad in SettingsViewControlleriPad");

        }//end if row == 0
        
    }
    
    if (indexPath.section == PAPER_LINES_SECTION) {
        
        if (indexPath.row == 0) {
            NSLog(@"first IF statement is running for  LetterOptionsCelliPad in SettingsViewControlleriPad");

            static NSString *SoundEffectCellIdentifier = @"PaperLinesCell";
            
            LetterOptionsCelliPad *cell = (LetterOptionsCelliPad *)[tableView dequeueReusableCellWithIdentifier:SoundEffectCellIdentifier];
            
            if (!cell) {
                
                UINib *letterOptionsCellNib = [UINib nibWithNibName:@"LetterOptionsCelliPad" bundle:nil];
                [letterOptionsCellNib instantiateWithOwner:self options:nil];

                self.paperLinesCell.delegate = self.chalkboardViewController;
                cell = self.paperLinesCell;
                self.paperLinesCell = nil;
                
            }
            
            return cell;
            NSLog(@"Returned PaperLinesCelliPad in SettingsViewControlleriPad");

        }//end if row == 1
    }
    
    if (indexPath.section == ANIMATION_SECTION) {
        
        static NSString *SpeedSettingCellIdentifier = @"SpeedSettingCell";
        
        SpeedSettingCelliPad *cell = (SpeedSettingCelliPad *)[tableView dequeueReusableCellWithIdentifier:SpeedSettingCellIdentifier];
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
            NSLog(@"first IF statement is running for  SpeedSettingCelliPad in SettingsViewControlleriPad");

            UINib *speedSettingCellNib = [UINib nibWithNibName:@"SpeedSettingCelliPad" bundle:nil];
            [speedSettingCellNib instantiateWithOwner:self options:nil];

        }
        
        //TO DO: Create and edit the speedSettingCell for iPad version.
        //Pass the reference of the ChalkboardViewControlleriPhone on to the cell.
        self.speedSettingCell.chalkboardViewController = self.chalkboardViewController;
        cell = self.speedSettingCell;
        
        //self.speedSettingCell = nil;
        
        return cell;
        NSLog(@"Returned SpeedSettingsCelliPad in SettingsViewControlleriPad");

    }

    //THIS WILL CHANGE WHEN I GET THE SOUND CELLS DONE.
    if (indexPath.section == VOICE_SOUNDS_SECTION) {
        
        
        //if (indexPath.row == 0) {
        
        static NSString *SoundEffectCellIdentifier = @"VolumeCell";
        
        VolumeSliderCelliPad *cell = (VolumeSliderCelliPad *)[tableView dequeueReusableCellWithIdentifier:SoundEffectCellIdentifier];
        
        if (!cell) {
            NSLog(@"first IF statement is running for  VolumeSliderCelliPad in SettingsViewControlleriPad");

            UINib *volumeSliderCellNib = [UINib nibWithNibName:@"VolumeSliderCelliPad" bundle:nil];
            [volumeSliderCellNib instantiateWithOwner:self options:nil];

            self.volumeSliderCell.delegate = self.chalkboardViewController;
            cell = self.volumeSliderCell;
            self.volumeSliderCell = nil;
            
        }
        
        return cell;
        NSLog(@"Returned VolumeSliderCelliPad in SettingsViewControlleriPad");

    }//end if row == 0
    
    if (indexPath.section == STROKE_SOUNDS_SECTION) {
        
        static NSString *SoundEffectCellIdentifier = @"StrokeVolumeCell";
        
        StrokeVolumeSliderCelliPad *cell = (StrokeVolumeSliderCelliPad *)[tableView dequeueReusableCellWithIdentifier:SoundEffectCellIdentifier];
        
        if (!cell) {
            NSLog(@"first IF statement is running for  StrokeVolumeSliderCelliPad in SettingsViewControlleriPad");

            UINib *soundEffectCellNib = [UINib nibWithNibName:@"StrokeVolumeSliderCelliPad" bundle:nil];
            [soundEffectCellNib instantiateWithOwner:self options:nil];

            self.strokeVolumeSliderCell.delegate = self.chalkboardViewController;
            cell = self.strokeVolumeSliderCell;
            self.strokeVolumeSliderCell = nil;
            
        }
        
        return cell;
        NSLog(@"Returned StrokeVolumeSliderCelliPad in SettingsViewControlleriPad");

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
            return 71;
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
    
    [self.chalkboardViewController playTheClickSound];
}


@end


