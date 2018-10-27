//
//  ProductCell.h
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RetailModel;
NS_ASSUME_NONNULL_BEGIN

@interface ProductCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelProductName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UIImageView *imageProduct;
@property(nonatomic,strong) RetailModel *model;
@property (weak, nonatomic) IBOutlet UIView *viewShow;
@property (weak, nonatomic) IBOutlet UIImageView *imageSHo1;

@end

NS_ASSUME_NONNULL_END
