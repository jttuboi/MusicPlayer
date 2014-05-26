//
//  Player.m
//  MusicPlayer
//
//  Created by Jairo on 25/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import "Player.h"

@implementation Player

-(void)iniciaTrack:(Track*)track {
    NSLog(@"Player::iniciaTrack");
    
    NSURL *urlEspecifico = [[NSBundle mainBundle] URLForResource:track.nome withExtension:track.extensao];
    NSError *error;
    
    self.audioPlayer.delegate = self;

    self.audioPlayer = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:urlEspecifico error:&error];
}



-(void)iniciaTrack:(Track*)track comVolume:(float)volume {
    NSLog(@"Player::iniciaTrack");
    
    [self iniciaTrack:track];
    self.audioPlayer.volume = volume;
}



-(void)playTrack {
    [self.audioPlayer play];
}



-(void)pauseTrack {
    [self.audioPlayer pause];
}



-(void)stopTrack {
    [self.audioPlayer stop];
}



-(void)setVolume:(float)valor {
    self.audioPlayer.volume = valor;
}



-(float)getVolume {
    return self.audioPlayer.volume;
}



-(BOOL)isTocando {
    return self.audioPlayer.playing;
}



-(void)setTempoAtual:(float)valor {
    self.audioPlayer.currentTime = valor;
}



-(NSTimeInterval)getTempoAtual {
    return self.audioPlayer.currentTime;
}



-(float)getTempoDuracao {
    return self.audioPlayer.duration;
}


-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"Player::audioPlayerDidFinishPlaying");

}

@end
