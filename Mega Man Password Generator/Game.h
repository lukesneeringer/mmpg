//
//  Game.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGDataObject.h"

@class Boss;
@class Item;

@interface Game : MMPGDataObject

@property (nonatomic, strong, readonly) NSString* system;
@property (nonatomic, readonly) NSUInteger year;
@property (nonatomic, strong, readonly) NSMutableArray* bosses;
@property (nonatomic, strong, readonly) NSMutableArray* items;

- (Boss*) bossWithCode:(NSString*)code;
- (Item*) itemWithCode:(NSString*)code;

@end
