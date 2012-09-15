//
//  MM6PasswordGenerator.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 9/15/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MM6PasswordGenerator.h"
#import "Password.h"
#import "Game.h"
#import "Item.h"
#import "Boss.h"

@implementation MM6PasswordGenerator

- (Password*) generatePassword {
    Password* password = [[Password alloc] init];
    
    // do we have the energy balancer?
    // (this is effectively a checksum dot; it's built into
    // every other dot chosen)
    Item* eb = [game itemWithCode:@"energy_balancer"];
    if (eb.stock) {
        [password setImageCode:@"red_dot" atRow:'E' andColumn:5];
    }
    else {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:5];
    }
    

    // the first dot controls Blizzard Man, Tomahawk Man, and the
    // Beat "B" parts
    // (remember, the "B" parts require Tomahawk Man's defeat)
    Boss* blizzardMan = [game bossWithCode:@"blizzard_man"];
    Boss* tomahawkMan = [game bossWithCode:@"tomahawk_man"];
    Item* b = [game itemWithCode:@"mm6_b"];
    if (blizzardMan.defeated && tomahawkMan.defeated && b.stock) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:1];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'F' andColumn:4];
        }
    }
    else if (tomahawkMan.defeated && b.stock) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:1];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:4];
        }
    }
    else if (tomahawkMan.defeated && blizzardMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:2];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:4];
        }
    }
    else if (blizzardMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'A' andColumn:2];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'C' andColumn:2];
        }
    }
    else if (tomahawkMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:1];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'E' andColumn:2];
        }
    }
    else {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'A' andColumn:1];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'A' andColumn:2];
        }
    }
    
    // the second dot controls Wind Man, Yamato Man, and the "E" parts
    // (connected to Yamato Man)
    Boss* windMan = [game bossWithCode:@"wind_man"];
    Boss* yamatoMan = [game bossWithCode:@"yamato_man"];
    Item* e = [game itemWithCode:@"mm6_e"];
    if (windMan.defeated && yamatoMan.defeated && e.stock) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:4];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:6];
        }
    }
    else if (windMan.defeated && yamatoMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'F' andColumn:2];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:1];
        }
    }
    else if (yamatoMan.defeated && e.stock) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:3];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:3];
        }
    }
    else if (windMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'E' andColumn:2];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:3];
        }
    }
    else if (yamatoMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'F' andColumn:1];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:5];
        }
    }
    else {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'E' andColumn:1];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:1];
        }
    }
    
    // the third dot controls Plant Man, Knight Man, and the "A" Beat parts
    // (connected to Knight Man)
    Boss* plantMan = [game bossWithCode:@"plant_man"];
    Boss* knightMan = [game bossWithCode:@"knight_man"];
    Item* a = [game itemWithCode:@"mm6_a"];
    if (plantMan.defeated && knightMan.defeated && a.stock) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:6];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'E' andColumn:4];
        }
    }
    else if (plantMan.defeated && knightMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:6];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'E' andColumn:3];
        }
    }
    else if (knightMan.defeated && a.stock) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:5];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'C' andColumn:4];
        }
    }
    else if (plantMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'A' andColumn:6];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'A' andColumn:4];
        }
    }
    else if (knightMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:5];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'A' andColumn:5];
        }
    }
    else {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'A' andColumn:5];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'A' andColumn:3];
        }
    }
    
    // the final dot controls Flame Man, Centaur Man, and the "T" Beat parts
    // (which are connected to Centaur Man)
    Boss* flameMan = [game bossWithCode:@"flame_man"];
    Boss* centaurMan = [game bossWithCode:@"centaur_man"];
    Item* t = [game itemWithCode:@"mm6_t"];
    if (flameMan.defeated && centaurMan.defeated && t.stock) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'F' andColumn:4];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'F' andColumn:3];
        }
    }
    else if (flameMan.defeated && centaurMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:4];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'E' andColumn:1];
        }
    }
    else if (centaurMan.defeated && t.stock) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'F' andColumn:3];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'F' andColumn:1];
        }
    }
    else if (flameMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'C' andColumn:4];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'A' andColumn:1];
        }
    }
    else if (centaurMan.defeated) {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'D' andColumn:3];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'C' andColumn:1];
        }
    }
    else {
        if (eb.stock) {
            [password setImageCode:@"red_dot" atRow:'C' andColumn:3];
        }
        else {
            [password setImageCode:@"red_dot" atRow:'B' andColumn:2];
        }
    }
    
    // done!
    return password;
}

@end