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
        CGSize inputSize = CGSizeMake(frame.size.width, frame.size.height * 0.85);
        CGSize predictionsSize = CGSizeMake(frame.size.width, frame.size.height - inputSize.height);
        
        NSTextView* inputView = [[NSTextView alloc] initWithFrame:NSRectFromCGRect(CGRectMake(0, 0, inputSize.width, inputSize.height))];
        inputView.delegate = self;
        [self addSubview:inputView];
        
        _predictionsView = [[MKBPredictionsView alloc] initWithFrame:NSRectFromCGRect(CGRectMake(0, inputSize.height, predictionsSize.width, predictionsSize.height))];
        [self addSubview:_predictionsView];
        
        _predictor = [MKBTextPredictor new];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
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
        //update predictor
        _predictor.text = text;
        NSMutableArray* predictions = [NSMutableArray arrayWithCapacity:3];
        for (int i = 0; i < 3; i++) {
            predictions[i] = [_predictor prediction];
        }
        [_predictionsView updateWithPredictions:predictions];
    }
}

@end
