//
//  CartCell.h
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RetailModelObject;
NS_ASSUME_NONNULL_BEGIN

@interface CartCell : UITableViewCell
@property(nonatomic,strong) RetailModelObject *retainObj;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;

@property (weak, nonatomic) IBOutlet UIButton *buttonremove;
@property (weak, nonatomic) IBOutlet UIView *viewShow;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@end

NS_ASSUME_NONNULL_END
