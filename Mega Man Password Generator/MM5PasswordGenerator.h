//
//  MM5PasswordGenerator.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 9/3/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "MMPGPasswordGenerator.h"
#import "Password.h"

@interface MM5PasswordGenerator : MMPGPasswordGenerator

@end


@interface MM5Password : Password

- (void) setImageCode:(NSString*)code atRow:(char)rowChar andColumn:(int)columnInt withBackupRow:(char)backupRowChar andBackupColumn:(int)backupColumnInt;

@end