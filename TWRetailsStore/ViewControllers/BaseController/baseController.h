//
//  baseController.h
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface baseController : UIViewController
-(void)addCartButton;
-(void)setUpNavigationBar : (NSString *)title;
-(void)incrementOrDecrementCarCount : (BOOL)isForIncrement;
-(void)callalert;
-(NSArray*)getAllItems;
@end

NS_ASSUME_NONNULL_END
