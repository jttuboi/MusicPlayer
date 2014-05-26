//
//  Track.h
//  MusicPlayer
//
//  Created by Ryujin on 21/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject

/*
 * Atributos de base
 */
@property (copy) NSString* selecionado;
@property (strong, atomic) NSURL *url;
@property NSString* extensao;

/*
 * Atributos do mp3
 */
@property (copy) NSString* nome;

/*
 * Métodos
 */
-(id)initComURL:(NSURL*)URL comPosicaoAtivada:(NSString*)ativo;
-(id)initComMp3:(NSString*)oMp3 comPosicaoAtivada:(NSString*)ativo;

//REM
@property (assign) float volume;
@end
