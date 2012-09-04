//
//  MM5PasswordGenerator.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 9/3/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MM5PasswordGenerator.h"
#import "Game.h"
#import "Boss.h"
#import "Item.h"
#import "Password.h"

@implementation MM5PasswordGenerator

- (Password*) generatePassword {
    Password* password = [[Password alloc] init];
    
    // write the appropriate dot for Napalm Man and Crystal Man
    Boss* napalmMan = [game bossWithCode:@"napalm_man"];
    Boss* crystalMan = [game bossWithCode:@"crystal_man"];
    if (napalmMan.defeated && crystalMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'C' andColumn:1];
    }
    else if (napalmMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'E' andColumn:2];
    }
    else if (crystalMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'D' andColumn:2];
    }
    else {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:1];
    }
    
    // write the appropriate dot for Gyro Man, Star Man, and Charge Man
    Boss* gyroMan = [game bossWithCode:@"gyro_man"];
    Boss* starMan = [game bossWithCode:@"star_man"];
    Boss* chargeMan = [game bossWithCode:@"charge_man"];
    if (gyroMan.defeated && starMan.defeated && chargeMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'D' andColumn:4];
    }
    else if (gyroMan.defeated && starMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'E' andColumn:3];
    }
    else if (starMan.defeated && chargeMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:3];
    }
    else if (gyroMan.defeated && chargeMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'E' andColumn:4];
    }
    else if (gyroMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:4];
    }
    else if (starMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:4];
    }
    else if (chargeMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:3];
    }
    else {
        [password setImageCode:@"red_dot" atRow:'D' andColumn:3];
    }
    
    
    return password;
}

@end
