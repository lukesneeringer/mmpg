//
//  BossView.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/10/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "BossViewController.h"
#import "Boss.h"

@implementation BossViewController

@synthesize segmentedControl, spriteView;

- (id) initWithBoss:(Boss*)bossObj andFrame:(CGRect)frame {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        boss = bossObj;
        self.view.frame = frame;
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
}


@end
