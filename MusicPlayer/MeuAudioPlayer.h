//
//  MeuAudioPlayer.h
//  MusicPlayer
//
//  Created by Jairo on 22/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import <AVFoundation/AVAudioPlayer.h>

@interface MeuAudioPlayer : NSObject<AVAudioPlayerDelegate>

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

// Public methods
- (void)initPlayer:(NSString*) audioFile fileExtension:(NSString*)fileExtension;

- (void)playAudio;
- (void)pauseAudio;
- (void)setCurrentAudioTime:(float)value;

- (float)getAudioDuration;

- (NSString*)timeFormat:(float)value;

- (NSTimeInterval)getCurrentAudioTime;

- (void)setVolume:(float)value;
-(float)getVolume;
-(BOOL)getPlaying;
@end
