//
//  GameViewController.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-10.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "GameViewController.h"
#import "Game.h"
#import "Boss.h"
#import "Item.h"

@implementation GameViewController



- (id) initWithGame:(Game*)aGame {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        game = aGame;
        self.navigationItem.title = game.label;
    }
    return self;
}

- (IBAction)generatePassword:(UIButton *)sender {
}


- (id) initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initWithGame:" userInfo:nil];
}


- (void) viewDidLoad {
    [super viewDidLoad];

    // set up the game-specific elements on the screen
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
