//
//  ItemMultiView.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemMultiView : UIView

@property (weak, nonatomic) IBOutlet UILabel* itemCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView* spriteView;
@property (weak, nonatomic) IBOutlet UIStepper* stepper;

@end
