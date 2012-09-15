//
//  GameViewController.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-10.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Game;
@class Boss;
@class Item;

@interface GameViewController : UIViewController {
    Game* game;
    
    __weak IBOutlet UIScrollView* scrollView;
    UIView* choicesView;
}

- (id) initWithGame:(Game*)aGame;

/**
 * Methods for inter-dependent bosses and items.
 */
- (void) setDefeatedAllBossesBelowTier:(NSUInteger)tier;
- (void) setAvailableAllBossesAboveTier:(NSUInteger)tier;
- (void) loseAllItemsDependingOnBoss:(Boss*)boss;
- (void) defeatAllPrerequisiteBossesForItem:(Item*)item;

- (IBAction) generatePassword:(id)sender;

@end
