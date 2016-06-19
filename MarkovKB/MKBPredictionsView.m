//
//  MKBPredictionsView.m
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "MKBPredictionsView.h"

@implementation MKBPredictionsView

-(instancetype)initWithFrame:(NSRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self setWantsLayer:YES];
        self.layer.backgroundColor = [NSColor colorWithCalibratedRed:0.8f green:0.8f blue:0.8f alpha:1.0f].CGColor;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    //draw seperator lines
    [[NSColor darkGrayColor] set];
    for (int i = 1; i < 3; i++) {
        CGFloat third = dirtyRect.size.width / 3;
        CGFloat offset = dirtyRect.size.height * 0.1;
        [NSBezierPath strokeLineFromPoint:NSPointFromCGPoint(CGPointMake(third * i, dirtyRect.size.height - offset)) toPoint:NSPointFromCGPoint(CGPointMake(third * i, offset))];
    }
}

@end
