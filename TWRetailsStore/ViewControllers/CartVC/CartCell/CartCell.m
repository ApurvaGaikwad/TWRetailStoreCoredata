//
//  CartCell.m
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import "CartCell.h"
#import "RetailModelObject.h"

@implementation CartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setRetainObj:(RetailModelObject *)retainObj
{
    _retainObj = retainObj;
    
    _labelPrice.text = [NSString stringWithFormat:@"%@",_retainObj.price];
    _labelProductName.text = _retainObj.productName;
    _productImage.image =  [UIImage imageWithData:_retainObj.productImage];
}
-(void)setViewShow:(UIView *)viewShow
{
    viewShow.layer.shadowOffset = CGSizeMake(1,1);
    viewShow.layer.shadowRadius = 5;
    viewShow.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    viewShow.layer.shadowOpacity = 1.0;
}


@end
