//
//  MKBCenteredPredictionLabel.h
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MKBCenteredPredictionLabelDelegate.h"

@interface MKBCenteredPredictionLabel : NSTextField
@property (assign) id<MKBCenteredPredictionLabelDelegate> delegate;
@end
