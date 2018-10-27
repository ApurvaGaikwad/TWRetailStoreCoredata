//
//  ProductDetailVC.h
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "baseController.h"
@class RetailModel;
NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailVC : baseController
@property(nonatomic,strong)RetailModel *model;
@end

NS_ASSUME_NONNULL_END
