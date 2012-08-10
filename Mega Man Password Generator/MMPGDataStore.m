//
//  MMPGDataStore.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGDataStore.h"
#import "Game.h"

@implementation MMPGDataStore

+ (MMPGDataStore*) sharedStore {
    static MMPGDataStore* shared = nil;
    if (!shared) {
        shared = [[super allocWithZone:nil] init];
    }
    return shared;
}

+ (id) allocWithZone:(NSZone*)zone {
    return [self sharedStore];
}


- (void) _registerGame:(Game*)game {
    [games addObject:game];
}


- (id) init {
    self = [super init];
    if (self) {
        games = [[NSMutableArray alloc] init];
        
        // load the information I know about the various games from my stock plist file
        NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"MMPGData" ofType:@"plist"];
        NSArray* gamesFromPlist = [[NSArray alloc] initWithContentsOfFile:plistPath];
        
        // iterate over my games array and make MMPGGame objects for each
        for (int i = 0; i < [gamesFromPlist count]; i += 1) {
            Game* game = [[Game alloc] initWithDictionary:[gamesFromPlist objectAtIndex:i]];
            [self _registerGame:game];
        }
    }
    return self;
}


- (NSArray*) games {
    return (NSArray*)games;
}


- (Game*) gameAtIndexPath:(NSIndexPath*)indexPath {
    // there is only one section; simply return the game at
    // the appropriate index
    return [games objectAtIndex:indexPath.row];
}


@end