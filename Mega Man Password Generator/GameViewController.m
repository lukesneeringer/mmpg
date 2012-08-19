//
//  GameViewController.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-10.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "GameViewController.h"

// model objects
#import "Game.h"
#import "Boss.h"
#import "Item.h"

// view objects for individual items to be controlled
#import "BossViewController.h"
#import "ItemViewController.h"
#import "PasswordViewController.h"

// and we'll need the password generator and registry
#import "MMPGPasswordGeneratorRegistry.h"
#import "MMPGPasswordGenerator.h"

#define CHOICE_HEIGHT 72


@implementation GameViewController


- (id) initWithGame:(Game*)aGame {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        game = aGame;
        
        // set the title bar to the name of the game
        // being played
        self.navigationItem.title = game.label;        
    }
    return self;
}


- (id) initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initWithGame:" userInfo:nil];
}


- (void) viewDidLoad {
    [super viewDidLoad];
    
    // set the total scrolling height of the scroll view
    int choices = [game.bosses count] + [game.items count];
    CGRect choicesRect = CGRectMake(0, 0, scrollView.frame.size.width, CHOICE_HEIGHT * choices);
    choicesView = [[UIView alloc] initWithFrame:choicesRect];
    [scrollView setContentSize:choicesRect.size];
    [scrollView addSubview:choicesView];
    
    // set up the game-specific elements on the screen
    int origin_y = 0;
    CGFloat width = self.view.frame.size.width;
    for (int i = 0; i < [game.bosses count]; i += 1) {
        Boss* boss = [game.bosses objectAtIndex:i];
        
        // how large and in what location should each individual boss view be?
        CGRect bossViewFrame = CGRectMake(0, origin_y, width, CHOICE_HEIGHT);
        
        // instantiate the boss view and add it here
        BossViewController* bvc = [[BossViewController alloc] initWithBoss:boss andFrame:bossViewFrame];
        [self addChildViewController:bvc];
        
        // advance the origin numbers for the next boss view window to be shown
        origin_y += CHOICE_HEIGHT;
    }
    
    // now put any appropriate items on the screen
    for (int i = 0; i < [game.items count]; i += 1) {
        Item* item = [game.items objectAtIndex:i];
        
        // how large and in what location should each individual item view be?
        CGRect itemViewFrame = CGRectMake(0, origin_y, width, CHOICE_HEIGHT);
        
        // instantiate the appropriate item view
        ItemViewController* ivc = [[ItemViewController alloc] initWithItem:item andFrame:itemViewFrame];
        [self addChildViewController:ivc];
        
        // advance the origin numbers for the next item window
        origin_y += CHOICE_HEIGHT;
    }
}


- (void) addChildViewController:(UIViewController*)childController {
    [super addChildViewController:childController];
    [choicesView addSubview:childController.view];
}


- (void) setAvailableAllBossesAboveTier:(NSUInteger)tier {
    for (int i = 0; i < [self.childViewControllers count]; i += 1) {
        id childViewController = [self.childViewControllers objectAtIndex:i];
        if ([childViewController respondsToSelector:@selector(setBossAvailableIfAboveTier:)]) {
            [childViewController setBossAvailableIfAboveTier:tier];
        }
    }
}


- (void) setDefeatedAllBossesBelowTier:(NSUInteger)tier {
    for (int i = 0; i < [self.childViewControllers count]; i += 1) {
        id childViewController = [self.childViewControllers objectAtIndex:i];
        if ([childViewController respondsToSelector:@selector(setBossDefeatedIfBelowTier:)]) {
            [childViewController setBossDefeatedIfBelowTier:tier];
        }
    }
}


- (IBAction) generatePassword:(id)sender {
    // retrieve the appropriate password generator
    // for the given game
    MMPGPasswordGenerator* pg = [[MMPGPasswordGeneratorRegistry sharedRegistry] generatorForGame:game];
    Password* password = [pg generatePassword];
    
    // push the password display view onto the navigation controller
    PasswordViewController* pvc = [[PasswordViewController alloc] initWithPassword:password forGame:game];
    [self.navigationController pushViewController:pvc animated:YES];
}



@end
