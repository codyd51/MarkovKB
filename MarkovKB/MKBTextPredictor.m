//
//  MKBTextPredictor.m
//  MarkovKB
//
//  Created by Phillip Tennen on 6/19/16.
//  Copyright © 2016 Phillip Tennen. All rights reserved.
//

#import "MKBTextPredictor.h"

@implementation MKBTextPredictor
-(instancetype)init {
    if ((self = [super init])) {
        _text = @"";
        _tokens = [NSArray new];
        _states = [NSMutableDictionary new];
    }
    return self;
}
-(void)setText:(NSString *)text {
    _text = text;
    
    //update tokens array
    _tokens = [_text componentsSeparatedByString:@" "];
    
    //for every token in the input string, add an entry if one doesn't exist and add the following token to the possibilities for that state
    //TODO optimize this so we don't reconstruct the states every time text is updated,
    //we find the diff between this state and the previous state and update states accordingly
    [_states removeAllObjects];
    for (int i = 0; i < _tokens.count; i++) {
        NSString* str = [_tokens objectAtIndex:i];
        
        //key didn't exist yet, add it
        if (!_states[str]) {
            [_states setObject:[NSMutableArray new] forKey:str];
        }
        
        //add next token to possible states for this key
        NSMutableArray<NSString*>* possibilities = _states[str];
        //the last key does not have a next state so add empty possibility for that case
        if (i != _tokens.count - 1) {
            NSString* next = [_tokens objectAtIndex:i+1];
            if (![next isEqualToString:@""]) [possibilities addObject:next];
        }
    }
}
-(NSArray*)possibilities {
    //predict using last word
    __block NSString* key = nil;
    [self.text enumerateSubstringsInRange:NSMakeRange(0, [self.text length]) options:NSStringEnumerationByWords | NSStringEnumerationReverse usingBlock:^(NSString* substring, NSRange subrange, NSRange enclosingRange, BOOL* stop) {
        key = substring;
        *stop = YES;
    }];
    
    return _states[key];
}
-(NSArray*)getPredictions:(NSUInteger)count {
    NSMutableArray* predictions = [NSMutableArray arrayWithCapacity:3];
    
    NSMutableArray* possibilities = [NSMutableArray arrayWithArray:[self possibilities]];
    for (int i = 0; i < count; i++) {
        //now, find the next token to use
        //to do so, randomly chose one of the possible tokens from this state
        NSString* next = @"";
        while ([next isEqualToString:@""]) {
            //if we don't have any possibilities, choose a random token
            if (possibilities.count != 0) {
                next = [possibilities objectAtIndex:arc4random_uniform((u_int32_t)possibilities.count)];
                //remove this word from possible predictions so we don't try and use it again
                [possibilities removeObject:next];
            }
            else next = [_tokens objectAtIndex:arc4random_uniform((u_int32_t)_tokens.count)];
        }
    }

    return [NSArray arrayWithArray:predictions];
}
@end
