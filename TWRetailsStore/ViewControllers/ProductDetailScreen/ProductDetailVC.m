//
//  ProductDetailVC.m
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import "ProductDetailVC.h"
#import "RetailModel.h"
#import "RetailModelObject.h"
#import "AppDelegate.h"
#import "UIView+Toast.h"
#import "header.h"
@interface ProductDetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageProduct;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName;
@property (weak, nonatomic) IBOutlet UILabel *labelProductPrice;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddtoCart;

@end

@implementation ProductDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar:@"Product Detail"];
    
    _labelProductName.text = _model.productName;
    _labelProductPrice.text = _model.price;
    _imageProduct.image = [UIImage imageNamed:_model.productImage];
    
    [[self getAllItems]mutableCopy];
    [self displayItems];
}




-(void)addItemWithReatailProductName:(NSString*)productName price:(NSNumber*)price andproductImage:(NSData *)productImage{
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    RetailModelObject *retailDB = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:[delegate managedObjectContext]];
    retailDB.productName=productName;
    retailDB.price=price;
    retailDB.productImage = UIImageJPEGRepresentation(_imageProduct.image, 1);
    NSError *error;
    [delegate.managedObjectContext save:&error];
    [[self getAllItems]mutableCopy];
    
}

-(void)displayItems{
    NSArray *allItems = [self getAllItems];
    for (int i=0; i<allItems.count; i++) {
        
        RetailModelObject *item1 = [allItems objectAtIndex:i];
        NSLog(@"sname:%@",item1.productName);
        NSLog(@"price:%@",item1.price);
    }
    
}

- (IBAction)addToCartClicked:(id)sender
{
    NSNumber *num1 = @([_model.price intValue]);
    [self addItemWithReatailProductName:_model.productName price:num1 andproductImage:[NSData dataWithContentsOfFile:_model.productImage]];
    [self.view makeToast:@"Product added to Cart !!" duration:2.0 position:CSToastPositionCenter];
    [self incrementOrDecrementCarCount:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName : @"CartCount" object:nil];
}


@end
