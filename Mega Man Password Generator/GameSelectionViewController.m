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


@implementation GameSelectionViewController

- (id) initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"GameCell"];
    
    // get the game that corresponds to this item
    NSArray* games = [[MMPGDataStore sharedStore] games];
    Game* game = [games objectAtIndex:indexPath.row];
    
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
