//
//  Boss.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGDataObject.h"

@class Game;

@interface Boss : MMPGDataObject

@property (nonatomic, weak, readonly) Game* game;
@property (nonatomic, strong, readonly) NSString* weapon;
@property (nonatomic, strong, readonly) NSString* weaponCode;
@property (nonatomic, readonly) NSUInteger tier;

@property (nonatomic) BOOL defeated;

@end
