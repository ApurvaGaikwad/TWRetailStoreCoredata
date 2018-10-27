//
//  ProductListVC.m
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import "ProductListVC.h"
#import "ProductCell.h"
#import "ProductDetailVC.h"
#import "RetailModel.h"
#import "header.h"
@interface ProductListVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *productArray;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ProductListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar:@"Product List"];
    self.tableview.contentInset = UIEdgeInsetsMake(4, 0, 0, 0);
    
    [self addCartButton];
    productArray = [[NSMutableArray alloc]init];
    [self getProductData];
    
    
    
    
}
-(void)getProductData
{
    NSArray *productslist = _productdict[@"products"];
    for ( NSDictionary *dictObj in productslist)
    {
        RetailModel *obj = [[RetailModel alloc]initWithDictionary:dictObj error:nil];
        [productArray addObject : obj];
    }
    
    NSLog(@"%lu",(unsigned long)productArray.count);
}


#pragma mark - Navigation

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = (ProductCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.model = [productArray objectAtIndex : indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return productArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductDetailVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProductDetailVC"];
    vc.model = [productArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
