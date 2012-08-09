//
//  MMPGDataObject.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-08.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGDataObject.h"
#import "Boss.h"
#import "Game.h"
#import "Item.h"

@implementation MMPGDataObject

@synthesize code, label;

- (id) init {
    @throw [NSException exceptionWithName:@"wrong initializer" reason:@"Use initWithDictionary:" userInfo:nil];
}

- (id) initWithDictionary:(NSDictionary*)dictionary {
    self = [super init];
    if (self) {
        NSEnumerator* keyEnum = [dictionary keyEnumerator];
        NSString* key = nil;
        while (key = [keyEnum nextObject]) {
            // if this value is an array or a dictionary,
            // then this will need to become a MMPGDataObject
            id value = [dictionary objectForKey:key];
            if ([value isKindOfClass:[NSArray class]]) {
                NSMutableArray* arr = [[NSMutableArray alloc] init];
                
                // based on the key, we know what class should be used to populate the items
                // note: this works because I have all four letter class names, but it won't scale
                NSString* className = [key substringToIndex:4];
                className = [NSString stringWithFormat:@"%@%@", [[className substringToIndex:1] uppercaseString], [className substringFromIndex:1]];
                
                // now get the class
                Class class = NSClassFromString(className);
                
                // now iterate over each item in this array and make it an instance
                // of the appropriate class
                for (int i = 0; i < [value count]; i += 1) {
                    MMPGDataObject* instance = [[class alloc] initWithDictionary:[value objectAtIndex:i] andParent:self];
                    [arr addObject:instance];
                }
            }
            else {
                // okay, we're dealing with a scalar value; set it
                [self setValue:value forKey:key];
            }
        }
    }
    return self;
}

- (id) initWithDictionary:(NSDictionary*)dictionary andParent:(MMPGDataObject*)dataObject {
    self = [self initWithDictionary:dictionary];
    if (self) {
        // get the approprate key for this parent
        NSString* key = [NSStringFromClass([dataObject class]) lowercaseString];
        [self setValue:dataObject forKey:key];
    }
    return self;
}

@end
