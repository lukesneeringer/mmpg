//
//  BossView.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "BossViewController.h"
#import "GameViewController.h"
#import "Boss.h"

@implementation BossViewController

@synthesize segmentedControl, spriteView;

- (id) initWithBoss:(Boss*)bossObj andFrame:(CGRect)frame {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        boss = bossObj;
        self.view.frame = frame;
        
        // set the boss' defeated status in the view
        segmentedControl.selectedSegmentIndex = boss.defeated;
    }
    return self;
}


- (id) initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initWithBoss:andFrame:" userInfo:nil];
}


- (void) viewDidLoad {
    UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", boss.code]];
    self.spriteView.image = image;
}


- (IBAction) setBossStatus:(UISegmentedControl*)sender {
    boss.defeated = (BOOL)sender.selectedSegmentIndex;
    
    // handle any dependencies
    // if this boss is defeated and in a tier above 0, defeat
    //   all bosses in lower tiers
    // if the boss is available and in the not-highest tier,
    //   make available all bosses in higher tiers
    GameViewController* gvc = (GameViewController*)self.parentViewController;
    if (boss.defeated == YES && boss.tier > 0) {
        [gvc setDefeatedAllBossesBelowTier:boss.tier];
    }
    else if (boss.defeated == NO) {
        [gvc setAvailableAllBossesAboveTier:boss.tier];
    }
}


- (void) setBossAvailableIfAboveTier:(NSUInteger)tier {
    if (boss.tier > tier) {
        boss.defeated = NO;
        [segmentedControl setSelectedSegmentIndex:0];
    }
}


- (void) setBossDefeatedIfBelowTier:(NSUInteger)tier {
    if (boss.tier < tier) {
        boss.defeated = YES;
        [segmentedControl setSelectedSegmentIndex:1];
    }
}


@end