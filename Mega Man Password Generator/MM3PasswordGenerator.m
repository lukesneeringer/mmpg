//
//  MM3PasswordGenerator.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/11/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MM3PasswordGenerator.h"
#import "Password.h"
#import "Game.h"
#import "Boss.h"
#import "Item.h"

@implementation MM3PasswordGenerator

- (Password*)generatePassword {
    NSMutableArray* units = [[NSMutableArray alloc] init];
    
    // set the dot for the number of energy tanks in the player's possession
    Item* energyTanks = [game.items objectAtIndex:0];
    NSArray* energyTanksArray = [NSArray arrayWithObjects:@"C5", @"E6", @"E4", @"B4", @"A5", @"C1", @"D2", @"C3", @"F2", @"A6", nil];
    NSString* coordString = [energyTanksArray objectAtIndex:energyTanks.stock];
    [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:[coordString characterAtIndex:0] andColumn:(int)[coordString characterAtIndex:1] - 48]];
    
    // set the dot for Top Man and Snake Man
    Boss* topMan = [game bossWithCode:@"top_man"];
    Boss* snakeMan = [game bossWithCode:@"snake_man"];
    if (topMan.defeated && snakeMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"blue_dot" atRow:'A' andColumn:3]];
    }
    else if (topMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'A' andColumn:3]];
    }
    else if (snakeMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'F' andColumn:6]];
    }
    
    // set the dot for Magnet Man and Needle Man
    Boss* magnetMan = [game bossWithCode:@"magnet_man"];
    Boss* needleMan = [game bossWithCode:@"needle_man"];
    if (magnetMan.defeated && needleMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"blue_dot" atRow:'D' andColumn:3]];
    }
    else if (magnetMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'F' andColumn:5]];
    }
    else if (needleMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'D' andColumn:3]];
    }
    
    // set the dot for Hard Man and Gemini Man
    Boss* hardMan = [game bossWithCode:@"hard_man"];
    Boss* geminiMan = [game bossWithCode:@"gemini_man"];
    if (hardMan.defeated && geminiMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"blue_dot" atRow:'B' andColumn:5]];
    }
    else if (hardMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'C' andColumn:4]];
    }
    else if (geminiMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'B' andColumn:5]];
    }
    
    // set the dot for Spark Man and Shadow Man
    Boss* sparkMan = [game bossWithCode:@"spark_man"];
    Boss* shadowMan = [game bossWithCode:@"shadow_man"];
    if (sparkMan.defeated && shadowMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"blue_dot" atRow:'F' andColumn:4]];
    }
    else if (sparkMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'F' andColumn:4]];
    }
    else if (shadowMan.defeated) {
        [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:'D' andColumn:6]];
    }
    
    // return back the final password
    return [[Password alloc] initWithUnits:units];
}

@end
