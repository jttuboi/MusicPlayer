//
//  TableViewController.h
//  MusicPlayer
//
//  Created by Jairo on 24/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Mp3.h"

@interface TableViewController : NSObject <NSTableViewDataSource, NSTableViewDelegate>

/*
 * Atributos de componentes
 */
@property IBOutlet NSTableView* tabelaView;
@property IBOutlet NSButton* botaoAdicionaMp3;
@property IBOutlet NSButton* botaoRemoveMp3;
@property IBOutlet NSButton* botaoPlayPause;
@property IBOutlet NSTextField* textoTempoPraTerminar;
@property IBOutlet NSTextField* textoTempoPercorrido;
@property IBOutlet NSButton* botaoAumentaVolume;
@property IBOutlet NSButton* botaoDiminuiVolume;
@property IBOutlet NSButton* botaoCalaBocaDoVolume;

/*
 * Atributos de suporte
 */
@property NSMutableArray* lista;
@property NSInteger mp3Ativo;

/*
 * Actions
 */
-(IBAction)adicionaMp3:(id)sender;
-(IBAction)removeMp3:(id)sender;
-(IBAction)selecionaMp3ComClique:(id)sender;
-(IBAction)selecionaMp3ComCliqueDuplo:(id)sender;

@end
