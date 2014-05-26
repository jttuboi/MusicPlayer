//
//  AppDelegate.h
//  MusicPlayer
//
//  Created by Jairo on 21/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MeuAudioPlayer.h"

@class Track;

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource>
{
    IBOutlet NSView *tabelaaaaaa;
    IBOutlet NSTableView *tabelaaaaaaTable;
    
    
}

@property (weak) IBOutlet NSTextField *linhaSelecionada;



@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSSlider *sliderVolume;
@property (weak) IBOutlet NSTextField *valorVolume;

@property (strong) Track *track;

- (IBAction)aumentaVolume:(id)sender;
- (IBAction)diminuiVolume:(id)sender;
- (IBAction)silenciaVolume:(id)sender;
- (IBAction)recuperaValorParaVolumeDo:(id)sender;
- (void)atualizaInterface;






@property (nonatomic, strong) MeuAudioPlayer *audioPlayer;

@property (weak, nonatomic) IBOutlet NSSlider *currentTimeSlider;
@property (weak, nonatomic) IBOutlet NSButton *playButton;
@property (weak, nonatomic) IBOutlet NSTextField *duration;
@property (weak, nonatomic) IBOutlet NSTextField *timeElapsed;

@property BOOL isPaused;
@property BOOL scrubbing;

@property NSTimer *timer;

- (IBAction)playAudioPressed:(id)playButton;





//@property (weak) IBOutlet NSTableView *tabelaMp3;
@property (nonatomic) NSMutableArray *listaMp3;
@end
