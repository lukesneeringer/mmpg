//
//  MMPGPasswordGeneratorRegistry.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMPGPasswordGenerator.h"

@class Game;

@interface MMPGPasswordGeneratorRegistry : NSObject

+ (MMPGPasswordGeneratorRegistry*) sharedRegistry;

- (MMPGPasswordGenerator*) generatorForGame:(Game*)game;

@end
