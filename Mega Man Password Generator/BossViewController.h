//
//  BossView.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Boss;

@interface BossViewController : UIViewController {
    Boss* boss;
}

@property (nonatomic, weak) IBOutlet UISegmentedControl* segmentedControl;
@property (nonatomic, weak) IBOutlet UIImageView* spriteView;

- (id) initWithBoss:(Boss*)bossObj andFrame:(CGRect)frame;

- (IBAction) setBossStatus:(UISegmentedControl*)sender;

@end