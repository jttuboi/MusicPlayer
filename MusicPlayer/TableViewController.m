//
//  TableViewController.m
//  MusicPlayer
//
//  Created by Jairo on 24/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

@synthesize tabelaView;
@synthesize botaoAdicionaMp3;
@synthesize botaoRemoveMp3;
@synthesize botaoPlayPause;
@synthesize textoTempoPraTerminar;
@synthesize textoTempoPercorrido;
@synthesize botaoAumentaVolume;
@synthesize botaoDiminuiVolume;
@synthesize botaoCalaBocaDoVolume;

@synthesize lista;
@synthesize mp3Ativo;



-(void)awakeFromNib {
    NSLog(@"TableViewControler::awakeFromNib");
    //    NSScrollView* scroll = [[NSScrollView alloc] initWithFrame:[tabelaView frame]];
    //
    //    NSTableColumn* col0 = [[NSTableColumn alloc] initWithIdentifier:@"selecionado"];
    //    NSTableColumn* col1 = [[NSTableColumn alloc] initWithIdentifier:@"nome"];
    //    [col0 setWidth:20.0];
    //    [col1 setWidth:200.0];
    //    [[col0 headerCell] setStringValue:@"sel"];
    //    [[col1 headerCell] setStringValue:@"Nome"];
    //    [tabelaView addTableColumn:col0];
    //    [tabelaView addTableColumn:col1];
    //
    //    [tabelaView setAllowsColumnReordering:YES];
    //    [tabelaView setAllowsColumnResizing:NO];
    //    [tabelaView setUsesAlternatingRowBackgroundColors:YES];
    //    [tabelaView setGridStyleMask:NSTableViewSolidVerticalGridLineMask];
    //    [tabelaView setGridColor:[NSColor blueColor]];
    //
    //    [tabelaView setDataSource:self];
    //    [tabelaView setDelegate:self];
    //
    //    [tabelaView setTarget:self];
    //    [tabelaView setAction:@selector(cliqueAction:)];
    //
    //    [tabelaView reloadData];
    
    //[scroll setDocumentView:tabelaView];
    //[scroll setHasVerticalScroller:YES];
    //[scroll setHasHorizontalScroller:NO];
    //[tabelaView addSubview:scroll];
    
    [tabelaView setDataSource:self];
    [tabelaView setDelegate:self];
    [tabelaView setTarget:self];
    [tabelaView setAction:@selector(cliqueAction:)];
    [tabelaView setDoubleAction:@selector(cliqueDuploAction:)];
    
    [botaoAdicionaMp3 setTarget:self];
    [botaoAdicionaMp3 setAction:@selector(adicionaMp3:)];
    
    [botaoRemoveMp3 setTarget:self];
    [botaoRemoveMp3 setAction:@selector(removeMp3:)];
}



-(id)init {
    NSLog(@"TableViewControler::init");
    self = [super init];
    if (self) {
        lista = [[NSMutableArray alloc] init];
    }
    return self;
}



-(IBAction)adicionaMp3:(id)sender {
    NSLog(@"TableViewControler::adicionaMp3");
    // um mp3 serah selecionado de algum local e enviado os dados pra cah
    if ([lista count] == 0) {
        [lista addObject:[[Mp3 alloc] initComMp3:@"Still_More_Fighting" comPosicaoAtivada:@">"]];
        mp3Ativo = 0;
    } else if ([lista count] == 1) {
        [lista addObject:[[Mp3 alloc] initComMp3:@"Rufus_Welcoming_Ceremony" comPosicaoAtivada:@""]];
    } else if ([lista count] == 2) {
        [lista addObject:[[Mp3 alloc] initComMp3:@"TopGear1_vbr" comPosicaoAtivada:@""]];
    }
    
    [tabelaView reloadData];
}



-(IBAction)removeMp3:(id)sender {
    NSLog(@"TableViewControler::removeMp3");
    
    if ([tabelaView selectedRow] == -1) {
        // se clicado em qqr lugar dentro da tabelaView e nao seja a linha
        //nada faz
    } else {
    }
}



-(IBAction)cliqueAction:(id)sender {
    NSLog(@"TableViewControler::cliqueAction");
    
    NSInteger linha = [tabelaView clickedRow];
    NSLog(@"linha = %ld",linha);
}



-(IBAction)cliqueDuploAction:(id)sender {
    NSLog(@"TableViewControler::cliqueDuploAction");
    
    NSInteger linha = [tabelaView clickedRow];
    NSLog(@"linha = %ld",linha);
    
    
    if (linha == -1) {
        // se clicado em qqr lugar dentro da tabelaView e nao seja a linha, nada faz
    } else {
        // Modifica a posicao do item
        ((Mp3*)[lista objectAtIndex:mp3Ativo]).selecionado = @"";
        ((Mp3*)[lista objectAtIndex:linha]).selecionado = @">";
        
        // Cria index
        NSMutableIndexSet* mutableIndexSet = [NSMutableIndexSet indexSet];
        [mutableIndexSet addIndex:mp3Ativo];
        [mutableIndexSet addIndex:linha];
        NSIndexSet* indexSet0 = [[NSIndexSet alloc] initWithIndexSet:mutableIndexSet];
        NSIndexSet* indexSet1 = [[NSIndexSet alloc] initWithIndex:0];
        
        // Atualiza dados e tela
        [tabelaView reloadDataForRowIndexes:indexSet0 columnIndexes:indexSet1];
        mp3Ativo = linha;
    }
}



-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    //NSLog(@"TableViewControler::tableView");
    Mp3* mp3 = [lista objectAtIndex:row];
    NSString* identificador = [tableColumn identifier];
    return [mp3 valueForKey:identificador];
}



-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    NSLog(@"TableViewControler::numberOfRowsInTableView");
    return [lista count];
}

@end
