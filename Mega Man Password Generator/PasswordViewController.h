//
//  PasswordViewController.h
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/11/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Password;
@class Game;

@interface PasswordViewController : UIViewController {
    Password* password;
    Game* game;
}

@property (weak, nonatomic) IBOutlet UIImageView* gridView;

- (id) initWithPassword:(Password*)passwd forGame:(Game*)aGame;

@end
