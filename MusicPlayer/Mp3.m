//
//  Mp3.m
//  MusicPlayer
//
//  Created by Jairo on 24/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import "Mp3.h"

@implementation Mp3

@synthesize selecionado;
@synthesize nome;

-(id)init {
    return [self initComMp3:@"teste" comPosicaoAtivada:@">"];
}

-(id)initComMp3:(NSString*)oMp3 comPosicaoAtivada:(NSString*)ativo {
    self = [super init];
    
    if (self) {
        self.selecionado = ativo;
        self.nome = oMp3;
    }
    
    return self;
}

@end
