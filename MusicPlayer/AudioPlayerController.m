//
//  AudioPlayerController.m
//  MusicPlayer
//
//  Created by Jairo on 25/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import "AudioPlayerController.h"

@implementation AudioPlayerController

-(id)init {
    NSLog(@"AudioPlayerController::init");
    
    self = [super init];
    if (self) {
        self.listaNomesTrack = [[NSMutableArray alloc] init];
        self.volume = 0.5;
    }
    return self;
}



-(void)awakeFromNib {
    NSLog(@"AudioPlayerController::awakeFromNib");
    
    self.tabelaView.dataSource = self;
    self.tabelaView.delegate = self;
    self.tabelaView.target = self;
    self.tabelaView.action = @selector(selecionaTrackComClique:);
    self.tabelaView.doubleAction = @selector(selecionaTrackComCliqueDuplo:);
    
    self.botaoAdicionaTrack.target = self;
    self.botaoAdicionaTrack.action = @selector(adicionaTrack:);
    
    self.botaoRemoveTrack.target = self;
    self.botaoRemoveTrack.action = @selector(removeTrack:);
    
    self.textoTempoPraTerminar.stringValue = @"0:00";
    
    self.textoTempoPercorrido.stringValue = @"0:00";
    
    self.botaoPlayPause.target = self;
    self.botaoPlayPause.action = @selector(playPauseTrack:);
    
    self.botaoStop.target = self;
    self.botaoStop.action = @selector(stopTrack:);
    
    self.sliderTempo.target = self;
    self.sliderTempo.action = @selector(recuperaSliderTempo:);
    self.sliderTempo.floatValue = 0.0;
    self.sliderTempo.continuous = YES;
    
    self.botaoAumentaVolume.target = self;
    self.botaoAumentaVolume.action = @selector(aumentaVolume:);
    
    self.botaoDiminuiVolume.target = self;
    self.botaoDiminuiVolume.action = @selector(diminuiVolume:);
    
    self.botaoCalaBocaDoVolume.target = self;
    self.botaoCalaBocaDoVolume.action = @selector(silenciaVolume:);
    
    self.sliderVolume.target = self;
    self.sliderVolume.action = @selector(recuperaSliderVolume:);
    self.sliderVolume.floatValue = 50.0;
    self.sliderVolume.continuous = YES;
}



-(IBAction)adicionaTrack:(id)sender {
    NSLog(@"AudioPlayerController::adicionaMp3");
    
    // adiciona para usar na tableView
    if (self.listaNomesTrack.count == 0) {
        [self.listaNomesTrack addObject:[[Track alloc] initComURL:[NSURL fileURLWithPath:@"Still.mp3"] comPosicaoAtivada:@">"]];
        self.trackAtivo = 0;
    } else if (self.listaNomesTrack.count == 1) {
        [self.listaNomesTrack addObject:[[Track alloc] initComURL:[NSURL fileURLWithPath:@"2CELLOS.mp3"] comPosicaoAtivada:@""]];
    } else if (self.listaNomesTrack.count == 2) {
        [self.listaNomesTrack addObject:[[Track alloc] initComURL:[NSURL fileURLWithPath:@"TopGear1_vbr.mp3"] comPosicaoAtivada:@""]];
    } else if (self.listaNomesTrack.count == 3) {
        [self.listaNomesTrack addObject:[[Track alloc] initComURL:[NSURL fileURLWithPath:@"TopGear2_vbr.mp3"] comPosicaoAtivada:@""]];
    } else if (self.listaNomesTrack.count == 4) {
        [self.listaNomesTrack addObject:[[Track alloc] initComURL:[NSURL fileURLWithPath:@"Rufus_Welcoming_Ceremony.mp3"] comPosicaoAtivada:@""]];
    }
    
    [self.tabelaView reloadData];
}



-(IBAction)removeTrack:(id)sender {
    NSLog(@"AudioPlayerController::removeMp3");
    
    if (self.tabelaView.selectedRow == -1) {
    } else {
    }
}



-(IBAction)selecionaTrackComClique:(id)sender {
    NSLog(@"AudioPlayerController::cliqueAction");
    
    //NSInteger linha = self.tabelaView.clickedRow;
    //NSLog(@"linha = %ld",linha);
}



