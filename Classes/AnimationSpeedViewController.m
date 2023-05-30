    //
//  AnimationSpeedViewController.m
//  LearnToWrite
//
//  Created by Justin Hackett on 6/12/10.
//  Copyright 2010 JH Productions. All rights reserved.
//

#import "AnimationSpeedViewController.h"
#import "ChalkboardViewController.h"

@implementation AnimationSpeedViewController

@synthesize myAnimationSpeedSlider;
@synthesize globalSoundSwitch;
@synthesize strokeSoundSwitch;
@synthesize chalkboardViewController;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.globalSoundSwitch = chalkboardViewController.globalSoundSwitch;
    //self.strokeSoundSwitch = chalkboardViewController.strokeSoundSwitch;
	
	UIImage *stetchLeftTrack = [[UIImage imageNamed:@"redslide.png"]
								stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
	UIImage *stetchRightTrack = [[UIImage imageNamed:@"whiteslide.png"]
								 stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
	[self.myAnimationSpeedSlider setThumbImage: [UIImage imageNamed:@"slider_ball.png"] forState:UIControlStateNormal];
	[self.myAnimationSpeedSlider setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
	[self.myAnimationSpeedSlider setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
	
}

- (IBAction)globalSoundSettingChanged:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"globalSoundSettingChanged" object:self];
    NSLog(@"globalSoundSettingChanged fired in AnimationSpeedViewController");
}

- (IBAction)strokeSoundSettingChanged:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"strokeSoundSettingChanged" object:self];
    NSLog(@"strokeSoundSettingChanged fired in AnimationSpeedViewController");
}

-(IBAction)playSoundForButton:(id)sender {
    [self.chalkboardViewController playTheClickSound];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    //[super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning in AnimationSpeedViewController.");

    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.myAnimationSpeedSlider = nil;
    self.globalSoundSwitch = nil;
    self.strokeSoundSwitch = nil;
    
    NSLog(@"viewDidUnload fired in AnimationSpeedViewController popover");
    
}


- (void)dealloc {
    
    
    NSLog(@"dealloc fired in AnimationSpeedViewController popover");

}


@end
