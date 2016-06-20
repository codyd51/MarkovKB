//
//  MKBTextPredictor.h
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKBTextPredictor : NSObject {
    NSArray* _tokens;
    NSMutableDictionary* _states;
}
@property (nonatomic, retain) NSString* text;
-(NSString*)prediction;
@end
