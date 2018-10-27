//
//  HomeVC.m
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import "HomeVC.h"
#import "HomeCell.h"
#import "ProductListVC.h"
#import "RetailModelObject.h"
#import "AppDelegate.h"
@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *homeArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBarbtn;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    [self addCartButton];
    [self setUpNavigationBar:@"Retail Store"];
    homeArray = [[NSArray alloc]init];
    
    [self detailArray];
    // Do any additional setup after loading the view.
}

- (NSArray *)JSONFromFile : (NSString *)pathForResource
{
    NSString *path = [[NSBundle mainBundle] pathForResource : pathForResource ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

-(void)detailArray
{
    homeArray = [self JSONFromFile : @"category"];
    NSLog(@"%lu",(unsigned long)homeArray.count);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIApplication.sharedApplication.statusBarHidden = YES;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    UINavigationBar *bar = [self.navigationController navigationBar];
    [bar setTintColor: [UIColor whiteColor]];
}
#pragma mark - Datasource & delegate method

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    HomeCell *cell = (HomeCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSDictionary *dict1 = [homeArray objectAtIndex : indexPath.row];
    if ([[dict1 allKeys] containsObject : @"CategoryName"])
    {
        cell.dict = dict1;
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  homeArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductListVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductListVC"];
    vc.productdict = [homeArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
