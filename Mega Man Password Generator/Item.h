//
//  Item.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGDataObject.h"

@class Game;
@class Boss;

@interface Item : MMPGDataObject

@property (nonatomic, weak) Game* game;
@property (nonatomic) NSUInteger min;
@property (nonatomic) NSUInteger max;

@property (nonatomic) NSUInteger stock;

@property (nonatomic, weak) Boss* dependsOnBoss;

@end
