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

- (Password*) generatePassword {
    // start an array to store password units in
    NSMutableArray* units = [[NSMutableArray alloc] initWithCapacity:9];
    
    // first, how many energy tanks are in the player's
    // possession; everything else falls out from that
    Item* etankItem = [game.items objectAtIndex:0];
    int etanks = etankItem.stock;
    
    // add the red dot for the appropriate number of energy tanks
    // (A1 == 0 through A5 == 4)
    [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'A' andColumn:etanks + 1]];
    
    // now assign the appropriate dot for Air Man
    Boss* airMan = [game bossWithCode:@"air_man"];
    if (airMan.defeated) {
        if (etanks >= 3) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'B' andColumn:etanks - 2]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'E' andColumn:etanks + 3]];
        }
    }
    else {
        if (etanks == 4) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'E' andColumn:1]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'D' andColumn:etanks + 2]];
        }
    }
    
    // now assign the appropriate dot for Bubble Man
    Boss* bubbleMan = [game bossWithCode:@"bubble_man"];
    if (bubbleMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'D' andColumn:etanks + 1]];
    }
    else {
        if (etanks >= 3) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'D' andColumn:etanks - 2]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'C' andColumn:etanks + 3]];
        }
    }
    
    // now assign the appropriate dot for Crash Man
    Boss* crashMan = [game bossWithCode:@"crash_man"];
    if (crashMan.defeated) {
        if (etanks > 0) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'D' andColumn:etanks]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'C' andColumn:5]];
        }
    }
    else {
        if (etanks == 4) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'B' andColumn:1]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'E' andColumn:etanks + 2]];
        }
    }
    
    // now assign the appropriate dot for Flash Man
    Boss* flashMan = [game bossWithCode:@"flash_man"];
    if (flashMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'C' andColumn:etanks + 1]];
    }
    else {
        if (etanks >= 2) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'B' andColumn:etanks - 1]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'E' andColumn:etanks + 4]];
        }
    }
    
    // now assign the appropriate dot for Heat Man
    Boss* heatMan = [game bossWithCode:@"heat_man"];
    if (heatMan.defeated) {
        if (etanks == 4) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'C' andColumn:1]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'B' andColumn:etanks + 2]];
        }
    }
    else {
        if (etanks > 0) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'E' andColumn:etanks]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'D' andColumn:5]];
        }
    }
    
    // now assign the appropriate dot for Metal Man
    Boss* metalMan = [game bossWithCode:@"metal_man"];
    if (metalMan.defeated) {
        if (etanks > 0) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'B' andColumn:etanks]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'E' andColumn:5]];
        }
    }
    else {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'E' andColumn:etanks + 1]];
    }
    
    // now assign the appropriate dot for Quick Man
    Boss* quickMan = [game bossWithCode:@"quick_man"];
    if (quickMan.defeated) {
        if (etanks >= 2) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'C' andColumn:etanks - 1]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'B' andColumn:etanks + 4]];
        }
    }
    else {
        if (etanks >= 2) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'D' andColumn:etanks - 1]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'C' andColumn:etanks + 4]];
        }
    }
    
    // now assign the appropriate dot for Wood Man
    Boss* woodMan = [game bossWithCode:@"wood_man"];
    if (woodMan.defeated) {
        if (etanks >= 3) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'E' andColumn:etanks - 2]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'D' andColumn:etanks + 3]];
        }
    }
    else {
        if (etanks > 0) {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'C' andColumn:etanks]];
        }
        else {
            [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'B' andColumn:5]];
        }
    }

    // return the password
    return [[Password alloc] initWithUnits:units];
}

@end
