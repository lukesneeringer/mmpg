//
//  PasswordViewController.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/11/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "PasswordViewController.h"
#import "Game.h"
#import "Password.h"

@implementation PasswordViewController

@synthesize gridView;

- (id) initWithPassword:(Password*)passwd forGame:(Game*)aGame {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        password = passwd;
        game = aGame;
        
        // set the navigation bar's title
        self.navigationItem.title = @"Password";
    }
    return self;
}


- (id) initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initWithPassword:forGame:" userInfo:nil];
}


- (void) viewDidLoad {
    [super viewDidLoad];

    // load the appropriate grid graphic
    UIImage* grid = [UIImage imageNamed:[NSString stringWithFormat:@"%@_grid", game.code]];
    gridView.image = grid;
}


- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
