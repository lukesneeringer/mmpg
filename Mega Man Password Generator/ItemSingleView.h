//
//  ItemSingleView.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemSingleView : UIView

@property (weak, nonatomic) IBOutlet UISegmentedControl* segmentedControl;
@property (weak, nonatomic) IBOutlet UIImageView* spriteView;

@end


@protocol ItemSingleViewDelegate

- (void) itemSingleView:(ItemSingleView*)isv didSetItemPossessedStatus:(BOOL)possessedStatus;

@end