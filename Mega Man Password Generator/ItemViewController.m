//
//  ItemMultiView.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "ItemViewController.h"
#import "Item.h"

@implementation ItemViewController

@synthesize spriteView;
@synthesize itemCountLabel, stepper;  // "multi" view


- (id) initWithItem:(Item *)itemObj andNibName:(NSString *)nibNameOrNil andFrame:(CGRect)frame {
    self = [super initWithNibName:nibNameOrNil bundle:nil];
    if (self) {
        item = itemObj;
        self.view.frame = frame;
    }
    return self;
}


- (id) initWithItem:(Item*)itemObj andFrame:(CGRect)frame {
    // guess the NIB based on whether the item has a max of 0 or 1
    NSString* nibName = @"";
    if (itemObj.max > 1) {
        nibName = @"ItemViewController";
    }
    else {
        nibName = @"ItemViewControllerSingle";
    }
    
    // go through the standard initialization process
    return [self initWithItem:itemObj andNibName:nibName andFrame:frame];
}


- (void) viewDidLoad {
    // set the sprite to the appropriate thing
    UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", item.code]];
    spriteView.image = image;
    
    // if there's a stepper (the "multi view"), make sure it works correctly
    if (stepper) {
        stepper.minimumValue = item.min;
        stepper.maximumValue = item.max;
    }
}


- (IBAction) updateItemCount:(id)sender {
    if (stepper) {
        itemCountLabel.text = [NSString stringWithFormat:@"%d", (int)stepper.value];
        item.stock = (int)stepper.value;
    }
}

@end
