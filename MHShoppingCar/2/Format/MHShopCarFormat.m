//
//  MHShopCarFormat.m
//  MHShoppingCar
//
//  Created by 哈哈 on 2018/12/14.
//  Copyright © 2018 MengHeng. All rights reserved.
//

#import "MHShopCarFormat.h"
#import "MHBrandModel.h"
#import <MJExtension/MJExtension.h>

@interface MHShopCarFormat()

@property (nonatomic, strong) NSMutableArray *shopcartListArray;    /**< 购物车数据源 */
@end

@implementation MHShopCarFormat
-(void)requestShopCarData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shopcart" ofType:@"plist"];
    NSMutableArray *arr = [NSMutableArray arrayWithContentsOfFile:path];
    self.shopcartListArray = [MHBrandModel mj_objectArrayWithKeyValuesArray:arr];
    [self.delegate shopCarFormatRequestData:self.shopcartListArray];
    
}

@end