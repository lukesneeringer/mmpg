//
//  MM4PasswordGenerator.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/18/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MM4PasswordGenerator.h"
#import "Password.h"
#import "Game.h"
#import "Boss.h"
#import "Item.h"

@implementation MM4PasswordGenerator

- (Password*) generatePassword {
    Password* password = [[Password alloc] init];
    
    // first of all, we need a counter for how many bosses are defeated
    // plus how many items are acquired
    int counter = 0;
    
    // set the appropriate dot for Toad Man and Bright Man
    Boss* toadMan = [game bossWithCode:@"toad_man"];
    Boss* brightMan = [game bossWithCode:@"bright_man"];
    if (toadMan.defeated && brightMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:1];
        counter += 2;
    }
    else if (toadMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:1];
        counter += 1;
    }
    else if (brightMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'C' andColumn:2];
        counter += 1;
    }
    else {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:2];
    }
    
    // set the appropriate dot for Pharaoh Man and Drill Man
    Boss* pharaohMan = [game bossWithCode:@"pharaoh_man"];
    Boss* drillMan = [game bossWithCode:@"drill_man"];
    if (pharaohMan.defeated && drillMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:4];
        counter += 2;
    }
    else if (pharaohMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:4];
        counter += 1;
    }
    else if (drillMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'C' andColumn:3];
        counter += 1;
    }
    else {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:3];
    }
    
    // set the appropriate dot for Ring Man and Dust Man
    Boss* ringMan = [game bossWithCode:@"ring_man"];
    Boss* dustMan = [game bossWithCode:@"dust_man"];
    if (ringMan.defeated && dustMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:5];
        counter += 2;
    }
    else if (ringMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:6];
        counter += 1;
    }
    else if (dustMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'C' andColumn:5];
        counter += 1;
    }
    else {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:5];
    }
    
    // set the appropriate dot for Skull Man and Dive Man
    Boss* skullMan = [game bossWithCode:@"skull_man"];
    Boss* diveMan = [game bossWithCode:@"dive_man"];
    if (skullMan.defeated && diveMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'E' andColumn:2];
        counter += 2;
    }
    else if (skullMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:2];
        counter += 1;
    }
    else if (diveMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'E' andColumn:1];
        counter += 1;
    }
    else {
        [password setImageCode:@"red_dot" atRow:'D' andColumn:1];
    }
    
    // set the appropriate dot for Balloon and Wire
    Item* balloon = [game itemWithCode:@"balloon"];
    Item* wire = [game itemWithCode:@"wire"];
    if (balloon.stock == 1 && wire.stock == 1) {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:3];
        counter += 2;
    }
    else if (balloon.stock == 1) {
        [password setImageCode:@"red_dot" atRow:'D' andColumn:3];
        counter += 1;
    }
    else if (wire.stock == 1) {
        [password setImageCode:@"red_dot" atRow:'D' andColumn:4];
        counter += 1;
    }
    else {
        [password setImageCode:@"red_dot" atRow:'E' andColumn:3];
    }
    
    // now set the checksum password dot
    NSArray* checksums = [[NSArray alloc] initWithObjects:@"F5", @"A6", @"B2", @"B3", @"C1", @"C4", @"C6", @"D2", @"E4", @"E6", @"F1", nil];
    NSString* checksum = [checksums objectAtIndex:counter];
    char row = [checksum characterAtIndex:0];
    int column = [checksum characterAtIndex:1] - 48;
    [password setImageCode:@"red_dot" atRow:row andColumn:column];
    
    // done!
    return password;
}

@end
