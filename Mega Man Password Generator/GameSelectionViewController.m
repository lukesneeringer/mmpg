//
//  GameSelectionViewController.m
//  Mega Man Password Generator
//
//  Created by Luke Sneeringer on 8/9/12.
//  Copyright (c) 2012 Luke Sneeringer. All rights reserved.
//

#import "GameSelectionViewController.h"
#import "MMPGDataStore.h"
#import "Game.h"
#import "GameViewController.h"


@implementation GameSelectionViewController

- (id) initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // set the nav title
        self.navigationItem.title = @"Select Game";
    }
    return self;
}



- (NSInteger) numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}


- (NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray* games = [[MMPGDataStore sharedStore] games];
    return [games count];
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    // get the game that corresponds to this item
    Game* game = [[MMPGDataStore sharedStore] gameAtIndexPath:indexPath];
    
    // get a table view cell for this item
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"GameCell"];
    }
    
    // set the cell properties
    cell.textLabel.text = game.label;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %d", game.system, game.year];
    
    return cell;
}


- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    // get the game at this index path and create a game view controller
    // to let the user work on selecting a password
    Game* game = [[MMPGDataStore sharedStore] gameAtIndexPath:indexPath];
    GameViewController* gvc = [[GameViewController alloc] initWithGame:game];
    
    // push this onto the nav controller
    [self.navigationController pushViewController:gvc animated:YES];
}


@end
