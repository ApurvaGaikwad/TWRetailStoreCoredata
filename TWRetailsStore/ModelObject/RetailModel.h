//
//  RetailModel.h
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 26/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface RetailModel : JSONModel
@property(strong,nonatomic)NSString <Optional> *productName;
@property(strong,nonatomic)NSString <Optional> *price;
@property(strong,nonatomic)NSString <Optional> *productImage;
@end

NS_ASSUME_NONNULL_END
