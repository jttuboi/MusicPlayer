//
//  AppDelegate.m
//  MusicPlayer
//
//  Created by Jairo on 21/5/14.
//  Copyright (c) 2014 Jairo. All rights reserved.
//

#import "AppDelegate.h"
#import "Track.h"


@implementation AppDelegate

@synthesize sliderVolume;
@synthesize valorVolume;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    Track *aTrack = [[Track alloc] init];
    [aTrack setVolume:50.0f];
    [self setTrack:aTrack];
    
    [self atualizaInterface];
    
    
    
    NSLog(@"##### applicationDidFinishLaunching");
    self.audioPlayer = [[MeuAudioPlayer alloc] init];
    [self setupAudioPlayer:@"TopGear1_vbr"];
    
    
    [self.audioPlayer setVolume:0.5f];
    
    [self createTableView];
    
    
}


@synthesize linhaSelecionada;

- (IBAction)selecionaLinha:(id)sender {
    
}


-(NSMutableArray *)dataArray {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:@{@"tocando":@">", @"nome":@"TopGear1_vbr"}];
    [array addObject:@{@"tocando":@"", @"nome":@"1.20_Still_More_Fighting"}];
    [array addObject:@{@"tocando":@"", @"nome":@"2.11_Rufus'_Welcoming_Ceremony"}];
    return array;
}

-(void)createTableView {
    NSScrollView *scrollView = [[NSScrollView alloc] initWithFrame:tabelaaaaaa.bounds];
    [scrollView setBorderType:NSBezelBorder];
    NSTableView *myTableView = [[NSTableView alloc] initWithFrame:tabelaaaaaa.bounds];
    
    NSTableColumn *tCol2 = [[NSTableColumn alloc] initWithIdentifier:@"tocando"];
    [tCol2 setWidth:20.0];
    [[tCol2 headerCell] setStringValue:@""];
    [myTableView addTableColumn:tCol2];
    
    NSTableColumn *tCol = [[NSTableColumn alloc] initWithIdentifier:@"nome"];
    [tCol setWidth:200.0];
    [[tCol headerCell] setStringValue:@"Nome"];
    [myTableView addTableColumn:tCol];
    
    [myTableView setAllowsColumnReordering:NO];
    [myTableView setAllowsColumnResizing:NO];
    
    [myTableView setUsesAlternatingRowBackgroundColors:YES];
    [myTableView setGridStyleMask:NSTableViewSolidVerticalGridLineMask];
    [myTableView setGridColor:[NSColor redColor]];
    [myTableView setRowHeight:23.0];
    [myTableView setDelegate:self];
    [myTableView setDataSource:self];
    [myTableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
    [myTableView setAutoresizesSubviews:NO];
    
    [myTableView setTarget:self];
    [myTableView setAction:@selector(clickAction:)];
    
    [scrollView setHasVerticalScroller:YES];
    [scrollView setHasHorizontalScroller:NO];
    [scrollView setAutoresizesSubviews:NO];
    [scrollView setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
    [scrollView setDocumentView:myTableView];
    
    
    [tabelaaaaaa addSubview:scrollView];
    
    
    
    
    
    //    //NSScrollView *scrollView2 = [[NSScrollView alloc] initWithFrame:tabelaaaaaaTable.bounds];
    //    //[scrollView setBorderType:NSBezelBorder];
    //    NSTableView *myTableView2 = [[NSTableView alloc] init];//initWithFrame:tabelaaaaaaTable.bounds];
    //
    //    NSTableColumn *tCol3 = [[NSTableColumn alloc] initWithIdentifier:@"tocando"];
    //    [tCol3 setWidth:20.0];
    //    [[tCol3 headerCell] setStringValue:@""];
    //    [myTableView2 addTableColumn:tCol3];
    //
    //    NSTableColumn *tCol4 = [[NSTableColumn alloc] initWithIdentifier:@"nome"];
    //    [tCol4 setWidth:200.0];
    //    [[tCol4 headerCell] setStringValue:@"Nome"];
    //    [myTableView2 addTableColumn:tCol4];
    //
    //    [myTableView2 setAllowsColumnReordering:NO];
    //    [myTableView2 setAllowsColumnResizing:NO];
    //
    //    [myTableView2 setUsesAlternatingRowBackgroundColors:YES];
    //    [myTableView2 setGridStyleMask:NSTableViewSolidVerticalGridLineMask];
    //    [myTableView2 setGridColor:[NSColor redColor]];
    //    [myTableView2 setRowHeight:23.0];
    //    [myTableView2 setDelegate:self];
    //    [myTableView2 setDataSource:self];
    //    [myTableView2 setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
    //    [myTableView2 setAutoresizesSubviews:NO];
    //
    //    [myTableView2 setTarget:self];
    //    [myTableView2 setAction:@selector(clickAction:)];
    //
    //    [tabelaaaaaaTable setValue:myTableView2];
    //    [scrollView setHasVerticalScroller:YES];
    //    [scrollView setHasHorizontalScroller:NO];
    //    [scrollView setAutoresizesSubviews:NO];
    //    [scrollView setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
    //    [scrollView setDocumentView:myTableView];
    
    
}

// TableView Datasource method implementation
-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *aString = [[self.dataArray objectAtIndex:row] objectForKey:[tableColumn identifier]];
    return aString;
}

// TableView Datasource method implementation
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    //we have only one table in the screen and thus we are not checking the row count based on the target table view
    long recordCount = [self.dataArray count];
    return recordCount;
}



