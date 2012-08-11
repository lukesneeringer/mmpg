//
//  Password.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Password : NSObject

@property (nonatomic, strong, readonly) NSArray* units;

- (id) initWithUnits:(NSArray*)unitArray;

@end


@interface PasswordUnit : NSObject

@property (nonatomic, readonly) int row;
@property (nonatomic, readonly) int column;
@property (nonatomic, strong, readonly) NSString* imageCode;

- (id) initWithImageCode:(NSString*)code atRow:(int)rowNumber andColumn:(int)columnNumber;

@end
