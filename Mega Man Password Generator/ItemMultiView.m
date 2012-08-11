//
//  ItemMultiView.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "ItemMultiView.h"

@implementation ItemMultiView

@synthesize itemCountLabel, spriteView, stepper;

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void) updateItemCount:(id)sender {
    itemCountLabel.text = [NSString stringWithFormat:@"%d", (int)stepper.value];
}

@end