-(IBAction)clickAction:(id)sender {
    NSLog(@"clickAction");
    
    
    NSArray *list = [tabelaaaaaa subviews];
    NSScrollView *scrollView = list[0];
    NSTableView *myTableView = [scrollView documentView];
    
    NSLog(@"clickedrow = %ld",[myTableView clickedRow]);
    //[myTableView objectAt];
    
    //    [self.dataArray replaceObjectAtIndex:row withObject:value];
    //    NSLog(@"You changed %@ for row:%ld, column with identifier:%@",value, row,[column identifier]);
    //[myTableView setObjectValue:1 forTableColumn:1 row:1];
    //[self.dataArray replaceObjectAtIndex:1 withObject:1];
    
    //[myTableView reloadData];
    //[myTableView reloadDataForRowIndexes:[NSIndexSet indexSetWithIndex:[myTableView clickedRow]] columnIndexes:[NSIndexSet indexSetWithIndex:0]];
    //[scrollView setDocumentView:myTableView];
    //[tabelaaaaaa addSubview:scrollView];
}














- (IBAction)aumentaVolume:(id)sender {
    float vol = [self.track volume] + 5;
    
    if (vol > 100.0f) {
        [self.track setVolume:100.0f];
    } else {
        [self.track setVolume:vol];
    }
    [self atualizaInterface];
    
    
    float vol2 = [self.audioPlayer getVolume] + 0.05;
    if (vol2 > 1.0f) {
        [self.audioPlayer setVolume:1.0f];
    } else {
        [self.audioPlayer setVolume:vol2];
    }
}

- (IBAction)diminuiVolume:(id)sender {
    float vol = [self.track volume] - 5;
    
    if (vol < 0.0f) {
        [self.track setVolume:0.0f];
    } else {
        [self.track setVolume:vol];
    }
    [self atualizaInterface];
    
    float vol2 = [self.audioPlayer getVolume] - 0.05;
    // NSLog([NSString stringWithFormat:@"%@ %.3f", @"diminui", vol2]);
    if (vol2 < 0.0f) {
        [self.audioPlayer setVolume:0.0f];
    } else {
        [self.audioPlayer setVolume:vol2];
    }
}

- (IBAction)silenciaVolume:(id)sender {
    [self.track setVolume:0.0f];
    [self atualizaInterface];
    
    [self.audioPlayer setVolume:0.0f];
}

- (IBAction)recuperaValorParaVolumeDo:(id)sender {
    float vol = [sender floatValue];
    
    [self.track setVolume:vol];
    [self atualizaInterface];
    
    [self.audioPlayer setVolume:(vol / 100)];
}

