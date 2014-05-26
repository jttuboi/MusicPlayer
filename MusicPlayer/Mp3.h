//
//  Mp3.h
//  MusicPlayer
//
//  Created by Jairo on 24/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mp3 : NSObject

/*
 * Atributos de base
 */
@property (copy) NSString* selecionado;

/*
 * Atributos do mp3
 */
@property (copy) NSString* nome;

/*
 * Métodos
 */
-(id)initComMp3:(NSString*)oMp3 comPosicaoAtivada:(NSString*)ativo;

@end
