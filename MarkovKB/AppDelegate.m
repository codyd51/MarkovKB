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
    MKBPredictingTextView* predictionView = [[MKBPredictingTextView alloc] initWithFrame:self.window.contentView.frame];
    [self.window setContentView:predictionView];
    [self.window makeKeyAndOrderFront:nil];
    [self.window makeFirstResponder:predictionView];
}

-(void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
