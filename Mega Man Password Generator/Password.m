//
//  Password.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "Password.h"

@implementation Password

@synthesize units;

- (id) initWithUnits:(NSArray*)unitArray {
    self = [super init];
    if (self) {
        units = unitArray;
    }
    return self;
}


- (id) init {
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initWithUnits:" userInfo:nil];
}

@end



@implementation PasswordUnit

@synthesize imageCode, row, column;

- (id) initWithImageCode:(NSString*)code atRow:(char)rowChar andColumn:(int)columnNumber {
    self = [super init];
    if (self) {
        imageCode = code;
        row = rowChar;
        column = columnNumber;
    }
    return self;
}


- (id) init {
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initWithImageCode:atRow:andColumn:" userInfo:nil];
}

@end