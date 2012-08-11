//
//  MMPGPasswordGeneratorRegistry.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGPasswordGeneratorRegistry.h"
#import "Game.h"

// import each of the password generators
#import "MM2PasswordGenerator.h"

@implementation MMPGPasswordGeneratorRegistry


+ (id) sharedRegistry {
    static MMPGPasswordGeneratorRegistry* registry = nil;
    if (!registry) {
        registry = [[super allocWithZone:nil] init];
    }
    return registry;
}


+ (id) allocWithZone:(NSZone*)zone {
    return [self sharedRegistry];
}


- (MMPGPasswordGenerator*) generatorForGame:(Game*)game {
    // get the class for the game that was sent in
    NSString* className = [NSString stringWithFormat:@"%@PasswordGenerator", [game.code uppercaseString]];
    Class class = NSClassFromString(className);
    
    // return an instantiation of that class with this game object
    MMPGPasswordGenerator* generator = [[class alloc] initWithGame:game];
    return generator;
}

@end
