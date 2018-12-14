//
//  MHBrandModel.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import "MHBrandModel.h"

@implementation MHBrandModel
+ (NSDictionary *)objectClassInArray {
    return @{@"products":[MHProductModel class]};
}

@end
