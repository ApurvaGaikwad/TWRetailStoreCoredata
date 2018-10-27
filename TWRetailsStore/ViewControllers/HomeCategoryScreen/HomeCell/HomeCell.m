//
//  HomeCell.m
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setDict:(NSDictionary *)dict
{
    _dict = dict;
    _label_Division.text = [_dict objectForKey:@"CategoryName"];
}
-(void)setHomeCellView:(UIView *)homeCellView
{
    homeCellView.layer.cornerRadius = 4.0;
    homeCellView.layer.borderColor = [[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:244.0f/255.0f alpha:1]CGColor];
    homeCellView.layer.borderWidth = 1.0;
    [homeCellView setClipsToBounds:YES];
    homeCellView.clipsToBounds = YES;
    homeCellView.layer.masksToBounds = NO;
    
}

@end
