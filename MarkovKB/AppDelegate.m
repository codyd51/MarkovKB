//
//  AppDelegate.m
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "AppDelegate.h"
#import "MKBPredictingTextView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
-(void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    //set window size
    NSRect frame = self.window.frame;
    frame.size = NSMakeSize(800, 650);
    [self.window setFrame:frame display:YES animate:NO];
    
    //keep it there!
    [self.window setMinSize:frame.size];
    [self.window setMaxSize:frame.size];
    
    //create predicting text view
    MKBPredictingTextView* predictionView = [[MKBPredictingTextView alloc] initWithFrame:self.window.contentView.frame];
    [self.window setContentView:predictionView];
    [self.window makeKeyAndOrderFront:nil];
    [self.window makeFirstResponder:predictionView];
}
@end
