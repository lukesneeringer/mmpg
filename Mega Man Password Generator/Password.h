//
//  Password.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Password : NSObject {
    NSMutableArray* units;
}

// designated initializer
- (id) initWithRows:(int)rows andColumns:(int)columns;

- (NSArray*) units;
- (void) setImageCode:(NSString*)code atRow:(char)rowChar andColumn:(int)columnInt allowingOverwrite:(BOOL)allowOverride;
- (void) setImageCode:(NSString*)code atRow:(char)rowChar andColumn:(int)columnInt;
- (NSString*) imageCodeAtRow:(char)rowChar andColumn:(int)columnInt;
- (BOOL) usingRow:(char)rowChar andColumn:(int)columnInt;

@end


@interface PasswordUnit : NSObject

@property (nonatomic, readonly) char row;
@property (nonatomic, readonly) int column;
@property (nonatomic, strong, readonly) NSString* imageCode;

- (id) initWithImageCode:(NSString*)code atRow:(char)rowChar andColumn:(int)columnNumber;

@end
