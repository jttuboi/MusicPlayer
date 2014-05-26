//
//  Track.m
//  MusicPlayer
//
//  Created by Jairo on 21/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import "Track.h"

@implementation Track

-(id)init {
    return [self initComMp3:@"teste.mp3" comPosicaoAtivada:@">"];
}



-(id)initComURL:(NSURL*)URL comPosicaoAtivada:(NSString*)ativo {
    self = [super init];
    
    if (self) {
        self.selecionado = ativo;
        
        //NSURL* urlll = [NSURL fileURLWithPath:@"/dir1/dir2/file.pdf"]
        //[urlll baseURL]                                           = (null)
        //[urlll parameterString]                                   = (null)
        //[urlll absoluteURL]                                       = file:///dir1/dir2/file.pdf
        //[urlll absoluteString]                                    = file:///dir1/dir2/file.pdf
        //[urlll relativeString]                                    = file:///dir1/dir2/file.pdf
        //[urlll relativePath]                                      = /dir1/dir2/file.pdf
        //[urlll path]                                              = /dir1/dir2/file.pdf
        //[[urlll path] stringByDeletingLastPathComponent]          = /dir1/dir2
        //[urlll lastPathComponent]                                 = file.pdf
        //[[urlll lastPathComponent] stringByDeletingPathExtension] = file
        //[urlll pathExtension]                                     = pdf
        //[urlll pathComponents]                                    = (
        //                                                            "/",
        //                                                            dir1,
        //                                                            dir2,
        //                                                            "file.pdf"
        //                                                            )
        
        self.nome = [[URL lastPathComponent] stringByDeletingPathExtension];
        self.extensao = [URL pathExtension];
        self.url = URL;
    }
    
    return self;
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