-(IBAction)selecionaTrackComCliqueDuplo:(id)sender {
    NSLog(@"AudioPlayerController::cliqueDuploAction");
    
    NSInteger linha = self.tabelaView.clickedRow;
    //NSLog(@"linha = %ld",linha);
    
    if (linha == -1) {
        // se clicado em qqr lugar dentro da tabelaView e nao seja a linha, nada faz
    } else {
        // Modifica a posicao do item
        ((Track*)[self.listaNomesTrack objectAtIndex:self.trackAtivo]).selecionado = @"";
        ((Track*)[self.listaNomesTrack objectAtIndex:linha]).selecionado = @">";
        
        // Cria index
        NSMutableIndexSet* mutableIndexSet = [NSMutableIndexSet indexSet];
        [mutableIndexSet addIndex:self.trackAtivo];
        [mutableIndexSet addIndex:linha];
        NSIndexSet* indexSet0 = [[NSIndexSet alloc] initWithIndexSet:mutableIndexSet];
        NSIndexSet* indexSet1 = [[NSIndexSet alloc] initWithIndex:0];
        
        // Atualiza dados
        [self.tabelaView reloadDataForRowIndexes:indexSet0 columnIndexes:indexSet1];
        self.trackAtivo = linha;
        
        // Inicia e toca o track
        [self iniciaTrack:linha];
        [self.audioPlayer play];
        [self atualizaBotaoPlayPausePara:@"play"];
    }
}



-(IBAction)playPauseTrack:(id)sender {
    NSLog(@"AudioPlayerController::playPauseTrack");
    
    if (self.audioPlayer.duration > 0) {
        // se existir, ativa o efeito de play/pause
        if (self.tocando) {
            [self.audioPlayer pause];
            [self atualizaBotaoPlayPausePara:@"pause"];
            
        } else {
            // inicia um timer para atualizar as labels de tempo (1 segundo, chama atualizaTempo, repete)
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(atualizaTempo:) userInfo:nil repeats:YES];
            [self.audioPlayer play];
            [self atualizaBotaoPlayPausePara:@"play"];
        }
        
    } else {
        // se nao existir, inicia o selecionado
        NSInteger linha = self.tabelaView.selectedRow;
        
        if (linha != -1) {
            // se tem selecionado algum
            [self iniciaTrack:linha];
            [self.audioPlayer play];
            [self atualizaBotaoPlayPausePara:@"play"];
        } else {
            // se nao tem selecionado nenhum
            if (self.listaNomesTrack.count > 1) {
                //se existe pelo menos 1 musica, toca a primeira
                [self iniciaTrack:0];
                [self.audioPlayer play];
                [self atualizaBotaoPlayPausePara:@"play"];
                
            } else {
                //se nao existe, nada faz
                [self atualizaBotaoPlayPausePara:@"pause"];
            }
        }
        
    }
}



-(IBAction)stopTrack:(id)sender {
    NSLog(@"AudioPlayerController::stopTrack");
    
    [self audioPlayerDidFinishPlaying:self.audioPlayer successfully:FALSE];
}



-(IBAction)recuperaSliderTempo:(id)sender {
    NSLog(@"AudioPlayerController::recuperaSliderTempo");
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(atualizaTempo:) userInfo:nil repeats:NO];
    
    self.audioPlayer.currentTime = self.sliderTempo.floatValue;
    
    self.textoTempoPraTerminar.stringValue = [NSString stringWithFormat:@"%@", [self formataTempo:self.audioPlayer.currentTime]];
    self.textoTempoPercorrido.stringValue = [NSString stringWithFormat:@"-%@", [self formataTempo:self.audioPlayer.duration - self.audioPlayer.currentTime]];
}



-(IBAction)aumentaVolume:(id)sender {
    NSLog(@"AudioPlayerController::aumentaVolume");
    
    float vol = self.volume + 0.05;
    
    if (vol > 1.0f) {
        self.volume = 1.0;
    } else {
        self.volume = vol;
    }
    
    self.audioPlayer.volume = self.volume;
    self.sliderVolume.floatValue = vol * 100;
}



