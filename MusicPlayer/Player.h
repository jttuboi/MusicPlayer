//
//  Player.h
//  MusicPlayer
//
//  Created by Jairo on 25/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import <AVFoundation/AVAudioPlayer.h>
#import "Track.h"

@interface Player : NSObject<AVAudioPlayerDelegate>

/*
 * Atributos importantes
 */
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

/*
 * Métodos
 */
-(void)iniciaTrack:(Track*)track;
-(void)iniciaTrack:(Track*)track comVolume:(float)volume;
-(void)playTrack;
-(void)pauseTrack;
-(void)stopTrack;

/*
 * Métodos set/get
 */
-(void)setVolume:(float)valor;
-(float)getVolume;
-(BOOL)isTocando;
-(void)setTempoAtual:(float)valor;
-(NSTimeInterval)getTempoAtual;
-(float)getTempoDuracao;

@end
