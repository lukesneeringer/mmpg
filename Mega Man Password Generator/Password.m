//
//  Password.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "Password.h"

@implementation Password


- (id) init {
    self = [super init];
    if (self) {
        units = [[NSMutableDictionary alloc] init];
    }
    return self;
}


/**
 * return a list of the units in this password
 */
- (NSArray*) units {
    return [units allValues];
}


/**
 * clear out the password entirely
 */
- (void) clear {
    [units removeAllObjects];
}


/** 
 * add a given password piece, at the given row and column
 * if the row and column coordinate is already taken, overwrite it iff overwrite is set to true,
 *   and throw an exception otherwise
 */
- (void) setImageCode:(NSString*)code atRow:(char)rowChar andColumn:(int)columnInt allowingOverwrite:(BOOL)overwrite {
    // create the PasswordUnit object that I will ultimately return
    // back in a simplified array
    PasswordUnit* unit = [[PasswordUnit alloc] initWithImageCode:code atRow:rowChar andColumn:columnInt];
    
    // store the PasswordUnit in the appropriate location in the matrix
    NSString* coords = [NSString stringWithFormat:@"%c%i", rowChar, columnInt];
    if (overwrite || ![self usingRow:rowChar andColumn:columnInt]) {
        [units setValue:unit forKey:coords];
    }
    else {
        // oops -- we tried to write to a matrix coordinate that
        // was already taken, and we were told not to allow an override
        // throw an exception
        @throw [NSException exceptionWithName:@"Illegal overwrite"
                                       reason:@"We tried to override a matrix position on the password grid that was already taken"
                                     userInfo:[[NSDictionary alloc]
                                               initWithObjects: [[NSArray alloc] initWithObjects:[[NSString alloc] initWithFormat:@"%c", rowChar], columnInt, nil]
                                               forKeys:[[NSArray alloc] initWithObjects:@"row", @"column", nil]
                                               ]
                ];
    }
}


/**
 * add a given password piece, at the given row and column
 *   if the position is already taken, throw an exception
 * (alias for setImageCode:atRow:andColumn: that defaults overwrite to false)
 */
- (void) setImageCode:(NSString*)code atRow:(char)rowChar andColumn:(int)columnInt {
    return [self setImageCode:code atRow:rowChar andColumn:columnInt allowingOverwrite:false];
}


/**
 * return the image code (e.g. @"red_dot") for a given row and column
 *   in this password; if the coordinate is empty, return nil
 */
- (NSString*) imageCodeAtRow:(char)rowChar andColumn:(int)columnInt {
    // get the PasswordUnit object existing at this coordinate
    NSString* coords = [NSString stringWithFormat:@"%c%i", rowChar, columnInt];
    PasswordUnit* unit = [units valueForKey:coords];
    return unit.imageCode;
}


/**
 * return true if this coordinate is in use; false otherwise
 */
- (BOOL) usingRow:(char)rowChar andColumn:(int)columnInt {
    return [self imageCodeAtRow:rowChar andColumn:columnInt] != nil;
}


@end



@implementation PasswordUnit

@synthesize imageCode, row, column;

/**
 * initializes a password unit object; this also knows its row and column,
 * (note that nothing forces this to stay in sync with the Password itself)
 */
- (id) initWithImageCode:(NSString*)code atRow:(char)rowChar andColumn:(int)columnInt {
    self = [super init];
    if (self) {
        imageCode = code;
        row = rowChar;
        column = columnInt;
    }
    return self;
}


- (id) init {
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initWithImageCode:atRow:andColumn:" userInfo:nil];
}


- (void) dealloc {
    imageCode = nil;
}

@end