//
//  MM3PasswordGenerator.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/11/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MM3PasswordGenerator.h"
#import "Password.h"

@implementation MM3PasswordGenerator

- (Password*)generatePassword {
    NSMutableArray* units = [[NSMutableArray alloc] init];
    return [[Password alloc] initWithUnits:units];
}

@end
