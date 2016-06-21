//
//  MKBPredictionsView.m
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "MKBPredictionsView.h"
#import "MKBCenteredPredictionLabel.h"
#import "MKBPredictingTextView.h"

@implementation MKBPredictionsView

-(instancetype)initWithFrame:(NSRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self setWantsLayer:YES];
        CGFloat grayVal = 0.85f;
        self.layer.backgroundColor = [NSColor colorWithCalibratedRed:grayVal green:grayVal blue:grayVal alpha:1.0f].CGColor;
        
        _labels = [NSMutableArray arrayWithCapacity:3];
        
        //create prediction labels
        CGFloat third = frame.size.width / 3;
        for (int i = 0; i < 3; i++) {
            MKBCenteredPredictionLabel* label = [[MKBCenteredPredictionLabel alloc] initWithFrame:NSRectFromCGRect(CGRectMake(third * i, 0, third, frame.size.height))];
            label.delegate = self;
            //add this label to labels we use
            [_labels addObject:label];
            [self addSubview:label];
        }
        
        //add border on bottom
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.borderColor = [NSColor lightGrayColor].CGColor;
        bottomBorder.borderWidth = 1;
        bottomBorder.frame = CGRectMake(0, 1, self.frame.size.width, 1);
        [self.layer addSublayer:bottomBorder];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    //draw seperator lines
    CGFloat third = dirtyRect.size.width / 3;
    CGFloat offset = dirtyRect.size.height * 0.1;
    [[NSColor darkGrayColor] set];
    for (int i = 1; i < 3; i++) {
        [NSBezierPath strokeLineFromPoint:NSPointFromCGPoint(CGPointMake(third * i, dirtyRect.size.height - offset)) toPoint:NSPointFromCGPoint(CGPointMake(third * i, offset + 3))];
    }
}

-(void)updateWithPredictions:(NSArray *)predictions {
    for (int i = 0; i < 3; i++) {
        NSTextField* label = _labels[i];
        
        //fade out text view
        [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
            context.duration = 0.1;
            label.animator.alphaValue = 0;
        } completionHandler:^{
            if (predictions[i]) {
                label.stringValue = predictions[i];
            }
    
            //fade back in
            [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
                context.duration = 0.1;
                label.animator.alphaValue = 1;
            } completionHandler:nil];
        }];
    }
}
-(void)predictionSelected:(NSString*)prediction {
    //add this prediction to the text
    //HAX
    MKBPredictingTextView* sup = (MKBPredictingTextView*)self.superview;
    NSTextView* input = [sup valueForKey:@"_inputView"];
    //input.str = [input.text stringByAppendingFormat:@"%@ ", prediction];
    //[input insertText:[NSString stringWithFormat:@"%@ ", prediction]];
    [input insertText:[NSString stringWithFormat:@"%@ ", prediction] replacementRange:NSMakeRange(0, NSNotFound)];
}

@end
