//
//  CartVC.m
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import "CartVC.h"
#import "CartCell.h"
#import "RetailModelObject.h"
#import "AppDelegate.h"
#import "header.h"

@interface CartVC ()<UITableViewDataSource,UITableViewDelegate,UIApplicationDelegate>
{
    NSMutableArray *cartArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *labelTotalPrice;

@end

@implementation CartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar:@"My Cart"];
    cartArray = [[NSMutableArray alloc]init];
    self.tableview.contentInset = UIEdgeInsetsMake(4, 0, 0, 0);
    
    self->cartArray = [[self getAllItems]mutableCopy];
    NSLog(@"%lu",(unsigned long)cartArray.count);
    _labelTotalPrice.text = 0;
}

-(NSArray*)getAllItems{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Category" ];
    NSArray *items = [appDelegate.managedObjectContext executeFetchRequest:request error:nil];
    return items;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self calculateTotalPrice];
}
-(void)calculateTotalPrice
{
    NSNumber *sum = 0;
    for (RetailModelObject *retailObj in cartArray) {
        NSLog(@"%@",retailObj.price);
        sum = @([sum intValue] + [retailObj.price intValue]);
        
    }
    NSLog(@"%@",sum);
    if (sum == nil) {
        _labelTotalPrice.text = @"";
        [self callalert];
        
    }
    _labelTotalPrice.text = [NSString stringWithFormat:@"%@",sum];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    RetailModelObject *item1 = [cartArray objectAtIndex:indexPath.row];
    cell.buttonremove.tag = indexPath.row;
    cell.retainObj = item1;
    return cell;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cartArray.count;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [context deleteObject:[cartArray objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        // Remove device from table view
        [cartArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self incrementOrDecrementCarCount:NO];
        [[NSNotificationCenter defaultCenter] postNotificationName : @"CartCount" object:nil];
        [self calculateTotalPrice];
    }
}
@end
