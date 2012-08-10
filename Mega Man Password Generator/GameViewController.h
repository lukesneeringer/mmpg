//
//  GameViewController.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 2012-08-10.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Game;

@interface GameViewController : UIViewController {
    Game* game;
    
    __weak IBOutlet UIScrollView* scrollView;
}

- (id) initWithGame:(Game*)aGame;

- (IBAction) generatePassword:(id)sender;

@end
