//
//  AppDelegate.m
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    /* create the NSTextView and add it to the window */
    NSTextView* inputView = [[NSTextView alloc] initWithFrame:self.window.contentView.frame];
    inputView.delegate = self;
    [self.window setContentView:inputView];
    [self.window makeKeyAndOrderFront:nil];
    [self.window makeFirstResponder:inputView];
}

-(void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)textDidChange:(NSNotification *)notification {
    NSTextView* inputView = notification.object;
    NSString* text = inputView.textStorage.string;
    
    //quit early if we have no text to work with
    if (text.length < 1) return;
    
    //if the last character the user entered was a space or newline,
    //update our predictions
    unichar last = [text characterAtIndex:[text length] - 1];
    if ([[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:last]) {
        
    }
}

@end
