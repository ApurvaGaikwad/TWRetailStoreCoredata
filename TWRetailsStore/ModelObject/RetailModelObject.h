//
//  RetailModelObject.h
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface RetailModelObject : NSManagedObject
@property (nonatomic, assign) BOOL isAddedToCart;
@property(nonatomic, assign) NSNumber *price;
@property (nonatomic, retain) NSString * productCategory;
@property (nonatomic, retain) NSData * productImage;
@property (nonatomic, retain) NSString *productName;
@end

NS_ASSUME_NONNULL_END
