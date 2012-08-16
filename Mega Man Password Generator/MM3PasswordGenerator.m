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
#import "Item.h"

@implementation MM3PasswordGenerator

- (Password*)generatePassword {
    NSMutableArray* units = [[NSMutableArray alloc] init];
    
    // set the dot for the number of energy tanks in the player's possession
    Item* energyTanks = [game.items objectAtIndex:0];
    NSArray* energyTanksArray = [NSArray arrayWithObjects:@"C5", @"E6", @"E4", @"B4", @"A5", @"C1", @"D2", @"C3", @"F2", @"A6", nil];
    NSString* coordString = [energyTanksArray objectAtIndex:energyTanks.stock];
    [units addObject:[[PasswordUnit alloc] initWithImageCode:@"red_dot" atRow:[coordString characterAtIndex:0] andColumn:(int)[coordString characterAtIndex:1]]];
    
    // return back the final password
    return [[Password alloc] initWithUnits:units];
}

@end
