//
//  MKBCenteredPredictionLabelDelegate.h
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#ifndef MKBCenteredPredictionLabelDelegate_h
#define MKBCenteredPredictionLabelDelegate_h

@protocol MKBCenteredPredictionLabelDelegate <NSTextFieldDelegate>
-(void)predictionSelected:(NSString*)prediction;
@end

#endif /* MKBCenteredPredictionLabelDelegate_h */
