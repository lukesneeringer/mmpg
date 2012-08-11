//
//  MM2PasswordGenerator.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MM2PasswordGenerator.h"
#import "Game.h"
#import "Item.h"
#import "Boss.h"
#import "Password.h"

@implementation MM2PasswordGenerator

- (NSArray*) generatePassword {
    // start an array to store password units in
    NSMutableArray* units = [[NSMutableArray alloc] initWithCapacity:9];
    
    // first, how many energy tanks are in the player's
    // possession; everything else falls out from that
    Item* etankItem = [game.items objectAtIndex:0];
    int etanks = etankItem.stock;
    
    // now get the objects for each boss in the game
    Boss* airMan = [game bossWithCode:@"air_man"];
    Boss* bubbleMan = [game bossWithCode:@"bubble_man"];
    Boss* crashMan = [game bossWithCode:@"crash_man"];
    Boss* flashMan = [game bossWithCode:@"flash_man"];
    Boss* heatMan = [game bossWithCode:@"heat_man"];
    Boss* quickMan = [game bossWithCode:@"quick_man"];
    Boss* metalMan = [game bossWithCode:@"metal_man"];
    Boss* woodMan = [game bossWithCode:@"wood_man"];
    
}

@end
