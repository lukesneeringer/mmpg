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
    Password* password = [[Password alloc] init];
    
    // set the dot for the number of energy tanks in the player's possession
    Item* energyTanks = [game.items objectAtIndex:0];
    NSArray* energyTanksArray = [NSArray arrayWithObjects:@"C5", @"E6", @"E4", @"B4", @"A5", @"C1", @"D2", @"C3", @"F2", @"A6", nil];
    NSString* coordString = [energyTanksArray objectAtIndex:energyTanks.stock];
    [password setImageCode:@"red_dot" atRow:[coordString characterAtIndex:0] andColumn:(int)[coordString characterAtIndex:1] - 48];
    
    // set the dot for Top Man and Snake Man
    Boss* topMan = [game bossWithCode:@"top_man"];
    Boss* snakeMan = [game bossWithCode:@"snake_man"];
    if (topMan.defeated && snakeMan.defeated) {
        [password setImageCode:@"blue_dot" atRow:'A' andColumn:3];
    }
    else if (topMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:3];
    }
    else if (snakeMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:6];
    }
    
    // set the dot for Magnet Man and Needle Man
    Boss* magnetMan = [game bossWithCode:@"magnet_man"];
    Boss* needleMan = [game bossWithCode:@"needle_man"];
    if (magnetMan.defeated && needleMan.defeated) {
        [password setImageCode:@"blue_dot" atRow:'D' andColumn:3];
    }
    else if (magnetMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:5];
    }
    else if (needleMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'D' andColumn:3];
    }
    
    // set the dot for Hard Man and Gemini Man
    Boss* hardMan = [game bossWithCode:@"hard_man"];
    Boss* geminiMan = [game bossWithCode:@"gemini_man"];
    if (hardMan.defeated && geminiMan.defeated) {
        [password setImageCode:@"blue_dot" atRow:'B' andColumn:5];
    }
    else if (hardMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'C' andColumn:4];
    }
    else if (geminiMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:5];
    }
    
    // set the dot for Spark Man and Shadow Man
    Boss* sparkMan = [game bossWithCode:@"spark_man"];
    Boss* shadowMan = [game bossWithCode:@"shadow_man"];
    if (sparkMan.defeated && shadowMan.defeated) {
        [password setImageCode:@"blue_dot" atRow:'F' andColumn:4];
    }
    else if (sparkMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'F' andColumn:4];
    }
    else if (shadowMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'D' andColumn:6];
    }
    
    // set the dot for the Gemini and Needle Doc Robot stages
    Boss* docRobotGemini = [game bossWithCode:@"doc_robot_gemini"];
    Boss* docRobotNeedle = [game bossWithCode:@"doc_robot_needle"];
    if (docRobotGemini.defeated && docRobotNeedle.defeated) {
        [password setImageCode:@"blue_dot" atRow:'B' andColumn:2];
    }
    else if (docRobotGemini.defeated) {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:6];
    }
    else if (docRobotNeedle.defeated) {
        [password setImageCode:@"red_dot" atRow:'B' andColumn:2];
    }
    
    // set the dot for the Shadow and Spark Doc Robot stages
    Boss* docRobotShadow = [game bossWithCode:@"doc_robot_shadow"];
    Boss* docRobotSpark = [game bossWithCode:@"doc_robot_spark"];
    if (docRobotShadow.defeated && docRobotSpark.defeated) {
        [password setImageCode:@"blue_dot" atRow:'A' andColumn:1];
    }
    else if (docRobotShadow.defeated) {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:4];
    }
    else if (docRobotSpark.defeated) {
        [password setImageCode:@"red_dot" atRow:'A' andColumn:1];
    }
    
    // set the dot for Break Man
    Boss* breakMan = [game bossWithCode:@"break_man"];
    if (breakMan.defeated) {
        [password setImageCode:@"red_dot" atRow:'E' andColumn:1];
    }
    
    // return back the final password
    return password;
}

@end
