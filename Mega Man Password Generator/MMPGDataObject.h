//
//  MMPGDataObject.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMPGDataObject : NSObject

@property (nonatomic, strong) NSString* code;
@property (nonatomic, strong) NSString* label;

- (id) initWithDictionary:(NSDictionary*)dictionary;

@end
