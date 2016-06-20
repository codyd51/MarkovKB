//
//  MKBCenteredPredictionLabel.m
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "MKBCenteredPredictionLabel.h"
#import "MKBCenteredPredictionLabelCell.h"

@implementation MKBCenteredPredictionLabel
@dynamic delegate;

-(instancetype)initWithFrame:(NSRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.alignment = NSTextAlignmentCenter;
        self.selectable = YES;
        self.editable = NO;
        self.font = [NSFont fontWithName:self.font.fontName size:20];
        self.stringValue = @"Prediction";
        
        //clear background
        self.bezeled = NO;
        self.drawsBackground = NO;
    }
    return self;
}
+(void)load {
    [self setCellClass:[MKBCenteredPredictionLabelCell class]];
}
-(void)mouseDown:(NSEvent *)theEvent {
    //clicked label, notify delegate
    if ([self.delegate respondsToSelector:@selector(predictionSelected:)]) {
        [self.delegate predictionSelected:self.stringValue];
    }
}
@end
