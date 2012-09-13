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

@implementation MM5PasswordGenerator

- (Password*) generatePassword {
    MM5Password* password = [[MM5Password alloc] init];
    
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
    
    // write the appropriate dot for Gravity Man, Wave Man, and Stone Man
    Boss* gravityMan = [game bossWithCode:@"gravity_man"];
    Boss* waveMan = [game bossWithCode:@"wave_man"];
    Boss* stoneMan = [game bossWithCode:@"stone_man"];
    if (gravityMan.defeated && waveMan.defeated && stoneMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:6];
    }
    else if (gravityMan.defeated && waveMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:5];
    }
    else if (gravityMan.defeated && stoneMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:6];
    }
    else if (waveMan.defeated && stoneMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'C' andColumn:5];
    }
    else if (gravityMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'C' andColumn:6];
    }
    else if (waveMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:6];
    }
    else if (stoneMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:5];
    }
    else {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:5];
    }
    
    // write the appropriate dot for the first "M" (Gravity), the "E" (Wave), and the "G" (Stone)
    Item* m1 = [game itemWithCode:@"mm5_m1"];
    Item* e = [game itemWithCode:@"mm5_e"];
    Item* g = [game itemWithCode:@"mm5_g"];
    if (m1.stock && e.stock && g.stock) {
        [password setImageCode:@"blue_dot" atRow:'F' andColumn:6 withBackupRow:'D' andBackupColumn:6];
    }
    else if (m1.stock && e.stock) {
        [password setImageCode:@"blue_dot" atRow:'A' andColumn:5 withBackupRow:'E' andBackupColumn:5];
    }
    else if (m1.stock && g.stock) {
        [password setImageCode:@"blue_dot" atRow:'A' andColumn:6 withBackupRow:'D' andBackupColumn:6];
    }
    else if (e.stock && g.stock) {
        [password setImageCode:@"blue_dot" atRow:'C' andColumn:5 withBackupRow:'D' andBackupColumn:5];
    }
    else if (m1.stock) {
        [password setImageCode:@"blue_dot" atRow:'C' andColumn:6 withBackupRow:'E' andBackupColumn:6];
    }
    else if (e.stock) {
        [password setImageCode:@"blue_dot" atRow:'B' andColumn:6 withBackupRow:'E' andBackupColumn:6];
    }
    else if (g.stock) {
        [password setImageCode:@"blue_dot" atRow:'B' andColumn:5 withBackupRow:'D' andBackupColumn:5];
    }
    
    // write the appropriate dot for both "A"s (Gyro, Charge) and the second "M" (Star Man's stage)
    Item* a1 = [game itemWithCode:@"mm5_a1"];
    Item* m2 = [game itemWithCode:@"mm5_m2"];
    Item* a2 = [game itemWithCode:@"mm5_a2"];
    if (a1.stock && a2.stock && m2.stock) {
        [password setImageCode:@"blue_dot" atRow:'D' andColumn:4 withBackupRow:'B' andBackupColumn:4];
    }
    else if (a1.stock && a2.stock) {
        [password setImageCode:@"blue_dot" atRow:'E' andColumn:4 withBackupRow:'B' andBackupColumn:4];
    }
    else if (a1.stock && m2.stock) {
        [password setImageCode:@"blue_dot" atRow:'E' andColumn:3 withBackupRow:'B' andBackupColumn:3];
    }
    else if (a2.stock && m2.stock) {
        [password setImageCode:@"blue_dot" atRow:'A' andColumn:3 withBackupRow:'C' andBackupColumn:3];
    }
    else if (a1.stock) {
        [password setImageCode:@"blue_dot" atRow:'A' andColumn:4 withBackupRow:'C' andBackupColumn:4];
    }
    else if (m2.stock) {
        [password setImageCode:@"blue_dot" atRow:'F' andColumn:4 withBackupRow:'C' andBackupColumn:4];
    }
    else if (a2.stock) {
        [password setImageCode:@"blue_dot" atRow:'F' andColumn:3 withBackupRow:'C' andBackupColumn:3];
    }
    else {
        [password setImageCode:@"blue_dot" atRow:'D' andColumn:3 withBackupRow:'B' andBackupColumn:3];
    }
    
    // write the appropriate dot for the "N" (Napalm Man's stage) and "V" (Crystal Man's stage)
    Item* n = [game itemWithCode:@"mm5_n"];
    Item* v = [game itemWithCode:@"mm5_v"];
    if (n.stock && v.stock) {
        [password setImageCode:@"blue_dot" atRow:'C' andColumn:1 withBackupRow:'F' andBackupColumn:1];
    }
    else if (n.stock) {
        [password setImageCode:@"blue_dot" atRow:'E' andColumn:2 withBackupRow:'A' andBackupColumn:2];
    }
    else if (v.stock) {
        [password setImageCode:@"blue_dot" atRow:'D' andColumn:2 withBackupRow:'A' andBackupColumn:2];
    }
    else {
        [password setImageCode:@"blue_dot" atRow:'B' andColumn:1 withBackupRow:'F' andBackupColumn:1];
    }
    
    return password;
}

@end


@implementation MM5Password


/**
 * add a given password place, at the given row and column
 *   if and only if the position is already taken, use the backup row and column instead
 */
- (void) setImageCode:(NSString*)code atRow:(char)rowChar andColumn:(int)columnInt withBackupRow:(char)backupRowChar andBackupColumn:(int)backupColumnInt {
    // can I use the intended row and column?
    if (![self usingRow:rowChar andColumn:columnInt]) {
        // okay, we're good; simply use the primary row and column
        return [self setImageCode:code atRow:rowChar andColumn:columnInt];
    }
    
    // okay, I'm forced to use the backup row and column
    return [self setImageCode:code atRow:backupRowChar andColumn:backupColumnInt];
}


@end
