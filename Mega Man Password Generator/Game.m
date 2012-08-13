//
//  Game.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "Game.h"
#import "Boss.h"
#import "Item.h"

@implementation Game

@synthesize system, year, bosses, items;
@synthesize cellHeight, cellWidth, gridColumns, gridRows;


- (Boss*) bossWithCode:(NSString*)code {
    for (int i = 0; i < [self.bosses count]; i += 1) {
        Boss* boss = [self.bosses objectAtIndex:i];
        if (boss.code == code) {
            return boss;
        }
    }
    return nil;
}


- (Item*) itemWithCode:(NSString*)code {
    for (int i = 0; i < [self.items count]; i += 1) {
        Item* item = [self.items objectAtIndex:i];
        if (item.code == code) {
            return item;
        }
    }
    return nil;
}

@end
