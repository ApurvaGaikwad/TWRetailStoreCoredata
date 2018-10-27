//
//  HomeCell.h
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 25/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *homeCellView;
@property (weak, nonatomic) IBOutlet UILabel *label_Division;
@property (nonatomic,strong) NSDictionary *dict;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDivision;
@end

NS_ASSUME_NONNULL_END
