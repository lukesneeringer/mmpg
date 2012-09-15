//
//  ItemMultiView.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <UIKit/UIKit.h>

enum ItemQuantityType {
    ItemQuantityTypeMulti = 0,
    ItemQuantityTypeSingle = 1
};

@class Item;
@class Boss;

@interface ItemViewController : UIViewController {
    Item* item;
}

@property (weak, nonatomic) IBOutlet UIImageView* spriteView;

// "multi view" only
@property (weak, nonatomic) IBOutlet UILabel* itemCountLabel;
@property (weak, nonatomic) IBOutlet UIStepper* stepper;

- (id) initWithItem:(Item*)itemObj andNibName:(NSString*)nibNameOrNil andFrame:(CGRect)frame;
- (id) initWithItem:(Item*)itemObj andFrame:(CGRect)frame;

- (IBAction) updateItemCount:(id)sender;

- (void) loseItemIfDependsOnBoss:(Boss*)boss;

@end