//
//  SoundEffect.m
//  GLPaint
//
//  Created by Justin Hackett on 2/10/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import "SoundEffect.h"


@implementation SoundEffect

AVAudioPlayer *myPlayer;

@synthesize myAudioPlayer;


// Creates a sound effect object from the specified sound file
+ (id)soundEffectWithContentsOfFile:(NSString *)aPath {
    
    if (aPath) {
        return [[SoundEffect alloc] initWithContentsOfFile:aPath];
    }
    return nil;
}



// Initializes a sound effect object with the contents of the specified sound file
- (id)initWithContentsOfFile:(NSString *)path {
        
    NSLog(@"initWithContentsOfFile fired in SoundEffect");
    
    self = [super init];
    
	// Gets the file located at the specified path.
    if (self != nil) {
        NSURL *aFileURL = [NSURL fileURLWithPath:path isDirectory:NO];
        
		// If the file exists, calls Core Audio to create a system sound ID.
        if (aFileURL != nil)  {
            
            //Create the AVAudioPlayer
            AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:aFileURL error:NULL];
            self.myAudioPlayer = player;
            [myAudioPlayer setDelegate:self];
            [myAudioPlayer prepareToPlay];
            
        } else {
            NSLog(@"Error loading sound at path: ");
            self = nil;
        }
    }
    return self;
}


// Releases resouces when no longer needed.

-(void)dealloc {
 NSLog(@"dealloc fired in SoundEffect");

    [myAudioPlayer setDelegate:nil];
}


// Plays the sound associated with a sound effect object.
-(void)play {
    
	[myAudioPlayer play];
    
}

@end
