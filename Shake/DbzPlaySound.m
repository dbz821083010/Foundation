//
//  DbzPlaySound.m
//  Shake
//
//  Created by Sinoyd on 16/3/18.
//  Copyright © 2016年 LGQ. All rights reserved.
//

#import "DbzPlaySound.h"

@implementation DbzPlaySound

-(id)initForPlayingVibrate{
    self = [super init];
    if (self) {
        soundID = kSystemSoundID_Vibrate;
    }
    
    return self;
}

-(id)initForPlayingSystemSoundEffectWith:(NSString *)resourceName ofType:(NSString *)type
{
    if (self == [super init]) {
        NSString *path = [[NSBundle bundleWithIdentifier:@"com.apple.UIKIT"] pathForResource:resourceName ofType:type];
        if (path) {
            SystemSoundID theSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &theSoundID);
            if(error == kAudioServicesNoError){
                soundID = theSoundID;
            }else{
                NSLog(@"Failed to create sound ");
            }
        }
    }
    return  self;
}


-(id)initForPlayingSoundEffectWith:(NSString *)filename{
    
    self = [super init];
    if (self) {
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:filename  withExtension:nil];
        if(fileURL != nil){
            SystemSoundID theSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &theSoundID);
            if (error == kAudioServicesNoError){
                soundID = theSoundID;
            }else{
                NSLog(@"Failed to create sound ");
            }
        }
    }
    return self;
}

-(void)play{
    
    AudioServicesPlayAlertSound(soundID);
}

-(void)dealloc{
    AudioServicesDisposeSystemSoundID(soundID);
}
@end
