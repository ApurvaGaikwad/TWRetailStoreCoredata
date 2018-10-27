//
//  baseController.m
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import "baseController.h"
#import "BBBadgeBarButtonItem.h"
#import "header.h"
#import "CartVC.h"
#import "RetailModelObject.h"
#import "AppDelegate.h"
#import "header.h"
@interface baseController ()
{
    UILabel *label;
    BBBadgeBarButtonItem *aBarButtonItem1;
}
@end

@implementation baseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - AddCartButton

-(void)setUpNavigationBar : (NSString *)title
{
    [self.navigationController setNavigationBarHidden : NO];
    UILabel *label = [[UILabel alloc] initWithFrame : CGRectMake(0,0,170,30)];
    [label setFont : [UIFont boldSystemFontOfSize : 16.0f]];
    [label setTextColor : [UIColor whiteColor]];
    [label setText : [NSString stringWithFormat:@"%@",title]];
    [label setTextAlignment : NSTextAlignmentCenter];
    self.navigationItem.titleView = label;
    [self.navigationController.navigationBar setBarTintColor : UIColorFromRGB(0x3B939B)];
    [self.navigationController.navigationBar setTranslucent : NO];
    UIView *statusView = [[UIView alloc] initWithFrame : CGRectMake(0,-20,self.view.frame.size.width, 20)];
    statusView.backgroundColor = UIColorFromRGB(0x3B939B);
    [self.navigationController.navigationBar addSubview : statusView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"CartCount"
                                               object:nil];
}

-(void)receiveTestNotification : (NSNotification *)notification
{
    NSLog(@"%@",notification.name);

    aBarButtonItem1.badgeValue = [NSString stringWithFormat:@"%ld",(long)[USER_DEFAULTS integerForKey:@"cart_products"]];


}

-(void)addCartButton
{
    UIButton *cartButton = [[UIButton alloc] initWithFrame : CGRectMake(0,0,30,25)];
    cartButton.tag = 1;
    [cartButton setImage: [UIImage imageNamed : @"Cart"] forState:UIControlStateNormal];
    cartButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);

    [cartButton setBackgroundColor:[UIColor clearColor]];
    [cartButton addTarget:self action : @selector(cartButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    aBarButtonItem1 = [[BBBadgeBarButtonItem alloc] initWithCustomView:cartButton];
    aBarButtonItem1.badgeFont = [UIFont systemFontOfSize : 13.0];
    aBarButtonItem1.badgeValue = [NSString stringWithFormat:@"%ld",(unsigned long)[USER_DEFAULTS integerForKey:@"cart_products"]];
    aBarButtonItem1.badgeOriginX = 13;
    aBarButtonItem1.badgeOriginY = -9;
    aBarButtonItem1.badgeBGColor = [UIColor redColor];
    aBarButtonItem1.badgeTextColor = [UIColor whiteColor];
    aBarButtonItem1.shouldAnimateBadge = YES;
    aBarButtonItem1.shouldHideBadgeAtZero = YES;
    UIBarButtonItem *spaceFix1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem : UIBarButtonSystemItemFixedSpace target:nil action:NULL];
    spaceFix1.width = -20;
    self.navigationItem.rightBarButtonItems = @[spaceFix1,aBarButtonItem1];
}

-(void)cartButtonTapped
{
    CartVC *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CartVC"];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)incrementOrDecrementCarCount : (BOOL)isForIncrement
{
    NSInteger increment = [USER_DEFAULTS integerForKey:@"cart_products"];

    if (isForIncrement)
    {
        increment++;
    }
    else
    {
        increment--;
    }
    [USER_DEFAULTS setInteger:increment forKey:@"cart_products"];
    [USER_DEFAULTS synchronize];
}

-(void)callalert
{
    UIAlertController * view = [UIAlertController
                                alertControllerWithTitle:@"EMPTY CART !! "
                                message:@"No items in the cart"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    //  [view setValue:[UIImage imageNamed:@"alert"] forKey:@"image"];
    
    UIAlertAction *online = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self.navigationController popViewControllerAnimated:YES];
                                 
                             }];
    
    
    
    [view addAction:online];
    
    [self presentViewController:view animated:YES completion:nil];
    
    
}


-(NSArray*)getAllItems{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Category" ];
    NSArray *items = [appDelegate.managedObjectContext executeFetchRequest:request error:nil];
    return items;
}



@end
