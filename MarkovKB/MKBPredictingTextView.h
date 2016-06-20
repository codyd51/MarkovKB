//
//  MKBPredictingTextView.h
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MKBPredictionsView.h"
#import "MKBTextPredictor.h"

@interface MKBPredictingTextView : NSView <NSTextViewDelegate> {
    MKBPredictionsView* _predictionsView;
    MKBTextPredictor* _predictor;
}

@end
