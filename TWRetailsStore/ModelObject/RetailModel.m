//
//  RetailModel.m
//  TWRetailsStore
//
//  Created by Apurva Gaikwad on 26/10/18.
//  Copyright © 2018 Apurva Gaikwad. All rights reserved.
//

#import "RetailModel.h"

@implementation RetailModel
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary : @{
                                                                    @"productName": @"productName",
                                                                    @"price": @"price",
                                                                    @"productImage" : @"url"
                                                            
                                                                    }];
}
@end
