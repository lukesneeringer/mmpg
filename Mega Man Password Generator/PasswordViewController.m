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
    
    // determine the center point of the grid
    CGPoint center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
        
    // now place each individual password unit
    for (int i = 0; i < [password.units count]; i += 1) {
        PasswordUnit* unit = [password.units objectAtIndex:i];
        
        // calculate my offset from center for the column
        CGRect dotFrame = CGRectMake(
            center.x + game.cellWidth * (unit.column - 1 - (game.gridColumns / 2.0)),
            center.y + game.cellHeight * (unit.row - 'A' - (game.gridRows / 2.0)),
            game.cellWidth,
            game.cellHeight
        );
        
        // now place the appropriate image in the spot
        UIImage* image = [UIImage imageNamed:unit.imageCode];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = dotFrame;
        imageView.contentMode = UIViewContentModeCenter;
        
        // add the image view to the grid
        [self.view addSubview:imageView];
    }
}


- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
