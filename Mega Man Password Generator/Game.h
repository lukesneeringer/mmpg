//
//  Game.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGDataObject.h"

@interface Game : MMPGDataObject

@property (nonatomic, strong, readonly) NSString* system;
@property (nonatomic, readonly) NSUInteger year;
@property (nonatomic, strong, readonly) NSMutableArray* bosses;
@property (nonatomic, strong, readonly) NSMutableArray* items;

@end
