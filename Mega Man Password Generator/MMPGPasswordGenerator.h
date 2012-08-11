//
//  MMPGPasswordGenerator.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Game;
@class Password;

@interface MMPGPasswordGenerator : NSObject {
    Game* game;
}

- (id) initWithGame:(Game*)aGame;

- (Password*) generatePassword;

@end
