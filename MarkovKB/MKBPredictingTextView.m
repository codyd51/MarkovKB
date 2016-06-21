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
        CGSize inputSize = CGSizeMake(frame.size.width, frame.size.height * 0.9);
        CGSize predictionsSize = CGSizeMake(frame.size.width, frame.size.height - inputSize.height);
        
        NSScrollView* scrollView = [[NSScrollView alloc] initWithFrame:NSMakeRect(0, 0, inputSize.width, inputSize.height)];
        scrollView.borderType = NSNoBorder;
        scrollView.hasVerticalScroller = YES;
        scrollView.hasHorizontalScroller = NO;
        
        _inputView = [[NSTextView alloc] initWithFrame:NSRectFromCGRect(CGRectMake(0, 100, inputSize.width, inputSize.height - 100))];
        _inputView.backgroundColor = [NSColor colorWithCalibratedRed:(253.0f/255.0f) green:(250.0f/255.0f) blue:(190.0f/255.0f) alpha:1.0f];
        _inputView.font = [NSFont fontWithName:_inputView.font.fontName size:20];
        _inputView.richText = NO;
        _inputView.drawsBackground = YES;
        _inputView.delegate = self;
        
        [scrollView addSubview:_inputView];
        [self addSubview:scrollView];
        [scrollView setDocumentView:_inputView];
        
        _predictionsView = [[MKBPredictionsView alloc] initWithFrame:NSRectFromCGRect(CGRectMake(0, inputSize.height, predictionsSize.width, predictionsSize.height))];
        [self addSubview:_predictionsView];
        
        _predictor = [MKBTextPredictor new];
    }
    return self;
}

-(void)textDidChange:(NSNotification *)notification {
    [_inputView scrollToEndOfDocument:self];
    
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
        [_predictionsView updateWithPredictions:[_predictor getPredictions:3]];
    }
}

@end
