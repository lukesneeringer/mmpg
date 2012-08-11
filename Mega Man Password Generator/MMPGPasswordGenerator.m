//
//  MMPGPasswordGenerator.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGPasswordGenerator.h"
#import "Game.h"

@implementation MMPGPasswordGenerator

- (id) init {
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initWithGame:" userInfo:nil];
}


- (id) initWithGame:(Game*)aGame {
    self = [super init];
    if (self) {
        game = aGame;
    }
    return self;
}


- (NSArray*) generatePassword {
    return nil;
}


@end