-(IBAction)diminuiVolume:(id)sender {
    NSLog(@"AudioPlayerController::diminuiVolume");
    
    float vol = self.volume - 0.05;
    
    if (vol < 0.0f) {
        self.volume = 0.0;
    } else {
        self.volume = vol;
    }
    
    self.audioPlayer.volume = self.volume;
    self.sliderVolume.floatValue = vol * 100;
}



-(IBAction)silenciaVolume:(id)sender {
    NSLog(@"AudioPlayerController::silenciaVolume");
    
    self.volume = 0.0;
    self.audioPlayer.volume = self.volume;
    self.sliderVolume.floatValue = self.volume * 100;
}



-(IBAction)recuperaSliderVolume:(id)sender {
    NSLog(@"AudioPlayerController::recuperaSliderVolume");
    
    self.volume = self.sliderVolume.floatValue / 100;
    self.audioPlayer.volume = self.volume;
}



- (void)iniciaTrack:(NSInteger)linha {
    NSLog(@"AudioPlayerController::iniciaTocaTrack");
    
    Track * track = [self.listaNomesTrack objectAtIndex:linha];
    NSURL *urlEspecifico = [[NSBundle mainBundle] URLForResource:track.nome withExtension:track.extensao];
    NSError *error;
    
    self.audioPlayer = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:urlEspecifico error:&error];
    self.audioPlayer.delegate = self;
    self.audioPlayer.volume = self.volume;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(atualizaTempo:) userInfo:nil repeats:YES];
    
    self.sliderTempo.maxValue = self.audioPlayer.duration;
    self.textoTempoPraTerminar.stringValue = @"0:00";
    self.textoTempoPercorrido.stringValue = [NSString stringWithFormat:@"-%@", [self formataTempo:self.audioPlayer.currentTime]];
}



-(void)atualizaBotaoPlayPausePara:(NSString*)trocouPara {
    NSLog(@"AudioPlayerController::atualizaBotaoPlayPausePara");
    if ([trocouPara isEqualToString:@"play"]) {
        self.botaoPlayPause.title = @"||";
        self.tocando = TRUE;
    } else if ([trocouPara isEqualToString:@"pause"]) {
        self.botaoPlayPause.title = @">";
        self.tocando = FALSE;
        
        [self.timer invalidate];
        self.timer = nil;
    } else if ([trocouPara isEqualToString:@"stop"]) {
        self.botaoPlayPause.title = @">";
        self.tocando = FALSE;
        
        [self.timer invalidate];
        self.timer = nil;
    }
}



-(void)atualizaTempo:(NSTimer *)timer {
    NSLog(@"AudioPlayerController::atualizaTempo");
    
    self.sliderTempo.floatValue = self.audioPlayer.currentTime;
    self.textoTempoPraTerminar.stringValue = [NSString stringWithFormat:@"%@", [self formataTempo:self.audioPlayer.currentTime]];
    self.textoTempoPercorrido.stringValue = [NSString stringWithFormat:@"-%@", [self formataTempo:self.audioPlayer.duration - self.audioPlayer.currentTime]];
}



-(NSString*)formataTempo:(float)valor {
    float fMinutos = floor(lroundf(valor) / 60);
    float fSegundos = lroundf(valor) - (fMinutos * 60);
    
    int iMinutos = (int) lroundf(fMinutos);
    int iSegundos = (int) lroundf(fSegundos);
    
    return [[NSString alloc] initWithFormat:@"%d:%02d", iMinutos, iSegundos];
}



-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    //NSLog(@"AudioPlayerController::tableView");
    
    Track* track = [self.listaNomesTrack objectAtIndex:row];
    NSString* identificador = tableColumn.identifier;
    return [track valueForKey:identificador];
}



-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    //NSLog(@"AudioPlayerController::numberOfRowsInTableView");
    
    return self.listaNomesTrack.count;
}



-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"AudioPlayerController::audioPlayerDidFinishPlaying");
    
    self.textoTempoPraTerminar.stringValue = @"0:00";
    self.textoTempoPercorrido.stringValue = @"0:00";
    
    [self.audioPlayer stop];
    
    [self.timer invalidate];
    self.timer = nil;
    
    [self atualizaBotaoPlayPausePara:@"stop"];
    
    self.sliderTempo.floatValue = 0.0f;
}

@end
