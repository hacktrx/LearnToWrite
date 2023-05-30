//
//  SoundEffect.h
//  GLPaint
//
//  Created by Justin Hackett on 2/10/10.
//  Copyright 2010 Steamer Trunk Records. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundEffect : NSObject <AVAudioPlayerDelegate> {

    AVAudioPlayer *myAudioPlayer;
    
}

@property (strong) AVAudioPlayer *myAudioPlayer;


+ (id)soundEffectWithContentsOfFile:(NSString *)aPath;
- (id)initWithContentsOfFile:(NSString *)path;
- (void)play;

@end
