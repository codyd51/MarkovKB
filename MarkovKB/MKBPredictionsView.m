//
//  MKBPredictionsView.m
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "MKBPredictionsView.h"
#import "MKBCenteredPredictionLabelCell.h"

@implementation MKBPredictionsView

-(instancetype)initWithFrame:(NSRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self setWantsLayer:YES];
        self.layer.backgroundColor = [NSColor colorWithCalibratedRed:0.8f green:0.8f blue:0.8f alpha:1.0f].CGColor;
        
        _labels = [NSMutableArray arrayWithCapacity:3];
        
        //create prediction labels
        CGFloat third = frame.size.width / 3;
        for (int i = 0; i < 3; i++) {
            NSTextField* label = [[NSTextField alloc] initWithFrame:NSRectFromCGRect(CGRectMake(third * i, 0, third, frame.size.height))];
            [label setCell:[MKBCenteredPredictionLabelCell new]];
            label.alignment = NSTextAlignmentCenter;
            label.selectable = YES;
            //label.editable = NO;
            label.font = [NSFont fontWithName:label.font.fontName size:16];
            label.stringValue = @"Preciction";
            
            //clear background
            label.bezeled = NO;
            label.drawsBackground = NO;
            
            //add this label to labels we use
            [_labels addObject:label];
            
            [self addSubview:label];
        }
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
        [NSBezierPath strokeLineFromPoint:NSPointFromCGPoint(CGPointMake(third * i, dirtyRect.size.height - offset)) toPoint:NSPointFromCGPoint(CGPointMake(third * i, offset))];
    }
}

-(void)updateWithPredictions:(NSArray *)predictions {
    for (int i = 0; i < 3; i++) {
        NSTextField* label = _labels[i];
        label.stringValue = predictions[i];
    }
}

@end
