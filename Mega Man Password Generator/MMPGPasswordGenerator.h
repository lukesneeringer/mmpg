//
//  MMPGPasswordGenerator.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Game;

@interface MMPGPasswordGenerator : NSObject {
    Game* game;
}

- (id) initWithGame:(Game*)aGame;

- (NSArray*) generatePassword;

@end
