//
//  Mp3.h
//  MusicPlayer
//
//  Created by Jairo on 24/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mp3 : NSObject

@property (copy) NSString* selecionado;
@property (copy) NSString* nome;
//@property ARQUIVO* mp3;

-(id)initComMp3:(NSString*)oMp3 comPosicaoAtivada:(NSString*)ativo;

@end
