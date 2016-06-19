//
//  MKBPredictingTextView.m
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "MKBPredictingTextView.h"

@implementation MKBPredictingTextView
-(instancetype)initWithFrame:(NSRect)frame {
    if ((self = [super initWithFrame:frame])) {
        NSTextView* inputView = [[NSTextView alloc] initWithFrame:frame];
        inputView.delegate = self;
        [self addSubview:inputView];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
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
