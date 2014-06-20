//
//  AudioPlayerController.h
//  MusicPlayer
//
//  Created by Jairo on 25/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Track.h"

@interface AudioPlayerController : NSObject <AVAudioPlayerDelegate, NSTableViewDataSource, NSTableViewDelegate>

/*
 * Atributos de componentes
 */
@property IBOutlet NSTableView* tabelaView;
@property IBOutlet NSButton* botaoAdicionaTrack;
@property IBOutlet NSButton* botaoRemoveTrack;

@property IBOutlet NSTextField* textoTempoPraTerminar;
@property IBOutlet NSTextField* textoTempoPercorrido;
@property IBOutlet NSButton* botaoPlayPause;
@property IBOutlet NSButton* botaoStop;
@property IBOutlet NSSlider* sliderTempo;

@property IBOutlet NSButton* botaoAumentaVolume;
@property IBOutlet NSButton* botaoDiminuiVolume;
@property IBOutlet NSButton* botaoCalaBocaDoVolume;
@property IBOutlet NSSlider* sliderVolume;

/*
 * Atributos importantes
 */
@property NSMutableArray* listaNomesTrack;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property float volume;

/*
 * Atributos de suporte
 */
@property NSInteger trackAtivo;
@property NSTimer *timer;
@property BOOL tocando;

/*
 * Métodos de actions
 */
-(IBAction)adicionaTrack:(id)sender;
-(IBAction)removeTrack:(id)sender;
-(IBAction)selecionaTrackComClique:(id)sender;
-(IBAction)selecionaTrackComCliqueDuplo:(id)sender;

-(IBAction)playPauseTrack:(id)sender;
-(IBAction)stopTrack:(id)sender;
-(IBAction)recuperaSliderTempo:(id)sender;

-(IBAction)aumentaVolume:(id)sender;
-(IBAction)diminuiVolume:(id)sender;
-(IBAction)silenciaVolume:(id)sender;
-(IBAction)recuperaSliderVolume:(id)sender;
//-(void)atualizaInterface;


/*
 * Métodos de suporte
 */
-(NSString*)formataTempo:(float)valor;

@end
