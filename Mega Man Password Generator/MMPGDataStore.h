//
//  MMPGDataStore.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Game;

@interface MMPGDataStore : NSObject {
    NSMutableArray* games;
}

+ (MMPGDataStore*) sharedStore;

- (NSArray*) games;

@end

