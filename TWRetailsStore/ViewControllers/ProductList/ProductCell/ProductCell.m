//
//  ProductCell.m
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import "ProductCell.h"
#import "RetailModel.h"

@implementation ProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(RetailModel *)model
{
    _model = model;
    _labelPrice.text = _model.price;
    _labelProductName.text = _model.productName;
    _imageProduct.image = [UIImage imageNamed:_model.productImage];
}
-(void)setViewShow:(UIView *)viewShow
{
    viewShow.layer.shadowOffset = CGSizeMake(1,1);
    viewShow.layer.shadowRadius = 5;
    viewShow.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    viewShow.layer.shadowOpacity = 1.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