- (void)atualizaInterface {
    float vol = [self.track volume];
    
    [self.valorVolume setFloatValue:vol];
    [self.sliderVolume setFloatValue:vol];
}















@synthesize currentTimeSlider;
@synthesize playButton;
@synthesize duration;
@synthesize timeElapsed;


- (void)setupAudioPlayer:(NSString*)fileName {
    NSLog(@"##### setupAudioPlayer");
    NSString *fileExtension = @"mp3";
    
    //init the Player to get file properties to set the time labels
    [self.audioPlayer initPlayer:fileName fileExtension:fileExtension];
    
    // NSLog([NSString stringWithFormat:@"%.3f", [self.audioPlayer getAudioDuration]]);
    [self.currentTimeSlider setMaxValue:[self.audioPlayer getAudioDuration]];
    
    //init the current timedisplay and the labels. if a current time was stored
    //for this player then take it and update the time display
    [self.timeElapsed setStringValue:@"0:00"];
    
    [self.duration setStringValue:[NSString stringWithFormat:@"-%@", [self.audioPlayer timeFormat:[self.audioPlayer getAudioDuration]]]];
    
}

/*
 * PlayButton is pressed
 * plays or pauses the audio and sets
 * the play/pause Text of the Button
 */
- (IBAction)playAudioPressed:(id)playButton {
    NSLog(@"##### playAudioPressed");
    
    [self.timer invalidate];
    //play audio for the first time or if pause was pressed
    if (!self.isPaused) {
        
        [self.playButton setTitle:@"||"];
        
        //start a timer to update the time label display
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
        
        [self.audioPlayer playAudio];
        self.isPaused = TRUE;
        
    } else {
        //player is paused and Button is pressed again
        [self.playButton setTitle:@">"];
        
        [self.audioPlayer pauseAudio];
        self.isPaused = FALSE;
    }
}

/*
 * Updates the time label display and
 * the current value of the slider
 * while audio is playing
 */
- (void)updateTime:(NSTimer *)timer {
    NSLog(@"##### updateTime");
    
    if (![self.audioPlayer getPlaying]) {
        [self.timer invalidate];
        [self.playButton setTitle:@">"];
        self.isPaused = FALSE;
    }
    
    //to don't update every second. When scrubber is mouseDown the the slider will not set
    if (!self.scrubbing) {
        [self.currentTimeSlider setDoubleValue:[self.audioPlayer getCurrentAudioTime]];
    }
    
    [self.timeElapsed setStringValue:[NSString stringWithFormat:@"%@", [self.audioPlayer timeFormat:[self.audioPlayer getCurrentAudioTime]]]];
    [self.duration setStringValue:[NSString stringWithFormat:@"-%@", [self.audioPlayer timeFormat:[self.audioPlayer getAudioDuration] - [self.audioPlayer getCurrentAudioTime]]]];
}

/*
 * Sets the current value of the slider/scrubber
 * to the audio file when slider/scrubber is used
 */
- (IBAction)setCurrentTime:(id)scrubber {
    NSLog(@"##### setCurrentTime");
    //if scrubbing update the timestate, call updateTime faster not to wait a second and dont repeat it
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTime:) userInfo:nil repeats:NO];
    
    [self.audioPlayer setCurrentAudioTime:[self.currentTimeSlider doubleValue]];
    
    [self.timeElapsed setStringValue:[NSString stringWithFormat:@"%@", [self.audioPlayer timeFormat:[self.audioPlayer getCurrentAudioTime]]]];
    [self.duration setStringValue:[NSString stringWithFormat:@"-%@", [self.audioPlayer timeFormat:[self.audioPlayer getAudioDuration] - [self.audioPlayer getCurrentAudioTime]]]];
    self.scrubbing = FALSE;
}

/*
 * Sets if the user is scrubbing right now
 * to avoid slider update while dragging the slider
 */
- (IBAction)userIsScrubbing:(id)sender {
    NSLog(@"##### userIsScrubbing");
    self.scrubbing = TRUE;
}
@end
