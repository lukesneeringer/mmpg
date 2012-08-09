//
//  Item.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGDataObject.h"

@class Game;

@interface Item : MMPGDataObject

@property (nonatomic, weak) Game* game;
@property (nonatomic) NSUInteger min;
@property (nonatomic) NSUInteger max;

@end
