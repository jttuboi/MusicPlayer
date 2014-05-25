//
//  MeuAudioPlayer.m
//  MusicPlayer
//
//  Created by Jairo on 22/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import "MeuAudioPlayer.h"

@implementation MeuAudioPlayer


/*
 * Inicia o Player com nome e extensao
 */
- (void)initPlayer:(NSString*) audioFile fileExtension:(NSString*)fileExtension {
    NSURL *audioFileLocationURL = [[NSBundle mainBundle] URLForResource:audioFile withExtension:fileExtension];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileLocationURL error:&error];
    
    self.audioPlayer.delegate = self;
}

/*
 * Play
 */
- (void)playAudio {
    [self.audioPlayer play];
}

/*
 * Pause
 */
- (void)pauseAudio {
    [self.audioPlayer pause];
}

/*
 * Format the float time values like duration
 * to format with minutes and seconds
 */
-(NSString*)timeFormat:(float)value{
    float minutes = floor(lroundf(value)/60);
    float seconds = lroundf(value) - (minutes * 60);
    
    int roundedSeconds = (int) lroundf(seconds);
    int roundedMinutes = (int) lroundf(minutes);
    
    NSString *time = [[NSString alloc]
                      initWithFormat:@"%d:%02d",
                      roundedMinutes, roundedSeconds];
    return time;
}

/*
 * To set the current Position of the
 * playing audio File
 */
- (void)setCurrentAudioTime:(float)value {
    [self.audioPlayer setCurrentTime:value];
}

/*
 * Get the time where audio is playing right now
 */
- (NSTimeInterval)getCurrentAudioTime {
    return [self.audioPlayer currentTime];
}

/*
 * Get the whole length of the audio file
 */
- (float)getAudioDuration {
    return [self.audioPlayer duration];
}

-(void)setVolume:(float)value {
    [self.audioPlayer setVolume:value];
}

-(float)getVolume {
    return [self.audioPlayer volume];
}

-(BOOL)getPlaying {
    return self.audioPlayer.playing;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)data successfully:(BOOL)flag{
    NSLog(@"my log");
    self.audioPlayer = nil;
}

@end
